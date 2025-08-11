FROM python:3.9-slim-bullseye
WORKDIR /app
COPY . /app

RUN apt-get update && pip install -r requirements.txt

CMD ["python", "app.py"]
