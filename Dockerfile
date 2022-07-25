FROM python:3.10.5-alpine

WORKDIR /app
RUN pip install --upgrade pip && pip --no-cache-dir install poetry

COPY . /app

RUN poetry config virtualenvs.in-project true --local
RUN poetry install --no-dev

EXPOSE 5000

ENTRYPOINT ["poetry", "run", "python"]
CMD ["app.py"]
# CMD ["gunicorn"  , "--bind", "0.0.0.0:8000", "app:app"]
# CMD ["gunicorn", "app:app"]
# CMD ["gunicorn", "app:app", "--bind", "0.0.0.0:$PORT", "--reload"]
