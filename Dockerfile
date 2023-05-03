FROM python:3.10.11
RUN set -xe
RUN curl -sSL https://install.python-poetry.org | python3 - --version 1.4.2

ENV PATH="/root/.local/bin:$PATH"
RUN poetry --version

WORKDIR /usr/app
COPY pyproject.toml .
COPY poetry.lock .

RUN poetry install

