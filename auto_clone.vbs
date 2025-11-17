' GitMultiCloneCommaSilent.vbs - Clones repos in the same folder, CMD hidden
Option Explicit

Dim fso, shell, inputText, repoList, repo, savePath, execObj, exitCode

Set fso = CreateObject("Scripting.FileSystemObject")
Set shell = CreateObject("WScript.Shell")

' Use the same folder as the script
savePath = fso.GetParentFolderName(WScript.ScriptFullName)

' Input box: comma-separated repo URLs
inputText = InputBox("Paste your Git repo URLs separated by commas:" & vbCrLf & "e.g., https://github.com/user/repo1.git,https://github.com/user/repo2.git", "Git Multi Clone")

If inputText = "" Then
    MsgBox "No input provided. Exiting...", vbExclamation, "Git Multi Clone"
    WScript.Quit
End If

' Split input by comma
repoList = Split(inputText, ",")

' Loop through each repo URL
For Each repo In repoList
    repo = Trim(repo)
    If repo <> "" Then
        shell.CurrentDirectory = savePath
        ' Execute git clone silently
        Set execObj = shell.Exec("cmd /c git clone """ & repo & """")
        
        ' Wait for process to finish
        Do While execObj.Status = 0
            WScript.Sleep 100
        Loop
        
        ' Check exit code
        exitCode = execObj.ExitCode
        If exitCode <> 0 Then
            MsgBox "Error cloning repository:" & vbCrLf & repo, vbCritical, "Git Multi Clone"
            WScript.Quit
        End If
    End If
Next

MsgBox "All repositories have been successfully cloned!", vbInformation, "Git Multi Clone"
