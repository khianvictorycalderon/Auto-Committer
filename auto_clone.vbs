' GitMultiCloneComma.vbs
Option Explicit

Dim fso, shell, inputText, repoList, repo, savePath

Set fso = CreateObject("Scripting.FileSystemObject")
Set shell = CreateObject("WScript.Shell")

' Folder where repositories will be cloned
savePath = "C:\GitBackups"
If Not fso.FolderExists(savePath) Then
    fso.CreateFolder(savePath)
End If

' Input box: comma-separated repo URLs
inputText = InputBox("Paste your Git repo URLs separated by commas:" & vbCrLf & "e.g., https://github.com/user/repo1.git,https://github.com/user/repo2.git", "Git Multi Clone")

If inputText = "" Then
    WScript.Echo "No input provided. Exiting..."
    WScript.Quit
End If

' Split input by comma
repoList = Split(inputText, ",")

' Loop through each repo URL
For Each repo In repoList
    repo = Trim(repo)
    If repo <> "" Then
        shell.CurrentDirectory = savePath
        WScript.Echo "Cloning: " & repo
        ' Run git clone, wait until finished
        shell.Run "cmd /c git clone " & repo, 1, True
    End If
Next

WScript.Echo "All repositories have been processed."
