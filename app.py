import json
import os
from sutime import SUTime
from flask import Flask, request, jsonify

app = Flask(__name__)
jar_files = os.path.join(os.path.dirname(__file__), "jars")
sutime = SUTime(jars=jar_files, mark_time_ranges=True)


@app.route("/")
def home():
    return "OK"


@app.route("/parse")
def parse():
    text = request.args.get("text")
    return jsonify(sutime.parse(text)), 200


if __name__ == "__main__":
    app.run(debug=True, host="0.0.0.0")
