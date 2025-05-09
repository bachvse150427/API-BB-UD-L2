FROM python:3.10-slim-buster
WORKDIR /app
COPY . /app

RUN apt update -y && apt install awscli -y

# Tạo các thư mục cần thiết
RUN mkdir -p /app/Get_Data/BB && \
    mkdir -p /app/Get_Data/UD && \
    mkdir -p /app/logs && \
    chmod 777 /app/logs /app/Get_Data /app/Get_Data/BB /app/Get_Data/UD

# Cài đặt dependencies
RUN pip install -r requirements.txt
RUN pip install -e .

# Chạy ứng dụng
CMD ["python", "main.py"] 