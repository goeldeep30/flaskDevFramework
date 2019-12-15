echo "WARNING: Make Sure You Are Inside Project's Package"
echo "Enter name of package"
read package
echo "Enter name of Model"
read name
touch "${name}.py"
sed -i "/# waiting for imports_2, please do not remove this line/c\from ${package}.${name} import *\n# waiting for imports_2, please do not remove this line" routes.py

echo "Model ${name} created successfully"
