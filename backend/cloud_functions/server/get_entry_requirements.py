import os
import uuid
from typing import Generator
import pymysql
import sqlalchemy
from google.cloud.sql.connector import connector
import logging
from flask import abort, Response, jsonify

def get_entry_requirements_helper(pool: sqlalchemy.engine.Engine, country_name) -> None:
    sql = '''select EntryText from EntryRequirements e
                join Countries C on e.CountryID = C.CountryID
                where C.CountryName = :country order by e.LastModifiedDate desc'''
              
    select_stmt = sqlalchemy.text(sql)

    with pool.connect() as conn:
        rows = conn.execute(select_stmt, country = country_name).fetchall()
        entry_requirements = [row[0] for row in rows]

    return entry_requirements

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

def get_entry_requirements(request):
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
    entry_requirements = get_entry_requirements(engine, country)
    return jsonify(entry_requirements)