#Create environment and PipFile

````
pipenv shell
````

# Install librarys

```
pipenv install
```

# Run app

Define entry point file

```
export FLASK_APP=main.py
```

Run app
```
flask run
```

## Run externally vissible in network

Para que se pueda ver fuera de tu ordenador.

```
flask run --host=0.0.0.0
```

## Hot reloading mode for dev

```
export FLASK_ENV=development
flask run
```

# Routing

```
from markupsafe import escape

@app.route('/user/<username>')
def show_user_profile(username):
    # show the user profile for that user
    return 'User %s' % escape(username)

@app.route('/post/<int:post_id>')
def show_post(post_id):
    # show the post with the given id, the id is an integer
    return 'Post %d' % post_id

@app.route('/path/<path:subpath>')
def show_subpath(subpath):
    # show the subpath after /path/
    return 'Subpath %s' % escape(subpath)
```

Converter types:

|   |   |
|---|---|
|string   |(default) accepts any text without a slash   |
|int   |accepts positive integers   |
|float   |accepts positive floating point values   |
|path   |like string but also accepts slashes   |
|uuid   |accepts UUID strings   |

# Url building

For print a url based of route function name
```python
from flask import Flask, url_for
from markupsafe import escape

app = Flask(__name__)

@app.route('/')
def index():
    return 'index'

@app.route('/login')
def login():
    return 'login'

@app.route('/user/<username>')
def profile(username):
    return '{}\'s profile'.format(escape(username))

with app.test_request_context():
    print(url_for('index'))
    print(url_for('login'))
    print(url_for('login', next='/'))
    print(url_for('profile', username='John Doe'))
```

```
/
/login
/login?next=/
/user/John%20Doe
```

# HTTP Methods

Por defecto el metodo es GET.
Para definir el metodo:

```
from flask import request

@app.route('/login', methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        return do_the_login()
    else:
        return show_the_login_form()
```

# Static file

De donde vienen los ficheros javascript y css en una web app.

Se incluyen en la carpeta **static**, se referencian asi:

```
url_for('static', filename='style.css')
```

```static/style.css.```

# Render Templates

Los html en el webapp van en la carpeta **templates**
Para que un endpoint devuelva el html:

```
from flask import render_template

@app.route('/hello/')
@app.route('/hello/<name>')
def hello(name=None):
    return render_template('hello.html', name=name)
```

```
/application.py
/templates
    /hello.html
```


# Api returning json

Flask convertira cualsevol diccionari a json

```
@app.route("/me")
def me_api():
    user = get_current_user()
    return {
        "username": user.username,
        "theme": user.theme,
        "image": url_for("user_image", filename=user.image),
    }
```

Convertir altres tipus de dades a json amb jsonify()

```
@app.route("/users")
def users_api():
    users = get_all_users()
    return jsonify([user.to_json() for user in users])
```
