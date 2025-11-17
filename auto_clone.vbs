' GitMultiClone.vbs
Option Explicit

Dim fso, shell, inputText, repoList, repo, savePath

Set fso = CreateObject("Scripting.FileSystemObject")
Set shell = CreateObject("WScript.Shell")

' Set the folder where repositories will be cloned
savePath = "C:\GitBackups"
If Not fso.FolderExists(savePath) Then
    fso.CreateFolder(savePath)
End If

' Show input box (multi-line)
inputText = InputBox("Paste your Git repo URLs, one per line:" & vbCrLf & "(e.g., https://github.com/user/repo.git)", "Git Multi Clone")

If inputText = "" Then
    WScript.Echo "No input provided. Exiting..."
    WScript.Quit
End If

' Split input by line breaks
repoList = Split(inputText, vbCrLf)

' Loop through each repo URL
For Each repo In repoList
    repo = Trim(repo)
    If repo <> "" Then
        shell.CurrentDirectory = savePath
        ' Run git clone command
        shell.Run "cmd /c git clone " & repo, 1, True
    End If
Next

WScript.Echo "All repositories have been processed."
