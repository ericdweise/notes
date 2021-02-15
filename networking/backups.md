# Types of Backups


### Full Backup
- All files are backed up
- Archive Bit turned off for every file backed up
- slower and more memory for backing up
- very easy restore


### Incremental Backup
- Only files with archve bit on are backed up
- Archive Bit turned off for every file backed up
- less storage space than differential
- harder to restore than differential

## Differential Backup
- Only files added or modified since last backup are backed up.
- Archive bit is not changed
- more storage space than incremental
- easier to restore than incremental
