# Use the official lightweight Python image as base
FROM python:3.8-slim

# Create a non-root user
RUN useradd -m flaskuser

# Set the working directory
WORKDIR /app

# Copy the application code
COPY app.py .
COPY requirements.txt .

# Install the required Python packages
RUN pip install --no-cache-dir -r requirements.txt

# Change ownership of the working directory to the non-root user
RUN chown -R flaskuser:flaskuser /app

# Switch to the non-root user
USER flaskuser

# Expose the application port
EXPOSE 5000

# Start the Flask application
CMD ["python", "app.py"]
