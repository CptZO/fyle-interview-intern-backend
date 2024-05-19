# Use the official Python image from the Docker Hub
FROM python:3.9-slim

# Set the working directory inside the container
WORKDIR /app

# Copy the requirements file into the container
COPY requirements.txt .

# Install the required Python packages
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code into the container
COPY . .

# Copy the entrypoint script into the container
COPY entrypoint.sh /app/entrypoint.sh

# Make the entrypoint script executable
RUN chmod +x /app/entrypoint.sh

# Expose the port that the application will run on
EXPOSE 5000

# Set the environment variable to tell Flask it is running in development mode
ENV FLASK_ENV=development

# Set the entrypoint to the script
ENTRYPOINT ["/app/entrypoint.sh"]

# Define the command to run the application
CMD ["gunicorn", "-b", "0.0.0.0:5000", "core.server:app"]
