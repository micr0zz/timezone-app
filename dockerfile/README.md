# Build

From the root of the project run the following:
   ```bash
   docker build . -f dockerfile/Dockerfile -t timezone-app:latest --build-arg APP_PATH=app
   ```

# Run
   ```bash
   docker run --rm -p 8080:8080 timezone-app 
   ```