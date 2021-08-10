from app import mysql
from flask import jsonify
from flask_restx import Namespace, Resource

api = Namespace("trades-controller", description="Controller for the trades endpoint")

@api.route("/")
class Trades(Resource):
    """Trades Controller manages the api calls made to the /trades/ endpoint."""
    @api.doc('get_all_trades')
    def get(self):
        """Returns all bond trades"""
        cursor = mysql.get_db().cursor()
        query = "SELECT * FROM trade"
        cursor.execute(query)
        results = cursor.fetchall()
        return jsonify({"trades": results})
@api.route("/<isin>")
@api.param("isin", "The ISIN for the trade")
@api.response(404, 'ISIN not found')
class Trades_by_ISIN(Resource):
    """Manages api calls made to the /trades/ endopint."""
    @api.doc('get_trade_by_isin')
    def get(self, isin):
        '''Fetch a trade given its ISIN number'''
        cursor = mysql.get_db().cursor()
        cursor.execute("SELECT * FROM trade AS t WHERE t.isin=%s",[isin])
        results = cursor.fetchall()

        if not results:
            api.abort(404)
        else:
            return jsonify({"trades": results})

