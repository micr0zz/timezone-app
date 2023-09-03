# Build

From the root of the project run the following:
   ```bash
   docker build . -f dockerfile/Dockerfile -t timezone-app:latest --build-arg APP_PATH=app
   ```

Build to other platforms:

   ```bash
   docker buildx build . -f dockerfile/Dockerfile -t <your-ecr-repo>:latest --load --build-arg APP_PATH=app --platform=linux/amd64,linux/arm64 --push
   ```

# Run
   ```bash
   docker run --rm -p 8080:8080 timezone-app 
   ```