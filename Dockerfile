FROM python:3.9-slim

# Set the working directory
# WORKDIR /app

# Copy the requirements file and install dependencies
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

# Get some standard tooling that previous iterations have consistently installed themselves
RUN apt-get update && apt-get install -y curl dnsutils net-tools coreutils procps

# Copy the rest of your application code
COPY . .

# Transfer the OPENAI_API_KEY environment variable
ARG OPENAI_API_KEY
ENV OPENAI_API_KEY=${OPENAI_API_KEY}
ARG USER_NAME
ENV USER_NAME=${USER_NAME}

# Set the entry point to your application
CMD ["python", "src/main.py"]
