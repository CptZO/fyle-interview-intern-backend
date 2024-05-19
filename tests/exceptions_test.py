import pytest
from core.libs.exceptions import FyleError

def test_fyle_error():
    error = FyleError(400, 'test error')
    assert error.message == 'test error'
    assert error.status_code == 400

    error_dict = error.to_dict()
    assert error_dict['message'] == 'test error'
