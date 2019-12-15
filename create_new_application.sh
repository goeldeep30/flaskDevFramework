echo "Enter name of new Application"
read name
mkdir -p $name/$name
cd $name/
virtualenv venv
source venv/bin/activate
pip3 install flask
pip3 freeze > requirements.txt

touch app.py .gitignore README.md requirements.txt
echo "
# waiting for imports_1, please do not remove this line
from ${name} import app
# waiting for imports_2, please do not remove this line

if __name__ == '__main__':
   app.run(debug = True)
" > app.py
touch $name/model.py
touch $name/routes.py
touch $name/__init__.py
echo "
# waiting for imports_1, please do not remove this line
from flask import render_template
from ${name} import app
# waiting for imports_2, please do not remove this line

@app.route('/')
def home():
   return '<h1>Flask Home Page<h1>'
" > $name/routes.py
echo "
# waiting for imports_1, please do not remove this line
from flask import Flask
# waiting for imports_2, please do not remove this line

app = Flask(__name__)
from ${name} import routes
" > $name/__init__.py

mkdir -p $name/templates
touch $name/templates/template.html
mkdir -p $name/static/js
touch $name/static/js/app.js
mkdir -p $name/static/css
touch $name/static/css/app.css


deactivate

echo "Application ${name} created successfully"
echo "use command source venv/bin/activate to activate virtualenv"
echo "use command deactivate to deactivate the virtualenv"
