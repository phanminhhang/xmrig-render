from flask import Flask
from threading import Thread
import logging

# Tắt log rác của Flask để đỡ rối mắt khi xem log đào
log = logging.getLogger('werkzeug')
log.setLevel(logging.ERROR)

app = Flask('')

@app.route('/')
def home():
    return "I am alive! Mining is running..."

def run():
    app.run(host='0.0.0.0', port=80)

def keep_alive():
    t = Thread(target=run)
    t.start()

if __name__ == "__main__":
    keep_alive()
