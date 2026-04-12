FROM python:3.10.8-slim-buster

WORKDIR /kf-filter-bot-1
RUN chmod 777 /kf-filter-bot-1

RUN apt update && apt install -y --no-install-recommends git \
    && rm -rf /var/lib/apt/lists/*

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .
RUN chmod +x start.sh

CMD ["bash", "start.sh"]
