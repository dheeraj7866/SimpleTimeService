from flask import Flask, jsonify, request
from datetime import datetime

app = Flask(__name__)

@app.route("/", methods=["GET"])
def get_time_and_ip():
    # Get the current timestamp and client IP address
    current_timestamp = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
    client_ip = request.remote_addr
    return jsonify({
        "timestamp": current_timestamp,
        "ip": client_ip
    })

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
