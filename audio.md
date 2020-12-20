# Audio
I used to have a prolific music library, but I lost it when my computer crashed and iPod classic was stolen.
I'm trying to build up my collection again, but I'm trying to not be dependent on a proprietary system, single point of failure.
This is my process.

### Strawberry

- Fork of Clementine
- I use it to manage audio files and playlists


#### Set Up Collection
The Strawberry "collection" is a set of all the audio files in it's database.
It's similar to an iTunes Library.

1. Settings `ctrl + P` or `tools` -> `Settings`
2. `Collections`
3. `Add new folder`


#### Importing New Music

1. Import unsorted directory into a **Playlist**: `Playlist -> Add Folder`
2. Clean up metadata
   - Set Album to `Unknown` if not available
3. Move files to collection (`select all`, `right click`, `Move to collection`)
4. Set output filename format: `%artist/%album/{0%track-}%title.%extension`
5. Check `Remove problematic characters from filenames`
5. Check `Restrict to characters allowed on FAT filesystems`
6. Check `Replace spaces with underscores`
7. Un-check `Overwrite existing files`
8. Un-check `Copy album cover artwork`
9. Click `Ok`


## Editing Music and Audio Files
### FFMPEG
A very powerful command line tool.

#### Clipping File
```bash
ffmpeg -i INPUT.file [-ss START(hh:mm:ss)] -t LENGTH(hh:mm:ss) -acodec copy OUTPUT.file
# NOTE: -ss can be omitted if starting from beginning of file
```
