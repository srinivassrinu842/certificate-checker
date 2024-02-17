# Use a minimal Alpine Linux image
FROM alpine:latest

# Install necessary packages
RUN apk --no-cache add openssl python3 py3-pip curl

# Install prometheus-client
RUN pip3 install prometheus_client cryptography

# Copy the script to check certificate expiry
COPY certificate_checker.py /

# Set the script as the entry point
#CMD ["/bin/sh", "-c", "crond -f -l 0 && /certificate_checker.py"]
CMD ["python3", "/certificate_checker.py"]
