' GitMultiCloneCommaSilent.vbs - Clones multiple repos silently without CMD window issues
Option Explicit

Dim fso, shell, inputText, repoList, repo, savePath, exitCode, cmd

Set fso = CreateObject("Scripting.FileSystemObject")
Set shell = CreateObject("WScript.Shell")

' Clone directory = script folder
savePath = fso.GetParentFolderName(WScript.ScriptFullName)

inputText = InputBox("Paste Git repo URLs separated by commas:" & vbCrLf & _
"Example: https://github.com/user/repo1.git, https://github.com/user/repo2.git", _
"Git Multi Clone")

If Trim(inputText) = "" Then
    MsgBox "No input provided. Exiting...", vbExclamation, "Git Multi Clone"
    WScript.Quit
End If

repoList = Split(inputText, ",")

For Each repo In repoList
    repo = Trim(repo)
    If repo <> "" Then
        cmd = "cmd /c cd """ & savePath & """ && git clone """ & repo & """ >nul 2>&1"
        
        exitCode = shell.Run(cmd, 0, True) ' 0 = hidden, True = wait
        
        If exitCode <> 0 Then
            MsgBox "❌ Failed cloning:" & vbCrLf & repo, vbCritical, "Git Multi Clone"
        End If
    End If
Next

MsgBox "✔ All repositories processed.", vbInformation, "Git Multi Clone"
