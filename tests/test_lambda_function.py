from conftest import load_event
from lambda_app.app import lambda_handler



def test_valid_message():
    event = load_event('event.json')  
    result = lambda_handler(event, None)
    assert result['statusCode'] == 200
    assert result['body'] == "The received message is: '{\"message\": \"hello world\"}'"

def test_empty_message():
    event = load_event('event_no_message.json')
    result = lambda_handler(event, None)
    assert result['statusCode'] == 400
    assert result['body'] == "no message"

def test_missing_body():
    event = load_event('event_missing_body.json')
    result = lambda_handler(event, None)
    assert result['statusCode'] == 400
    assert result['body'] == "missing body"

def test_internal_server_error(monkeypatch):
    def mock_process(message):
        raise Exception("Simulate error")

    monkeypatch.setattr('lambda_app.app.process', mock_process)
    
    event = load_event('event.json')  
    result = lambda_handler(event, None)
    assert result['statusCode'] == 500
    assert result['body'] == "error message: Simulate error"
