FROM python:3

RUN mkdir /opt/vigor/
COPY vigor/* /opt/vigor/
RUN python3 -m venv /venv
RUN /venv/bin/pip install --no-cache-dir -r /opt/vigor/requirements.txt
RUN /venv/bin/pip install --no-cache-dir uwsgi>=2.0.20
RUN useradd --system vigor-operator
RUN mkdir /keys/
RUN chown vigor-operator:vigor-operator /keys/
RUN chmod 700 /keys/

EXPOSE 8080
CMD [ "/venv/bin/uwsgi", "--ini", "/opt/vigor/uwsgi.ini"]
