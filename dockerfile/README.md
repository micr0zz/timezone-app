# Timezone App

This is a simple FastAPI application that provides current times in New York, Berlin and Tokio. It also provides an health status endpoint.

## Installation

* Clone this repository:
   ```bash
   git clone https://github.com/yourusername/timezone-app.git
   cd timezone-app
   ```
* Install the required dependencies using pip
   ```bash
   pip install -r requirements.txt
   ```
   
## Usage
 
Run the FastAPI app using Uvicorn:
   ```bash
   uvicorn main:app --host 0.0.0.0 --port 8080
   ```
   
## Endpoints

* /: Returns the current time in New York, Berlin, and Tokyo in HTML format.
* /health: Returns a JSON response with the status "OK".