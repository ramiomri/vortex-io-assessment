import sys
import os
import json

sys.path.append(os.path.abspath(os.path.join(os.path.dirname(__file__), '..')))


def load_event(filename):
    events_dir = os.path.join(os.path.dirname(__file__), '../events')
    with open(os.path.join(events_dir, filename)) as f:
        return json.load(f)