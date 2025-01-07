# Użyj obrazu Python jako bazowego
FROM python:3.9-slim

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
