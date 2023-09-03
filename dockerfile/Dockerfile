FROM python:3.11
ARG APP_PATH
COPY $APP_PATH/requirements.txt requirements.txt 
RUN pip3 install -r requirements.txt
COPY $APP_PATH/main.py main.py
EXPOSE 8080
CMD ["python", "-m", "uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8080"]
