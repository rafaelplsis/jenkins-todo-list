FROM 10.199.101.210:8180/python:3.6-alpine
#Copiando os arquivos do projeto para o diretorio usr/src/app 
COPY . /usr/src/app
#Definindo o diretorio onde o CMD será executado e copiando o arquivo de requerimentos
WORKDIR /usr/src/app
COPY requirements.txt ./
RUN apk add --no-cache mariadb-dev linux-headers build-base
# Instalando os requerimentos com o PIP
RUN pip install --no-cache-dir -r requirements.txt --proxy=10.1.6.91
# Expondo a porta da APP
EXPOSE 8000
# Executando o comando para subir a aplicacao
CMD ["gunicorn", "to_do.wsgi:application", "--bind", "0.0.0.0:8000", "--workers", "3"]
