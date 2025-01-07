# Użyj obrazu Python jako bazowego
FROM python:3.9-slim

# Zainstaluj wymagane zależności (w tym Trivy)
RUN apt-get update && apt-get install -y \
    wget \
    && wget https://github.com/aquasecurity/trivy/releases/download/v0.26.0/trivy_0.26.0_Linux-64bit.deb \
    && dpkg -i trivy_0.26.0_Linux-64bit.deb \
    && rm trivy_0.26.0_Linux-64bit.deb \
    && apt-get clean

# Ustaw katalog roboczy w kontenerze
WORKDIR /workspace

# Skopiuj plik requirements.txt do kontenera
COPY requirements.txt .

# Zainstaluj zależności
RUN pip install --no-cache-dir -r requirements.txt

# Skopiuj wszystkie pliki z lokalnego katalogu do kontenera
COPY . .

# Ustaw port, na którym aplikacja będzie nasłuchiwać
EXPOSE 5000

# Uruchom aplikację Flask
CMD ["python", "app.py"]
