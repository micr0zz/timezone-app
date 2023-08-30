from fastapi import FastAPI, HTTPException
from fastapi.responses import HTMLResponse, JSONResponse
from datetime import datetime, timezone, timedelta
import pytz

app = FastAPI()

@app.get("/", response_class=HTMLResponse)
def get_times():
    
    nyc_time = datetime.now(pytz.timezone('US/Eastern'))
    berlin_time = datetime.now(pytz.timezone('Europe/Berlin'))
    tokyo_time = datetime.now(pytz.timezone('Asia/Tokyo'))
    

    html_content = f"""
    <html>
    <body>
        <h1>Current Time in Different Timezones</h1>
        <p>New York: {nyc_time}</p>
        <p>Berlin: {berlin_time}</p>
        <p>Tokyo: {tokyo_time}</p>
    </body>
    </html>
    """
    return html_content

@app.get("/health", response_class=JSONResponse)
def check_health():
    return {"status": "OK"}

if __name__ == "__main__":
    import uvicorn
    uvicorn.run(app, host="127.0.0.1", port=8080)
