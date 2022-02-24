FROM python:3
WORKDIR vigor

RUN mkdir /opt/vigor/
COPY LICENSE /opt/vigor/
COPY README.md /opt/vigor/
COPY requirements.txt /opt/vigor/
COPY server.py /opt/vigor/
COPY uwsgi.ini /opt/vigor/
RUN python3 -m venv /venv
RUN /venv/bin/pip install --no-cache-dir -r /opt/vigor/requirements.txt
RUN /venv/bin/pip install --no-cache-dir uwsgi>=2.0.20
RUN useradd --system vigor-operator

EXPOSE 8080
CMD [ "/venv/bin/uwsgi", "--ini", "/opt/vigor/uwsgi.ini"]
