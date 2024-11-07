# Use the specified version of Python (adjust this if .python-version specifies a different version)
FROM python:3.7.2

# Set the working directory
WORKDIR /app

COPY requirements.txt .
COPY . .

# Install dependencies
RUN pip install -r requirements.txt

# Command to run the tests
CMD ["python", "-m", "unittest", "tests.py"]
