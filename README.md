# SpectroChemPy in Docker

This repository contains a Dockerized environment for running [SpectroChemPy](https://www.spectrochempy.fr/), a Python framework for processing, analyzing, and modeling spectroscopic data, together with JupyterLab for interactive notebooks.

---

## Features

- Ready-to-use Docker container with Python 3.11, SpectroChemPy, and JupyterLab pre-installed.
- Fully isolated environment eliminating dependency and system configuration issues.
- Access JupyterLab through the browser via port 8888.
- Supports loading and analyzing spectroscopic data formats such as OMNIC, JCAMP-DX, CSV, and more inside Jupyter notebooks.

---

## Getting Started

### Prerequisites

Install Docker Desktop on your machine: https://www.docker.com/products/docker-desktop

### Build Docker Image

Clone this repository and from its root directory run:

```docker build -t spectrochempy-jupyter .```

### Run Docker Container

Start the container and map port 8888 for JupyterLab access:

```docker run -p 8888:8888 spectrochempy-jupyter```

### Access JupyterLab

After container startup, note the JupyterLab URL with token printed in the console, e.g.:

http://127.0.0.1:8888/lab?token=12345678901234567890

Open this URL in your browser to start working with SpectroChemPy interactively.

### (Optional) Mount Local Directory

To persist your notebooks and data, mount a local folder when running the container:

```docker run -p 8888:8888 -v /path/to/local/folder:/app spectrochempy-jupyter```

Replace `/path/to/local/folder` with your actual directory path.

---

## Example Usage in JupyterLab

Import SpectroChemPy and check version:

```
import spectrochempy as scp 
print(scp.version)
```

Load example FTIR data in .SPC format (ensure you have the data file available in the container or mounted volume):

```
ex1 = scp.read_spc("galacticdata/BENZENE.SPC")
ex1.plot()
ex1
```


---

## Troubleshooting

If you encounter missing package errors during build related to system libraries, consider updating the Dockerfile to replace deprecated packages like `libatlas-base-dev` with alternatives such as `libopenblas-dev`.
For JupyterLab startup errors, ensure the command in Dockerfile uses `jupyter lab` instead of `jupyter notebook`.

---

## References

- [SpectroChemPy Official Site](https://www.spectrochempy.fr/)
- [JupyterLab Documentation](https://jupyterlab.readthedocs.io/)
- [Docker Desktop](https://www.docker.com/products/docker-desktop/)
