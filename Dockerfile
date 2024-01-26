FROM thijsvanloef/palworld-server-docker:latest

### Copy update script
COPY ./update.sh /home/steam/server
RUN chmod +x /home/steam/server/update.sh

### Install cron
RUN apt update && apt install -y cron

### Write crontab
# Create backup at 12:00 AM, remove backups older than 7 days
RUN echo "0 0 * * * backup && find /palworld/backups -name '*.tar.gz' -mtime +7 -delete" > /etc/cron.d/crontab

# Check update every 30 minutes.
RUN echo "*/30 * * * * /home/steam/server/update.sh" > /etc/cron.d/crontab

RUN chmod 0644 /etc/cron.d/crontab
RUN /usr/bin/crontab /etc/cron.d/crontab

# Add a line executing cron to init.sh
RUN sed -i -e "2i cron -f &" ./init.sh