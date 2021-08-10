import os
from app.extensions import mysql

from flask import Flask, jsonify
from flask_cors import CORS
from flask_restx import Api

from app.BondsAPI.bonds import api as bonds
from app.BondsAPI.permissions import api as permissions
from app.BondsAPI.trades import api as trades
from app.BondsAPI.trades_by_book import api as trades_by_book
from app.BondsAPI.transactions import api as transactions


def create_app():
    # Create a Flask application
    app = Flask(__name__)

    # Allow cross-origin resource sharing to let the front end access the backend
    CORS(app)

    # The flask_restx library helps us to create documentation at the /swagger-ui/ endpoint
    api = Api(app, title="Bonds API", version="0.1", doc="/api/swagger-ui/")

    # Connect your database
    if os.getenv("GAE_ENV", "").startswith("standard"):
        # For production in Google App Engine Standard
        app.config["MYSQL_DATABASE_HOST"] = os.environ["CLOUD_SQL_CONNECTION_HOST"]
        app.config["MYSQL_DATABASE_PORT"] = 3306
        app.config["MYSQL_DATABASE_USER"] = os.environ["DB_USER"]
        app.config["MYSQL_DATABASE_PASSWORD"] = os.environ["DB_PASS"]
        app.config["MYSQL_DATABASE_DB"] = os.environ["DB_NAME"]
    else:
        # For local execution
        app.config["MYSQL_DATABASE_HOST"] = "localhost"
        app.config["MYSQL_DATABASE_PORT"] = 3306
        app.config["MYSQL_DATABASE_USER"] = "root"
        app.config["MYSQL_DATABASE_PASSWORD"] = "Pa55w.rd"
        app.config["MYSQL_DATABASE_DB"] = "test_db"

    # Start the connector (found in extensions.py)
    mysql.init_app(app)

    # We add the Transactions module
    api.add_namespace(transactions, path="/api/transactions")
    api.add_namespace(permissions, path="/api/permissions")
    api.add_namespace(trades, path="/api/trades")
    api.add_namespace(trades_by_book, path="/api/trades_by_book")
    api.add_namespace(bonds, path="/api/bonds")

    @app.route("/health")
    def health():
        return jsonify("healthy")

    return app
