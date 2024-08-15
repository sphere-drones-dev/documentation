FROM python:3.11-slim-buster

LABEL maintainer="kenstack"

RUN pip install --upgrade pipenv

WORKDIR /home

COPY Pipfile .
COPY Pipfile.lock .
COPY requirements.txt .

RUN pip install -r ./requirements.txt
RUN pipenv install --dev

# Expose the development server port
EXPOSE 8088

# Start development server by default
CMD ["inv", "serve", "--config-file", "mkdocs.yml"]
