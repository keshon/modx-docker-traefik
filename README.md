
# 🌐 MODx CMS with Docker & Traefik 🚀

This repository sets up a **MODx Content Management System** environment using Docker, with **Traefik** as the reverse proxy for seamless HTTPS routing and management. This setup also includes **PHPMyAdmin** for database management.

## 📂 Project Structure

```plaintext
modx-docker-traefik/
┣ db/                    # Database data directory
┣ db_backup/             # Database backups
┣ nginx/                 
┃ ┗ site.conf            # NGINX server configuration
┣ php/                   
┃ ┗ dockerfile           # PHP Dockerfile
┣ www/                   # Web root directory (place MODx files here)
┣ .env                   # Environment variables
┣ db_backup.sh           # Backup script for database
┣ db_dump.sh             # Database dump script (being called from db_backup.sh)
┣ docker-compose.yml     # Docker Compose for build & deploy
┣ fix_www_perm.sh        # Script to set correct permissions for www directory
┗ README.md              # This readme file
```

## ⚙️ Prerequisites

Ensure you have the following installed on your machine:
- Docker (recent version can read docker-compose on its own) 🐳
- Traefik (installed separately for external `proxy network`) 🌐

## 🚀 Getting Started

### 1. Clone the Repository
```bash
git clone https://github.com/keshon/modx-docker-traefik.git
cd modx-docker-traefik
```

### 2. Configure Environment Variables

Set up the `.env` file for your MODx environment:
```env
ALIAS=examplealias
HOST=example.com
PHPMYADMIN_DOMAIN=phpmyadmin.example.com
MYSQL_ROOT_PASSWORD=makeupyourrootpassword
DB_NAME=dbnameitself
DB_USER=dbusername
DB_PASSWORD=dbpassword
```

### 3. Set Up `docker-compose.yml`

The `docker-compose.yml` file is configured for **NGINX**, **PHP**, **MySQL**, and **PHPMyAdmin** services:
- **NGINX**: Handles web requests and redirects with Traefik.
- **PHP**: The PHP environment for MODx.
- **MySQL**: Database service.
- **PHPMyAdmin**: Web-based MySQL admin tool.

### 4. Build and Launch the Stack

Run the following command to build and start the containers:
```bash
docker compose up -d
```

> 📝 **Note**: Ensure Traefik is properly configured to use the `proxy` network.

### 5. Access MODx and PHPMyAdmin

- **MODx Site**: http://yourdomain.com
- **PHPMyAdmin**: http://phpmyadmin.yourdomain.com

## 🗄️ Database Management

### Backup the Database

Run the `db_backup.sh` script to back up the MySQL database.
```bash
./db_backup.sh
```
The backup will be stored as an archive in the `db_backup/` folder with a timestamp.

## 🛠️ Fix Permissions

Use `fix_www_perm.sh` to set proper permissions for the `www/` directory:
```bash
./fix_www_perm.sh
```

This ensures files are owned by `www-data` with proper read/write permissions.

## ⚙️ Configurations

### NGINX Configuration

The **NGINX** configuration is in `nginx/site.conf`:

### PHP Configuration

The **PHP** configuration (`php/dockerfile`) includes:
- Essential PHP extensions for MODx.
- Custom settings for file uploads, memory limits, and max execution time.
- By default php 8 is used but you can change it to 7 if needed.

## 📝 Additional Notes

- **Traefik Configuration**: Ensure your Traefik setup has a `proxy` network accessible to this stack.
- **Volume Persistence**: Data for MySQL is stored in `db/`.

## 📝 License

This project is licensed under the **MIT License**. See the [LICENSE](LICENSE) file for details.

