from app import mysql
from flask import jsonify
from flask_restx import Namespace, Resource

api = Namespace("bonds-controller", description="Controller for the bonds endpoint")

@api.route("/")
class Bonds(Resource):
    """Manages api calls made to the /bonds/ endopint."""
    @api.doc('get_bonds')
    def get(self):
        cursor = mysql.get_db().cursor()
        cursor.execute("SELECT * FROM bond_info;")
        results = cursor.fetchall()

        if not results:
            api.abort(404)
        else:
            return jsonify({"bonds": results})
