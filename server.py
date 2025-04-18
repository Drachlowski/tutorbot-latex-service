from flask import Flask, request, send_file
import os
import uuid

app = Flask(__name__)

@app.route("/compile", methods=["POST"])
def compile_latex():
    tex_code = request.files['file'].read().decode("utf-8")
    file_id = str(uuid.uuid4())
    tex_path = f"/tmp/{file_id}.tex"
    pdf_path = f"/tmp/{file_id}.pdf"

    with open(tex_path, "w") as f:
        f.write(tex_code)

    os.system(f"pdflatex -output-directory=/tmp {tex_path}")

    return send_file(pdf_path, mimetype="application/pdf")