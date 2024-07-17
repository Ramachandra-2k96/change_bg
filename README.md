# This project allows you to automatically change the background in Linux, similar to the Windows slideshow feature.

### Step 1: Save Your Script
Save the above script file to a required location, for example, `change_background.sh` in your home directory.

Make sure the script is executable:

```bash
chmod +x /home/ramachandra/change_background.sh
```

### Step 2: Create a Systemd Service File
Create a systemd service file, for example, `change_background.service`.

```ini
[Unit]
Description=Change Desktop Background Randomly

[Service]
ExecStart=/home/ramachandra/change_background.sh
User=ramachandra
Restart=always

[Install]
WantedBy=default.target
```

Save this file in `/etc/systemd/system/`:

```bash
sudo nano /etc/systemd/system/change_background.service
```

Paste the above content and save the file.

### Step 3: Enable and Start the Service
Enable the service to start on boot:

```bash
sudo systemctl enable change_background.service
```

Start the service immediately:

```bash
sudo systemctl start change_background.service
```

### Step 4: Managing the Service
To stop the service:

```bash
sudo systemctl stop change_background.service
```

To check the status of the service:

```bash
sudo systemctl status change_background.service
```

To disable the service from starting on boot:

```bash
sudo systemctl disable change_background.service
```

This setup ensures that your background changing script runs automatically at startup and can be managed easily.
