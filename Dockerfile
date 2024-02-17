# Use an official Python runtime as a parent image
FROM python:3.8-alpine

# Set the working directory to /app
WORKDIR /app

# Install additional dependencies
RUN apk --no-cache add libressl-dev musl-dev gcc

# Copy the current directory contents into the container at /app
COPY . /app

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Make port 8080 available to the world outside this container
EXPOSE 8080

# Define environment variable
ENV TARGETS="https://example.com:443,http://insecure.example.com:8080"

# Run certificate_checker.py when the container launches
CMD ["python", "certificate_checker.py"]
