Dim commitMessage, shell, command

Set shell = CreateObject("WScript.Shell")

Do
    commitMessage = InputBox("Enter commit message (Leave blank to exit):", "Git Commit")

    If commitMessage = "" Then
        WScript.Echo "Exited."
        Exit Do
    End If

    ' Only add and commit, no push
    command = "git add . && git commit -m """ & commitMessage & """"
    shell.Run "cmd /c " & command, 0, True  ' 0 = hidden window, True = wait to finish
Loop
