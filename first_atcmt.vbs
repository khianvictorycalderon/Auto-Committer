Dim remoteRepo, shell, command

Set shell = CreateObject("WScript.Shell")

Do
    remoteRepo = InputBox("Enter Remote Repository URL (Leave blank to exit):", "Git First Commit")

    If remoteRepo = "" Then
        Exit Do
    End If

    ' Remove old Git repo if it exists
    command = "cmd /c rmdir /s /q .git"
    shell.Run command, 0, True

    ' Initialize new Git repo
    command = "cmd /c git init"
    shell.Run command, 0, True

    ' Add all files
    command = "cmd /c git add ."
    shell.Run command, 0, True

    ' Commit with fixed message
    command = "cmd /c git commit -m ""Initial commit"""
    shell.Run command, 0, True

    ' Add remote origin
    command = "cmd /c git remote add origin " & remoteRepo
    shell.Run command, 0, True

    ' Rename current branch to main
    command = "cmd /c git branch -M main"
    shell.Run command, 0, True

    ' Push to remote origin main
    command = "cmd /c git push -u origin main --force"
    shell.Run command, 0, True

    WScript.Echo "✅ First commit pushed successfully to: " & remoteRepo
Loop
