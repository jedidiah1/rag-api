FROM python:3.11-slim

WORKDIR /app

# Install curl for Ollama model pulls
RUN apt-get update && apt-get install -y curl && rm -rf /var/lib/apt/lists/*

# Copy your app files
COPY app.py embed.py k8s.txt ./

# Install Python dependencies
RUN pip install fastapi uvicorn chromadb ollama


# Run embedding script
#RUN python embed.py

EXPOSE 8000

CMD ["sh", "-c", "python embed.py && uvicorn app:app --host 0.0.0.0 --port 8000"]

#CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000"]

