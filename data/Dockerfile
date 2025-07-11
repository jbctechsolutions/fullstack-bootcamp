# Sample Dockerfile for Jupyter Notebooks
FROM jupyter/base-notebook:latest

COPY requirements.txt /tmp/
RUN pip install --no-cache-dir -r /tmp/requirements.txt || true

WORKDIR /home/jovyan/work

CMD ["start-notebook.sh"] 