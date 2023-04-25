from app import app
from flask import render_template, request, redirect, url_for, session
import mysql.connector


@app.route("/",methods = ['GET'])
def index():
    return render_template('index.html')

@app.route("/query",methods=['GET', 'POST'])
def query():
    return render_template('query.html')

@app.route("/statistics",methods = ['GET'])
def statistics():
    return render_template('statistics.html')
