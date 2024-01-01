# Use an official Python runtime as a parent image
FROM python:3.7

# Set the working directory in the container
WORKDIR /app

COPY custom_init.py /app
COPY custom_compatibility.py /app
COPY requirements.txt /app

RUN pip install future==0.16.0

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Replace __init__.py and compatibility.py with custom modified ones
RUN cp /app/custom_init.py /usr/local/lib/python3.7/site-packages/websockets/__init__.py
RUN cp /app/custom_compatibility.py /usr/local/lib/python3.7/site-packages/websockets/compatibility.py

RUN pip install --upgrade uvloop
RUN pip install --upgrade asyncio

# Copy the current directory contents into the container at /app
COPY . /app

# Run app.py when the container launches
CMD ["/usr/bin/bash"]
