# Crontab


## Crontab Format
The crontab format is as follows:

```
.____________ minuute         (0-59)
| . _________ hour            (0-23)
| | . _______ day of month    (1-31)
| | | .______ month of year   (1-12 OR jan, feb, mar, apr, may, jun, jul, aug, sep, oct, nov, dec)
| | | | .____ day of week     (0-6, 0=Sunday OR sun, mon, tue, wed, thu, fri, sat)
| | | | |
* * * * *    USER  COMMAND
```

Note: only include the `USER` if you are editing systemwide crontab files.
Otherwise omit this field.

## Adding Crontab Entries
### Interactive
Use `sudo crontab -e`.
This will open your chosen editor (the first time it will ask you to choose) and you can add a line to the crontab file.
Any entries added this way will be run with root priviledges.
If you don't need root permissions then you can run this without `sudo`.
These entries are stored in `/proc` and can't be accessed easily.

### Edit the crontab file interactively
Systemwide rontab entries are stored in `/etc/crontab`.
Choose your favorite editor and 
Requires root permissions


### Add Scripts to `/etc/crontab.d/`
Create a file with one line in the crontab format: `* * * * * USER COMMAND`
Copy this file into `/etc/crontab.d/`
The `COMMAND` will be executed on your prescribed schedule.


### Add Scripts to the crontab `hourly`, `daily`, `weekly`, or `monthly` Directory
There are three directories:

1. `/etc/cron.hourly/`
2. `/etc/cron.daily/`
3. `/etc/cron.weekly/`
4. `/etc/cron.weeklymonthly/`

Any executable can be put in one of these directories and it will be run on the schedule.
That means, you don't need to use the `* * * * * USER COMMAND` format.
The drawback is that you cannot specify when it will run.
For example, a script in the `weekly` directory might run every Sunday or every Wednesday.


## Debugging
Some cron logs go into `/var/syslog`
