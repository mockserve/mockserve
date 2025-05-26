# MockServe

A lightweight Docker-based HTTP server built on BusyBox, designed for testing and development purposes. MockServe provides a simple way to spin up HTTP servers on configurable ports with multi-architecture support.

## Features

- **Lightweight**: Built on BusyBox for minimal resource usage
- **Port Configurable**: Each Docker image is tagged with its designated port
- **Multi-Architecture**: Supports both AMD64 and ARM64 architectures
- **Simple Setup**: Ready-to-use with minimal configuration
- **Development Friendly**: Perfect for testing, mocking, and development environments

## Quick Start

### Pull and Run
```bash
# Pull a specific port image
docker pull ghcr.io/mockserve/mockserve:80

# Run container with port mapping
docker run -p 80:80 ghcr.io/mockserve/mockserve:80
```

### Build Locally
```bash
# Build for a specific port
docker build --build-arg PORT=8080 -t mockserve:8080 .

# Run the locally built image
docker run -p 8080:8080 mockserve:8080
```

## Image Structure

Images are published to GitHub Container Registry with the following structure:
- **Registry**: `ghcr.io/mockserve/mockserve`
- **Tags**: Port numbers (e.g., `:80`, `:443`, `:8080`, `:3000`)
- **Architectures**: 
  - `linux/amd64`
  - `linux/arm64`

## Configuration

### Build Arguments
- `PORT`: The port number the server will listen on (default: 80)

### Environment Variables
- `PORT`: Runtime port configuration (inherited from build arg)

## File Structure

```
mockserve/
├── Dockerfile          # Container definition
├── README.md          # This file
└── www/               # Web content directory
    ├── index.html     # Default page (created at runtime)
    └── robots.txt     # Search engine directives
```

## Use Cases

- **API Mocking**: Serve static responses for API testing
- **Development**: Quick HTTP server for frontend development
- **Testing**: Lightweight server for integration tests
- **Prototyping**: Rapid deployment of static content
- **Load Testing**: Multiple instances for testing scenarios

## Examples

### Different Ports
```bash
# Web server on port 80
docker run -p 80:80 ghcr.io/mockserve/mockserve:80

# Development server on port 3000
docker run -p 3000:3000 ghcr.io/mockserve/mockserve:3000


### Custom Content
```bash
# Mount your own content
docker run -p 8080:8080 -v $(pwd)/my-content:/www ghcr.io/mockserve/mockserve:8080
```

### Docker Compose
```yaml
version: '3.8'
services:
  web:
    image: ghcr.io/mockserve/mockserve:80
    ports:
      - "80:80"
    volumes:
      - ./content:/www
```

## Building Multi-Architecture Images

```bash
# Create and use a new builder
docker buildx create --name multiarch --use

# Build for multiple architectures
docker buildx build \
  --platform linux/amd64,linux/arm64 \
  --build-arg PORT=80 \
  --tag ghcr.io/mockserve/mockserve:80 \
  --push .
```

## Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## License

This project is open source and available under the [MIT License](LICENSE).

## Support

For issues, questions, or contributions, please visit the [GitHub repository](https://github.com/mockserve/mockserve).
