# Metabase x Docker

Quick start guide for running Metabase with PostgreSQL in Docker.

## 🚀 Quick Start

Set your environment variables and you're good to go

```bash
cp .env.example .env
# Now edit the .env file with your own secure credentials
docker compose up -d
```

Voilà ! Access Metabase at http://localhost:3000

## 🛠️ Maintenance

Common tasks:

```bash
# View logs
docker compose logs -f

# Restart services
docker compose restart

# Stop all services
docker compose down

# Stop and remove volume (⚠️ erases all data)
docker compose down -v

# Create a local database backup
sh backup.sh
```

## ℹ️ Caveats

- The webserver is up to you. In a production environment, you'd typically want to put a reverse proxy in front of this.
- The backup script is doing local backups only. In a production environment, you want to send these backups in many other places.

## 🚨 Troubleshooting

- If Metabase fails to start, check logs: `docker compose logs metabase`
- Container health status: `docker compose ps`
