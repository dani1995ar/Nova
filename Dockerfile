FROM python:3.10.11-alpine3.17 AS base
WORKDIR /usr/app
RUN python -m venv /usr/app/venv
ENV PATH="/usr/app/venv/bin:$PATH"

RUN apk --no-cache add curl
RUN curl -sSL https://install.python-poetry.org | python3 - --version 1.4.2

ENV PATH="${PATH}:${POETRY_VENV}/bin"


COPY pyproject.toml .
COPY poetry.lock .

FROM python:3.10.11-alpine3.17
WORKDIR /usr/app/venv
COPY --from=base /usr/app/venv ./venv
COPY . .

RUN source venv/bin/activate
ENV PATH="/usr/app/venv/venv/bin:$PATH"
