from flask import Flask, jsonify
from datetime import datetime, timezone
import socket
import platform
import time

app = Flask(__name__)
START_TIME = time.time()

@app.route("/")
def home():
    return jsonify({
        "service": "PulseCheck",
        "message": "Health monitoring microservice is running"
    })

@app.route("/health")
def health():
    uptime_seconds = int(time.time() - START_TIME)

    return jsonify({
        "status": "healthy",
        "timestamp": datetime.now(timezone.utc).isoformat(),
        "hostname": socket.gethostname(),
        "python_version": platform.python_version(),
        "uptime_seconds": uptime_seconds
    })

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
