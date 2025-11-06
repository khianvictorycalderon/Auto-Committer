Dim commitMessage, shell, command

Set shell = CreateObject("WScript.Shell")

Do
    commitMessage = InputBox("Enter commit message (Leave blank to exit):", "Git Commit")

    If commitMessage = "" Then
        Exit Do
    End If

    command = "git add . && git commit -m """ & commitMessage & """ && git push -u origin main"
    shell.Run "cmd /c " & command, 0, True  ' 0 = hidden window, True = wait to finish
Loop
