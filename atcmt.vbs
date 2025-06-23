Dim commitMessage, shell

Set shell = CreateObject("WScript.Shell")

Do
    commitMessage = InputBox("Enter commit message (Leave blank to exit):", "Git Commit")

    If commitMessage = "" Then
        WScript.Echo "Exited."
        Exit Do
    End If

    shell.Run "cmd /k git add . && git commit -m """ & commitMessage & """ && git push -u origin main", 1, True
Loop
