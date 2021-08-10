from flask_restx import Namespace, Resource
from flask import jsonify
from app import mysql

api = Namespace("transactions-controller", description="Controller for the transactions endpoint")

@api.route("/")
class Transactions(Resource):
    """Transactions Controller manages the api calls made to the /transactions/ endpoint."""
    @api.doc('get_all_transactions')
    def get(self):
        """Returns all bonds transactions"""
        cursor = mysql.get_db().cursor()
        query = "SELECT * FROM transactions"
        cursor.execute(query)
        results = cursor.fetchall()
        return jsonify({"transactions": results})
