# Git Automation VBScript Collection

This repository contains three VBScript files for automating Git operations on Windows. Each script serves a slightly different purpose:

---

## 1. `first_atcmt.vbs` – First Commit and Push

Automates **initializing a Git repository**, committing all files, setting a remote, renaming the branch to `main`, and pushing for the first time.

### **Usage**
1. Double-click `first_atcmt.vbs`.
2. Enter the remote repository URL when prompted.
3. Confirm deletion of any existing Git history.
4. The script will:
   - Delete `.git` folder (if exists)
   - Initialize a new repo
   - Add all files
   - Commit with `"Initial commit"`
   - Add remote origin
   - Rename branch to `main`
   - Force push to remote

### **Important Notes**
- **Destructive:** Deletes existing Git history in the folder.
- Uses `--force` to push. Only use if remote is empty or overwriting is intended.
- Only supports `main` branch and fixed initial commit message.

---

## 2. `atcmt.vbs` – Commit and Push Repeatedly

Automates **adding, committing, and pushing** changes repeatedly with custom commit messages.

### **Usage**
1. Double-click `atcmt.vbs`.
2. Enter a commit message in the prompt (leave blank to exit).
3. The script will:
   - Add all files (`git add .`)
   - Commit with the provided message
   - Push to `main` on the remote

### **Important Notes**
- Always pushes to the `main` branch.
- Hidden command execution; no output unless Git fails.
- Loops until you leave the commit message blank.

---

## 3. `lcl_atcmt.vbs` – Local Commits Only

Automates **adding and committing changes locally** without pushing to a remote.

### **Usage**
1. Double-click `lcl_atcmt.vbs`.
2. Enter a commit message in the prompt (leave blank to exit).
3. The script will:
   - Add all files (`git add .`)
   - Commit with the provided message

### **Important Notes**
- No remote push; commits remain local.
- If there are no changes to commit, the InputBox will reappear.
- Can be combined with `atcmt.vbs` later for pushing changes.

---

## ⚡ General Notes

- All scripts use `WScript.Shell` to execute Git commands hidden (`0`) and wait for completion (`True`).
- Ensure **Git is installed and available in your system PATH**.
- Running these scripts in an existing repo can overwrite history (especially `first_atcmt.vbs`).
- Use quotes carefully in commit messages to avoid syntax issues in VBScript.

---

## ✅ Suggested Workflow

1. Run `first_atcmt.vbs` only once to initialize and push the first commit.
2. Use `lcl_atcmt.vbs` during development for safe local commits.
3. Use `atcmt.vbs` when ready to commit and push changes to remote repeatedly.