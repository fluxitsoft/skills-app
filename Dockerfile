# Imagen oficial Python 3.7
FROM python:3.13.0a3

# Work Directory
WORKDIR /usr/src/app

# Copiar requirements.txt
COPY ./requirements.txt /usr/src/app/requirements.txt

# Instalar dependencias del proyecto
RUN pip install -r requirements.txt

# Copiar codigo del proyecto en el work directory
COPY . /usr/src/app

EXPOSE 5000

# Correr la aplicacion
CMD ["python", "manage.py", "runserver"]