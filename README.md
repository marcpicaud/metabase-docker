# Metabase with Docker 🐳

A production-ready setup for running [Metabase](https://www.metabase.com/) with [PostgreSQL](https://www.postgresql.org/) using [Docker](https://www.docker.com/).

## 🚀 Quick Start

1. Clone this repository
2. Configure your environment:

```bash
cp .env.example .env
# Edit .env with secure credentials
```

3. Launch the stack:

```bash
docker compose up -d
```

📝 Access Metabase at [localhost:3000](http://localhost:3000)

## 🛠️ Management Commands

```bash
# Monitor logs
docker compose logs -f

# Service operations
docker compose restart    # Restart all services
docker compose down       # Stop all services
docker compose down -v    # ⚠️ Stop and erase all data

# Backup database
./backup.sh
```

## 📈 Upgrade Metabase

> [!WARNING]  
> Upgrading involves data risks. Please read the official [upgrade guide](https://www.metabase.com/docs/latest/installation-and-operation/upgrading-metabase) and backup your data first!

To upgrade Metabase:

1. Choose a version tag from [DockerHub](https://hub.docker.com/r/metabase/metabase/tags?ordering=name)
2. Update the version in `docker-compose.yml`:
   ```yaml
   services:
     metabase:
       image: metabase/metabase:v0.x.y
   ```
3. Apply the upgrade (on startup, Metabase will perform the upgrade automatically.):
   ```bash
   docker compose pull metabase_app   # Download new version
   docker compose up -d               # Deploy update
   ```
4. Verify the upgrade:
   ```bash
   docker compose ps                  # Check container status
   docker compose logs metabase_app   # Monitor for errors
   ```

## ⚡ Production Considerations

- **Security**: Deploy behind a reverse proxy (nginx, traefik) with SSL
- **Backups**: Implement off-site backup strategy
- **Monitoring**: Set up container health monitoring
- **Updates**: Enable automated security updates

## 🔍 Troubleshooting

Run these commands if you encounter issues:

```bash
docker compose ps              # Check container status
docker compose logs metabase   # View Metabase logs
```
