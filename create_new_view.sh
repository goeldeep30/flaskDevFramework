echo "WARNING: Make Sure You Are Inside Project's Package"
echo "Enter name of View"
read name

mkdir -p templates/$name
touch templates/$name/"${name}View.html"
echo "
{% extends \"layout/layout.html\" %}
{% block content%}
  <h1>${name} View</h1>
{% endblock content%}

" > templates/$name/"${name}View.html"
touch templates/$name/"${name}View.py"
mkdir -p static/css/$name
touch static/css/$name/"${name}View.css"
mkdir -p static/js/$name
touch static/js/$name/"${name}View.js"
echo "
@app.route('/${name}')
def ${name}_def():
   return render_template('${name}/${name}View.html')


" >> routes.py


echo "View ${name} created successfully"
