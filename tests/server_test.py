from core import app

def test_ready():
    client = app.test_client()
    response = client.get('/')
    assert response.status_code == 200
    data = response.json
    assert data['status'] == 'ready'
    assert 'time' in data

def test_handle_error():
    client = app.test_client()
    response = client.get('/nonexistent')
    assert response.status_code == 404
    data = response.json
    assert data['error'] == 'NotFound'
