FROM python:3.11-slim

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive

# Install dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    libopenblas-dev \
    gfortran \
    && rm -rf /var/lib/apt/lists/*
    

# Install JupyterLab and SpectroChemPy
RUN pip install --no-cache-dir \
    jupyterlab \
    spectrochempy

# Set the working directory
WORKDIR /app

# Expose port 8888 for Jupyter Notebook
EXPOSE 8888

# Start Jupyter Notebook server on container startup
CMD ["jupyter", "lab", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root"]