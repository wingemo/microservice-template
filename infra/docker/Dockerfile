# Använd Ubuntu Server som basbild
FROM ubuntu:latest

# Installera Python och andra nödvändiga paket
RUN apt-get update && apt-get install -y python3 python3-pip

# Kopiera applikationskoden till containern
COPY . /app

# Ange arbetskatalogen
WORKDIR /app

# Installera Python-paket
RUN pip3 install -r requirements.txt

# Ange kommandot för att köra applikationen
CMD ["python3", "app.py"]
