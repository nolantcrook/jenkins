# Jenkins Local Development Setup

This directory contains configuration for running a local Jenkins instance for CI/CD pipeline development.

## Prerequisites

- Docker Desktop for Mac (Apple Silicon)
- Git

## Setup Instructions

1. Start Docker Desktop
2. Run the following command to start Jenkins:
   ```bash
   docker-compose up -d
   ```
3. Get the initial admin password:
   ```bash
   docker-compose exec jenkins cat /var/jenkins_home/secrets/initialAdminPassword
   ```
4. Access Jenkins UI at: http://localhost:8080
5. Enter the initial admin password when prompted
6. Install suggested plugins when asked
7. Create your admin user account
8. Start building your pipelines!

## Important Notes

- Jenkins data is persisted in `./jenkins_home` directory
- Jenkins runs on port 8080 by default
- Agent port 50000 is exposed for distributed builds
- The setup includes Docker-in-Docker capability for running containerized builds

## Stopping Jenkins

To stop Jenkins: