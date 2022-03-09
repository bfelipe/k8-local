FROM python:3.9.9

WORKDIR /usr/src/app

COPY . .
RUN pip install --no-cache-dir -r requirements.txt

COPY main.py .
EXPOSE 8080
CMD [ "python", "./main.py" ]
