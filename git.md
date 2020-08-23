

# Config Files
[gitconfig](files/gitconfig)
[gitignore](files/gitignore)


# Common Commands
A list of git commands (that I usually forget about)

## Squashing Commits
Combine multiple commits into one commit.
If you want to squash the last 3 commits:
1.  ```bash
    git rebase -i HEAD~3
    ```
    This will open your text editor.
2. Write `pick` next to the oldest commit
3. Write `squash` in front of the commits to 
4. Save the commit file and close the editor
5. Your text editor will reopen. Rewrite the commit message if you want.
6. Save the commit message and close the editor.
