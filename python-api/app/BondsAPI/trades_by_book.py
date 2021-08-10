from app import mysql
from flask import jsonify
from flask_restx import Namespace, Resource

api = Namespace("trades-by-book-controller", description="Controller for the trades by book endpoint")

@api.route("/<book_name>")
@api.param("book_name", "The book name for the trade")
@api.response(404, 'Book name not found')
class Trades_by_book_name(Resource):
    """Manages api calls made to the /trades/ endopint."""
    @api.doc('get_trade_by_book_name')
    def get(self, book_name):
        '''Fetch a trade given its book name'''
        cursor = mysql.get_db().cursor()
        cursor.execute("SELECT * FROM trade AS t WHERE t.book_name=%s",[book_name])
        results = cursor.fetchall()

        if not results:
            api.abort(404)
        else:
            return jsonify({"trades": results})
