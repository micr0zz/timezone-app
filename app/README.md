# Installation

* Clone this repository:
   ```bash
   git clone https://github.com/yourusername/timezone-app.git
   cd timezone-app/app
   ```
* Install the required dependencies using pip
   ```bash
   pip install -r requirements.txt
   ```
   
# Usage
 
Run the FastAPI app using Uvicorn:
   ```bash
   python -m uvicorn main:app --host 0.0.0.0 --port 8080
   ```
   
# Endpoints

* /: Returns the current time in New York, Berlin, and Tokyo in HTML format.
* /health: Returns a JSON response with the status "OK".