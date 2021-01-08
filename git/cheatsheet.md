# Git Cheatsheet

A growing list of common porcelain commands that make life easy.


## Clone
Copy remote repositories.

<details>

### Shallow Clone
Don't download all the history, just the most recent commit.
```bash
git clone --depth 1
```

### Clone to Specific Tag or Branch
Instead of downloading all the history of a repository just clone the 
repository at a specific tag or branch.
```bash
git clone --branch [TAG|BRANCH] --depth 1 https://example.com/my/repo.git
```

</details>




## Commit
Adding and manipulating changes.

<details>

### Delete Unstaged Changes
Get rid of any changes that havent been committed or staged for a commit.
```bash
git checkout HEAD -- FILE
```

### Unstage File
Undo `git add`.
```bash
git reset -- FILE
```


### Squashing Commits
Combine multiple commits into one commit.
If you want to squash the last 3 commits:
1. Start the rebase process:
    ```bash
    git rebase -i HEAD~3
    ```
2. Write `pick` next to the oldest commit
3. Write `squash` in front of the commits to 
4. Save the commit file and close the editor
5. Your text editor will reopen. Rewrite the commit message if you want.
6. Save the commit message and close the editor.
</details>




## Merge
Merging branches.

<details>
### Three Way Merge
This is useful when when you want to merge two branches that have diverged.
That is, both branches have a common ancestor commit, but each branch has one or more unique commits.
For example, say you have a branch called `feature` on which development is complete and which is ready to be merged into `main`.
However, since `feature` was branched, `main` has new commits.
The following will commands will merge the `main` branch into `feature`.
This will make the `feature` ready to submit to `master` as a Pull Request.
```bash
git checkout feature
git rebase main
```
Alternatively, you can use `git merge`:
```bash
git checkout feature
git merge master
```
</details>




## Submodules
Russian nesting dolls, but for `git`.

<details>

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

```text
[submodule "NAME"]
    path = PATH
    url = ...
```
</details>
