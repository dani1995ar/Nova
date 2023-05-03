FROM ubuntu:22.04
FROM python:3.10.11
RUN set -xe
RUN apt-get update && \
    apt-get install -y curl && \
    rm -rf /var/lib/apt/lists/*
RUN curl -sSL https://install.python-poetry.org | python3 - --version 1.4.2
ENV PATH="/root/.local/bin:$PATH"
RUN poetry --version

WORKDIR /usr/app
COPY pyproject.toml .
COPY poetry.lock .

RUN poetry install