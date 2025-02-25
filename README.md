# Metabase with Docker 🐳

A production-ready setup for running Metabase with PostgreSQL using Docker.

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

📝 Access Metabase at [http://localhost:3000](http://localhost:3000)

## 🛠️ Management Commands

```bash
# Monitor logs
docker compose logs -f

# Service operations
docker compose restart    # Restart all services
docker compose down      # Stop all services
docker compose down -v   # ⚠️ Stop and erase all data

# Backup database
./backup.sh
```

## ⚡ Production Considerations

- **Security**: Deploy behind a reverse proxy (nginx, traefik) with SSL
- **Backups**: Implement off-site backup strategy
- **Monitoring**: Set up container health monitoring
- **Updates**: Enable automated security updates

## 🔍 Troubleshooting

Run these commands if you encounter issues:

```bash
docker compose ps         # Check container status
docker compose logs metabase   # View Metabase logs
```
