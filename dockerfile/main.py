from fastapi import FastAPI, HTTPException
from fastapi.responses import HTMLResponse, JSONResponse
from datetime import datetime, timezone, timedelta

app = FastAPI()

@app.get("/", response_class=HTMLResponse)
def get_times():
    time_now = datetime.now(timezone.utc)
    
    ny_time = time_now.astimezone(timezone(timedelta(hours=-4)))
    berlin_time = time_now.astimezone(timezone(timedelta(hours=2)))
    tokyo_time = time_now.astimezone(timezone(timedelta(hours=9)))
    
    html_content = f"""
    <html>
    <body>
        <h1>Current Time in Different Timezones</h1>
        <p>New York: {ny_time}</p>
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
