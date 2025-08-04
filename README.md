# Auto Committer

Just enter a commit message, and it automatically executes the following command:
- `git add .`
- `git commit -m <Input>`
- `git push -u origin main`

# Auto Committer (Always Initial Commit)
- Deletes the `.git` folder
- `git init`
- `git add .`
- `git commit -m "Initial commit"`
- `git push -u origin main --force`