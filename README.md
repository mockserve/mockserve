# mockserve

Docker image publishing system that generates multiple pre-configured images tagged with port numbers. Designed start containner on port-specific configurations across multiple architectures.

## Image Structure
- Images published to `ghcr.io/<your-account>/mockserve:<port>`
- Each image tagged with single port number (e.g. `:80`, `:443`)
- Multi-architecture support for:
  - linux/amd64
  - linux/arm64

## Usage
```bash
# Pull specific port image
docker pull ghcr.io/your-account/mockserve:80

# Run container with mapped port
docker run -p 80:80 ghcr.io/your-account/mockserve:80


