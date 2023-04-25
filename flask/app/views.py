from app import app
from flask import render_template, request, redirect, url_for, session
import mysql.connector


@app.route("/",methods = ['GET'])
def index():
    return render_template('index.html')

@app.route("/query",methods=['GET', 'POST'])
def query():
    if request.method == 'GET':
        connection=mysql.connector.connect(
            user="root", password="sdl_sql2", database="PathodrugDB",port=3306,host="mysqldb"
        )
        print("DB connected")

        cursor=connection.cursor()
        cursor.execute("SELECT * FROM Gene")
        genes = cursor.fetchall()
        connection.close()
        print(genes)

        return render_template('query.html')

@app.route("/statistics",methods = ['GET'])
def statistics():
    return render_template('statistics.html')
