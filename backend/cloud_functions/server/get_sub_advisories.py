import os
import uuid
from typing import Generator
import pymysql
import sqlalchemy
from google.cloud.sql.connector import connector
import logging
from flask import abort, Response, jsonify

def get_sub_advisories_helper(pool: sqlalchemy.engine.Engine, country_name) -> None:
    sql = '''select SA.SubAdvisoryText from Advisory
              join Countries C on Advisory.CountryID = C.CountryID
              join SubAdvisory SA on Advisory.AdvisoryID = SA.AdvisoryID
              where C.CountryName = :country order by SA.LastModifiedDate desc;'''
              
    select_stmt = sqlalchemy.text(sql)

    with pool.connect() as conn:
        rows = conn.execute(select_stmt, country = country_name).fetchall()
        sub_advisories = [row[0] for row in rows]

    return sub_advisories

def init_connection_engine() -> sqlalchemy.engine.Engine:
    def getconn() -> pymysql.connections.Connection:
        connection_name = "safetravels-349107:us-central1:safetravels"
        user_name = "root"
        pwd = "safetravels_pwd"
        db_name = "safetravels"
        conn: pymysql.connections.Connection = connector.connect(
            connection_name,
            "pymysql",
            user = user_name,
            password = pwd,
            db = db_name,
        )
        return conn

    engine = sqlalchemy.create_engine(
        "mysql+pymysql://",
        creator=getconn,
    )
    return engine

def get_sub_advisories(request):
    """Responds to any HTTP request.
    Args:
        request (flask.Request): HTTP request object.
    Returns:
        The response text or any set of values that can be turned into a
        Response object using
        `make_response <http://flask.pocoo.org/docs/1.0/api/#flask.Flask.make_response>`.
    """
    country = None
    
    if request.args and 'country' in request.args:
        country = request.args.get('country')
    
    if country == None:
        logging.error(RuntimeError('Country expected as argument'))
        return abort(Response('Country expected as argument'))

    engine = init_connection_engine()
    sub_advisories = get_sub_advisories_helper(engine, country)
    return jsonify(sub_advisories)