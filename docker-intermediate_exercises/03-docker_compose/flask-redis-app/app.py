#!/usr/bin/env python

from flask import Flask, Response, request, redirect
from redis import Redis
import json 
import os, socket

app = Flask(__name__)
redis = Redis(host="redis", port=6379)

@app.route('/api')
def hello():
    redis.incr('totalhits')
    return 'A warm hello from container no %s ! I have been seen %s times.' %(socket.gethostname(), redis.get('totalhits'))

@app.route('/api/get_all_members', methods = ['GET'])
def get_all_members():
    members = redis.smembers('members')
    allmembers = []
    for member_id in members:
        member = redis.hgetall('member:' + str(member_id))
        allmembers.append(member)
    return Response(json.dumps(allmembers), mimetype='application/json')

@app.route('/api/new_member', methods = ['POST'])
def new_member():
    firstname = request.form['firstname']
    lastname = request.form['lastname']
    member_id = str(redis.incrby('next_member_id',1000))
    redis.hmset('member:'+member_id,dict(firstname=firstname, lastname=lastname))
    redis.sadd('members',member_id)
    return redirect('/static')


if __name__ == "__main__":
    app.run(host="0.0.0.0", debug=True)
