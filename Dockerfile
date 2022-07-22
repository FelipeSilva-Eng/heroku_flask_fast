FROM python:3.10.5-alpine

WORKDIR /app

RUN pip install --upgrade pip && pip --no-cache-dir install poetry

copy . /app

RUN poetry config virtualenvs.in-project true --local


RUN poetry install --no-dev

ENV FLASK_APP=$APP_NAME \
    FLASK_ENV=production \
    FLASK_RUN_HOST=0.0.0.0

EXPOSE 5000

ENTRYPOINT ["poetry", "run"]
CMD ["flask", "run"]
