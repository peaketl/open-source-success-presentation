import os
from flask import Flask, request, jsonify, render_template_string
import psycopg

app = Flask(__name__)

# Database connection parameters
# This is a simple example, in production you should use environment variables
db_params = {
    "dbname": "postgres",
    "user": "cos_data_tech",
    "password": "cos_data_tech",
    "host": os.getenv("POSTGRES_SERVER", '127.0.0.1'),
    "port": 5432
}

# HTML Template for the form
form_template = """
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>Data Entry Form</title>
  </head>
  <body>
    <h1>Enter Data</h1>
    <form action="/submit" method="post">
      <label for="name">Name:</label><br>
      <input type="text" id="name" name="name"><br><br>
      <input type="submit" value="Submit">
    </form>
    <h2>Stored Data</h2>
    <ul>
      {% for entry in entries %}
        <li>{{ entry }}</li>
      {% endfor %}
    </ul>
  </body>
</html>
"""

@app.route('/', methods=['GET'])
def index():
    try:
        conn = psycopg.connect(**db_params)
        cursor = conn.cursor()
        cursor.execute('CREATE TABLE IF NOT EXISTS entries (id SERIAL PRIMARY KEY, name TEXT NOT NULL);')
        cursor.execute('SELECT name FROM entries;')
        entries = [row[0] for row in cursor.fetchall()]
        cursor.close()
        conn.commit()
        conn.close()
        return render_template_string(form_template, entries=entries)
    except Exception as e:
        return jsonify({'error': str(e)})

@app.route('/submit', methods=['POST'])
def submit():
    name = request.form.get('name')
    if not name:
        return jsonify({'error': 'Name is required'}), 400

    try:
        conn = psycopg.connect(**db_params)
        cursor = conn.cursor()
        cursor.execute('INSERT INTO entries (name) VALUES (%s);', (name,))
        conn.commit()
        cursor.close()
        conn.close()
        return index()
    except Exception as e:
        return jsonify({'error': str(e)})

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)