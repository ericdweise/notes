A list of git commands (that I usually forget about)


## Squashing Commits
Squashing commits is a way to condense multiple commits into one.
This is useful for simplifying pull requests.
If you want to squash the last 3 commits:
```bash
git rebase -i HEAD~2
```
This will open your editor allowing you to modify the commit message
for the one new commit replacing the previous 3 commits.
Rewrite your commit message, save, and exit.

### Be Careful
Squashing commits is rewriting history.
This can be a problem when you push, squash, then push again.
For example, is you make 3 commits, push them to a remote repository,
squash the commits, then push again, this will cause a merge conflict.
