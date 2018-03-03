from model.User import User

def auth(username, password):
    if not username or not password:
        return None
    user = User.query.one({'username': username, 'password': password})
    return user