# select base iamge
FROM python:3.9.1

# install packages
RUN pip install flask
RUN pip install flask_restful

# expose port for web app
EXPOSE 5000

# set the working directory
WORKDIR /app

# copy all files or folders from source to the dest
COPY . /app

# shell command
CMD [ "python", "helloworld.py"]