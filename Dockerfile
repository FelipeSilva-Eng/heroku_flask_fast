FROM python:3.10.5-alpine

WORKDIR /app

RUN pip install --upgrade pip && pip --no-cache-dir install poetry

copy . /app

RUN poetry config virtualenvs.in-project true --local


RUN poetry install --no-dev

# ENTRYPOINT ["poetry", "run"]
#CMD ["gunicorn"  , "--bind", "0.0.0.0:8000", "app:app"]

CMD gunicorn app:app --bind 0.0.0.0:PORT --reload
