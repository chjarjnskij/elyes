from flask_restx import Namespace, Resource
from flask import jsonify
from app import mysql

api = Namespace("permissions-controller", description="Controller for the permissions endpoint")

@api.route("/<user_id>")
@api.param("user_id", "The User ID for the logged in user")
@api.response(404, 'User not found')
class Permissions(Resource):
    """Manages api calls made to the /permissions/ endopint."""
    @api.doc('get_trade_books')
    def get(self, user_id):
        '''Fetch a user given its user_id'''
        cursor = mysql.get_db().cursor()
        cursor.execute("SELECT book_name FROM book_2_trader AS b WHERE b.user_id=%s", [user_id])
        results = cursor.fetchall()

        if not results:
            api.abort(404)
        else:
            return jsonify({"book_trades": results})

