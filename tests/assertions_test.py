import pytest
from core.libs import assertions

def test_assert_auth():
    with pytest.raises(assertions.FyleError):
        assertions.assert_auth(False, 'auth failed')

def test_assert_true():
    with pytest.raises(assertions.FyleError):
        assertions.assert_true(False, 'assertion failed')

def test_assert_found():
    with pytest.raises(assertions.FyleError):
        assertions.assert_found(None, 'not found')

def test_assert_valid():
    with pytest.raises(assertions.FyleError):
        assertions.assert_valid(False, 'invalid')
