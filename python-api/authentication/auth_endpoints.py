# In order to use the app object and avoid circular references import as shown below
from flask import current_app as app

import functools
# AS simeple as possbile flask google oAuth 2.0
from flask import Flask, redirect, url_for, session
from authlib.integrations.flask_client import OAuth
import os
from datetime import timedelta

# decorator for routes that should be accessible only by logged in users
from flaskr import login_required

import flaskr.settings_info


from flask import (
    Blueprint, flash, g, redirect, render_template, request, session, url_for
)
from werkzeug.security import generate_password_hash

from flaskr import get_db

# bp is assigned with the URL slug "/auth/"
bp = Blueprint('auth', __name__, url_prefix='/auth')

# dotenv setup
from dotenv import load_dotenv
load_dotenv()


# Session config
# in order to create a session object you need the app object.
# The session object must be assigned a secret_key
def session_setup(app):
    app.secret_key = os.getenv(flaskr.settings_info.APP_SECRET_KEY) 
    app.config[flaskr.settings_info.SESSION_COOKIE_NAME] = 'google-login-session'
    app.config[flaskr.settings_info.PERMANENT_SESSION_LIFETIME] = timedelta(minutes=5)

# security level 3 using OAuth
# oAuth Setup
oauth = OAuth(app)
google = None
def oauth_setup(app):
    json_data = app.config['SECRET_DATA']['web']
    google = oauth.register(
        name=flaskr.settings_info.PROVIDER,
        client_id = json_data['client_id'],              #os.getenv(flaskr.settings_info.GOOGLE_CLIENT_ID),
        client_secret = json_data['client_secret'],      #os.getenv(flaskr.settings_info.GOOGLE_CLIENT_SECRET),
        access_token_url = json_data['token_uri'],       #'https://oauth2.googleapis.com/token',
        access_token_params = None,
        authorize_url = json_data['auth_uri'],          #'https://accounts.google.com/o/oauth2/auth',
        authorize_params = None,
        api_base_url = 'https://www.googleapis.com/oauth2/v1/',
        userinfo_endpoint = 'https://openidconnect.googleapis.com/v1/userinfo',  # This is only needed if using openId to fetch user info
        client_kwargs = {'scope': 'openid email profile'},
    )

# All the routes below can only be accessed by using the slug /auth/
# so root is /auth/, login is /auth/login/ etc.

# step 6 from the interaction diagram on wiki 
@bp.route('/')
@login_required
def home_handler():
    email = dict(session)['profile']['email']
    return f'Hello, you are logge in as {email}!'

# step 2 from the interaction diagram on wiki 
@bp.route('/login')
def login():
    google = oauth.create_client('google')  # create the google oauth client
    redirect_uri = url_for('auth.authorize', _external=True)
    # this line is the magic, it sends a request to google GCP IAM using the oauth settings
    # if you loggedin in successfully, then you are redirected to the URI defined in redirect_url
    return google.authorize_redirect(redirect_uri)

# step 5 from the interaction diagram on wiki 
@bp.route('/authorize')
def authorize():
    # if we get this far (we pass the guard), it's time to setup the session object
    
    google = oauth.create_client(flaskr.settings_info.PROVIDER)  # create the google oauth client
    token = google.authorize_access_token()  # Access token from google (needed to get user info)
    resp = google.get('userinfo')  # userinfo contains stuff u specificed in the scrope
    user_info = resp.json()
    user = oauth.google.userinfo()  # uses openid endpoint to fetch user info
    # Here you use the profile/user data that you got and query your database find/register the user
    # and set ur own data in the session not the profile from google
    session['profile'] = user_info
    session.permanent = True  # make the session permanant so it keeps existing after broweser gets closed
    return redirect('/auth')


@bp.route('/logout')
def logout():
    for key in list(session.keys()):
        session.pop(key)
    return redirect('/auth')

# security level 1 using email/password in your database
# If you use this apporoach don't use the OAuth approach above
@bp.route('/register', methods=('GET', 'POST'))
def register():
    if request.method == 'POST':
        username = request.form['username']
        password = request.form['password']
        db = get_db()
        error = None

        if not username:
            error = 'Username is required.'
        elif not password:
            error = 'Password is required.'
        elif db.execute(
            'SELECT id FROM user WHERE username = ?', (username,)
        ).fetchone() is not None:
            error = f"User {username} is already registered."

        if error is None:
            db.execute(
                'INSERT INTO user (username, password) VALUES (?, ?)',
                (username, generate_password_hash(password))
            )
            db.commit()
            return redirect(url_for('auth.login'))

        flash(error)

    return render_template('auth/register.html')