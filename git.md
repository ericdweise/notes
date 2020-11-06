# Git


## Config Files
[gitconfig](files/gitconfig)
[gitignore](files/gitignore)


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

## Three Way Merge
This is useful when when you want to merge two branches that have diverged. That is, both branches have a common ancestor commit, but each branch has one or more unique commits. For example, say you have a branch called `feature` on which development is complete and which is ready to be merged into `main`. However, since `feature` was branched, `main` has new commits. The following will commands will merge the `main` branch into `feature`. This will make the `feature` ready to submit to `master` as a Pull Request.
```bash
git checkout feature
git rebase main
```
Alternatively, you can use `git merge`:
```bash
git checkout feature
git merge master
```

## Submodules
Allows you to reference a source controlled repository inside another source controlled repository.
### Adding a New Submodule
```bash
git submodule add URL [PATH]
```

### Cloning a Repository with Submodules
```bash
git clone --recursive [URL]
```

### Changing a Submodule
1. Update submodule (commit changes)
2. `cd PARENT_PATH`
3. `git add SUBMODULE_PATH`
4. `git commit -m 'MESSAGE'`

### Pinning Submodule to Commit
1. `cd SUBMODULE`
2. `git checkout COMMIT_HASH`
3. `cd GIT_PARENT`
4. `git add SUBMODULE_DIR/`
5. `git commit`

### Updating a Submodule to Reflect the Latest Changes on Remote Branch
1. `cd SUBMODULE_PATH`
2. `git checkout main`
3. `git pull`
4. `cd PROJECT_ROOT`
5. `git add SUBMODULE_PATH`
6. `git commit -m ...`

### Removing a Submodule
1. `git rm PATH`
2. `rm -rf .git/modules/PATH`
where `SUBMODULE` is the `path` parameter in `.gitmodules`:
```
[submodule "NAME"]
    path = PATH
    url = ...
```
