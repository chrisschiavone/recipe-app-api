FROM python:3.12.1-alpine3.19
LABEL maintainer="jtelemarketing.com"

ENV PYTHONUNBUFFERED 1

COPY ./requirements.txt .
COPY ./requirements.dev.txt .

COPY ./app /app
WORKDIR /app
EXPOSE 8000

ARG DEV=false
RUN python -m venv /py && \
    pip install --upgrade pop && \
    pip install -r /requirements.txt && \
    if [ $DEV == "true" ]; \
        then  pip install -r /requirements.dev.txt ; \
    fi

ENV PATH="C:\Program Files\Python38\:$PATH"