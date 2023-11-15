FROM python:3.9

# Configuração do ambiente
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Criação do diretório de trabalho e cópia do código
WORKDIR /app
COPY . /app

# Verifica se o arquivo requirements.txt existe
RUN test -f requirements.txt && pip install --upgrade pip && pip install -r requirements.txt || echo "No requirements.txt file"

# Comando para iniciar o servidor
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]