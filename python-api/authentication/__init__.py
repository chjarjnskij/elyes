# Using the filename __init__.py tells Python that the flaskr directory should be treated as a package

import os
import json
from flask import Flask
from flask import g


# settings file
import flaskr.settings_info

from .login_decorator import login_required
from .db_setup import init_app, close_db, get_db

# This is a factory method that flask recognizes
def create_app(test_config=None):
    # create and configure the app, it's localised but will be returned at the end of the method
    app = Flask(__name__, instance_relative_config=True)
    secret_data = None

    # There is a more elegant way of organising the data in the json file so it is
    # more easily accessed in your app after it has been loaded
    with open(flaskr.settings_info.SECRETS_FILE) as json_file:
        secret_data = json.load(json_file)

    # Can load up data that is required across your flask app into the app.config object
    # for more information on this go to https://flask.palletsprojects.com/en/1.1.x/config/
    app.config.from_mapping(
        SECRET_KEY='dev',   # default secret key
        DATABASE=os.path.join(app.instance_path, 'flaskr.mysql'),
        SECRET_DATA = secret_data   # load up the secrets file from GCP
    )

    if test_config is None:
        # load the instance config, if it exists, when not testing
        # See - https://flask.palletsprojects.com/en/1.1.x/config/
        app.config.from_pyfile('config.py', silent=True)
    else:
        # load the test config if passed in
        app.config.from_mapping(test_config)

    # ensure the instance folder exists
    # https://uniwebsidad.com/libros/explore-flask/chapter-5/instance-folder
    try:
        os.makedirs(app.instance_path)
    except OSError:
        pass

    # a test route - a simple page that says hello
    @app.route('/isrunning')
    def hello():
        return 'Your app is running!'

    # init the DB and services
    # We've broken down the app into Blueprints to make it easy to follow and test
    # You need the Flask app object to perform some of the functions below
    with app.app_context():
        conn = db_setup.init_app(app)

        # define your ReSTful endpoints
        from . import auth_endpoints
        app.register_blueprint(auth_endpoints.bp)
        auth_endpoints.session_setup(app)
        auth_endpoints.oauth_setup(app)

        from .controllers import security_controller
        app.register_blueprint( security_controller.bp )
        security_controller.init_service()

    return app