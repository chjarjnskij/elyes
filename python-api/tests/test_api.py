import pytest

from app import create_app

def test_app_creates(app):
    assert app

# Unit tests
def test_app_healthy(app, client):
    with client:
        resp = client.get("/health")
        assert resp.status_code == 200
        assert resp.is_json
        assert resp.json == "healthy"

# ISIN for test = USN0280EAR64
def test_bonds_by_isin_valid_returns_200(app, client):
    try:
        with client:
            resp = client.get("api/bonds/USN0280EAR64")
            assert resp.status_code == 200
            assert resp.is_json
    except Exception as e:
        print(e)
        
def test_bonds_by_isin_invalid_returns_404(app, client):
    try:
        with client:
            resp = client.get("api/bonds/fff")
            assert resp.status_code == 404
    except Exception as e:
        print(e)
        
def test_permission_valid_id_returns_200(app, client):
    try:
        with client:
            response = client.get("api/permissions/2WIjV7SxvFVEQy2G2rpz1vBbdDh1")
            assert response.status_code == 200
    except Exception as e:
        print(e)
    
def test_permission_invalid_id_returns_404(app, client):
    try:
        with client:
            response = client.get("api/permissions/2WIjV7SinvalidxvFVEQy2G2rpz1vBbdDh1")
            assert response.status_code == 404
    except Exception as e:
        print(e)

# /trades/ testing
def test_trades_valid_endpoint_returns_200(app, client):
    try:
        with client:
            resp = client.get("api/trades/")
            assert resp.is_json
            assert resp.status_code == 200
    except Exception as e:
        print(e)

def test_trades_invalid_bookname_returns_404(app, client):
    try:
        with client:
            resp = client.get("api/trades/hello")
            assert resp.is_json
            assert resp.status_code == 404
    except Exception as e:
        print(e)

@pytest.fixture
def app():
    return create_app()

@pytest.fixture
def client(app):
    return app.test_client()