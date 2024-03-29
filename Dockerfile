FROM python:3.8.2-alpine3.11
WORKDIR /home/src
RUN apk update && apk add gcc libc-dev make git libffi-dev openssl-dev python3-dev libxml2-dev libxslt-dev
RUN pip install flask peewee gunicorn
COPY . .
ENV FLAG "KR24{So_you_know_How_To_code_In_Perl}"
CMD ["gunicorn", "main:app", "--workers", "20", "--timeout", "2", "-b", "0.0.0.0:1002"]
