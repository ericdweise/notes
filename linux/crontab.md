# Crontab


## Crontab Format
The crontab format is as follows:

```
.____________ minute          (0-59)
| . _________ hour            (0-23)
| | . _______ day of month    (1-31)
| | | .______ month of year   (1-12 OR jan, feb, mar, apr, may, jun, jul, aug, sep, oct, nov, dec)
| | | | .____ day of week     (0-6, 0=Sunday OR sun, mon, tue, wed, thu, fri, sat)
| | | | |
* * * * *    USER  COMMAND
```

Note: only include the `USER` if you are editing systemwide crontab files.
Otherwise omit this field.



## The `crontab` Command
The `crontab -e` command is used to add entries to crontab.
This will open the editor of your choice and allow you to modify entries for the current user.
Use `sudo crontab -e` to add root level crontab entries, and use `crontab -e` to add crontabs for your login.
These entries are stored in `/proc` and can't be accessed easily without using the `crontab` command.



## Editing the Crontab File
Systemwide rontab entries are stored in `/etc/crontab`.
Choose your favorite editor and open this file.
This requires root permissions.



## Add Scripts to `/etc/crontab.d/`
Create a file with one line in the crontab format:

```text
* * * * * USER COMMAND
```

Copy this file into `/etc/crontab.d/`
The `COMMAND` will be executed on your prescribed schedule.



## Add Scripts to the crontab `hourly`, `daily`, `weekly`, or `monthly` Directory
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
