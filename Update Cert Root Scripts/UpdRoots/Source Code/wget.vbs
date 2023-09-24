Option Explicit
Dim oFSO, strURL, strPath, strFile, oDate, vFileName, vResult, strDrive, vChar
Set oFSO = CreateObject("Scripting.FileSystemObject")


If WScript.Arguments.Count < 1 Then
  Do
    WScript.Echo "Usage:"& vbCrLf & WScript.ScriptName &" <url> <path (can with filename)>"
    strUrl=Trim(InputBox ("Enter URL:","Enter URL", strUrl))
    If strURL = "" Then WScript.Quit
    If Left(strURL,6)="ftp://" Or Left(strURL,7)="http://" Or Left(strURL,7)="ftps://" Or Left(strURL,8)="https://" Then
      Exit Do
    Else
      MsgBox "Unknown protocol: " & Left(strURL, 6)
    End If
  Loop
  strPath = oFSO.getParentFolderName(WScript.ScriptFullName) & "\"
  Do
    strPath = Trim(InputBox ("Enter path (can with filename):","Enter path", strPath))
    If strPath = "" Then WScript.Quit
    If Not Right(strPath,1) = "\" Then If MsgBox ("Is the """ & oFSO.GetFileName(strPath) & """ a folder?" ,vbYesNo) = vbYes Then strPath = strPath & "\"
    If Right(strPath,1) = "\" Then strPath = oFSO.BuildPath(strPath, Mid(strUrl, InStrRev(strUrl, "/") + 1))

    strPath = oFSO.GetAbsolutePathName(strPath)
    strDrive = oFSO.GetDriveName (strPath)
    strPath = Replace (strPath, strDrive, "", 1, 1)
    For Each vChar in Array(":", "?", "^")
      strPath = Replace(strPath, vChar, "_")
    Next 
    strPath = oFSO.BuildPath(strDrive,strPath)

    If Not oFSO.FolderExists (oFSO.GetParentFolderName(strPath)) Then
      If MsgBox ("Folder """ & (oFSO.GetParentFolderName(strPath)) & """ not found. Want to create it?", vbYesNo)=vbYes Then 
        If CreateFolder (oFSO.GetParentFolderName(strPath)) Then 
          Exit Do  
        Else
          WScript.Echo "Can't create folder " & (oFSO.GetParentFolderName(strPath))
        End If
      End If
    Else
      Exit Do
    End If
  Loop
Else
  strUrl = WScript.Arguments(0)
  If WScript.Arguments.Count > 1 Then
     strPath = WScript.Arguments(1)
  Else
     Dim parts
     parts = Split(strUrl, "/")
     strPath = ".\" & parts(Ubound(parts))
  End if
End If


If oFSO.FolderExists(strPath) Then
  If Right(strUrl,1) = "/" Then
    strFile = oFSO.BuildPath(strPath, "index.html")
  Else
    strFile = oFSO.BuildPath(strPath, Mid(strUrl, InStrRev(strUrl, "/") + 1))
  End If
ElseIf oFSO.FolderExists(Left(strPath, InStrRev(strPath, "\") - 1)) Then
  strFile = strPath
Else
  WScript.Echo "ERROR: Target folder not found"
  WScript.Quit
End If


Select Case 1
  Case InStr(strURL, "http://"), InStr(strURL, "https://"): vResult = DownloadHTTP (strURL, strFile)
  Case InStr(strURL, "ftp://"), InStr(strURL, "ftps://"):  vResult = DownloadFTP (strURL, strFile)
  Case Else : WScript.Echo "Unknown protocol: " & Left(strURL, 6) : WScript.Quit
End Select


vFileName = oFSO.GetFileName(strFile)
If Len(vFileName)<35 Then vFileName = vFileName & Space (35-Len(vFileName))
If vResult = true then
  If Not WScript.Arguments.Named.Exists("NoDate") Then 
    oDate = oFSO.GetFile(strFile).DateLastModified 
    WScript.Echo vFileName & vbTab & "- downloaded [" & FormatDateTime(oDate,2) & ", " & Right("00" & FormatDateTime(oDate,3), 8) & "]"
  End If
Else
  WScript.Echo vFileName & vbTab & "- downloading failed [" & vResult & "]"
End If


Function DownloadFTP (vUrl, vFile)
  Dim oFTP, oStream, aList, oDate, vDate
  Set oFTP = NewXMLHTTP
  Set oStream = NewADOBDStream
  oDate = Now
  DownloadFTP = False
  If Not Right(oFSO.GetParentFolderName(vUrl),1)=":" Then
    oFTP.Open "GET", oFSO.GetParentFolderName(vUrl), False
    DownloadFTP = HTTPSend(oFTP)
    If Not DownloadFTP Then 
      oFTP.Open "GET", Left(vUrl,InStr(8,vUrl,"/")), False
      DownloadFTP = HTTPSend(oFTP)
      If Not DownloadFTP Then
        DownloadFTP = "Server not available"
        Exit Function
      Else
        DownloadFTP = "Folder not found"
        Exit Function
      End If
    End If
    aList = Filter(Split(oFTP.ResponseText,vbCrLf), ">" & oFSO.GetFileName(vUrl) & "<" ,true,1)
    If UBound(aList) =  LBound(aList) Then
      vDate = Left(aList(LBound(aList)), Len(CStr(Now))+1)
      If IsDate(vDate) Then oDate = CDate(vDate)
    End If
  End If
  oFTP.Open "GET", vUrl, False
  DownloadFTP = HTTPSend(oFTP)
  If Not DownloadFTP Then 
    DownloadFTP = "File not found"
    Exit Function
  End If
  oStream.Write oFTP.ResponseBody
  oStream.SaveToFile vFile, 2
  oStream.Close
  setDate vFile, oDate
  DownloadFTP = True
End Function


Function DownloadHTTP (vUrl, vFile)
  Dim oDateTime, oHTTP, vFinished, oStream, vSize, vTries, oDate, vResult
  Set oHTTP = NewServerXMLHTTP
  Set oStream = NewADOBDStream
  vFinished = False
  oDate = Now
  vTries = 0
  Do 
    vTries = vTries + 1
    oHTTP.Open "GET", vUrl, False
    If oStream.Position > 0 Then 
      oHTTP.SetRequestHeader "Range", "bytes=" & oStream.Position &  "-"
    End If
    vResult = HTTPSend(oHTTP)
    If Not vResult Then
      DownloadHTTP = vResult
      Exit Function
    End If
    Select Case oHTTP.Status
      Case 200,206:
        If (oHTTP.Status = 200) Then oStream.Position = 0
        oStream.Write oHTTP.ResponseBody
        If InStr(oHTTP.getAllResponseHeaders,"Content-Length:") Then
          vSize = oHTTP.GetResponseHeader ("Content-Length")
          If CLng(vSize) <= CLng(oStream.Position) Then vFinished = True
        Else
          vFinished = True
        End If
        If InStr(oHTTP.getAllResponseHeaders,"Last-Modified:") > 0 Then
          oDate = ParseDate(oHTTP.GetResponseHeader("Last-Modified"))
        End If
      Case Else:
        Exit Do
    End Select
    If (vFinished = True) or (vTries > 5) Then Exit Do
  Loop
  If vFinished = False Then 
    DownloadHTTP = oHTTP.Status
  Else
    oStream.SaveToFile vFile, 2 ' overwrite
    setDate vFile, oDate
    DownloadHTTP = True
  End If
  oStream.Close  
End Function


Function NewServerXMLHTTP ()
  Dim tmpHTTP, vHTTPType
  Set tmpHTTP = Nothing
  On Error Resume Next
    For Each vHTTPType in Array("MSXML2.ServerXMLHTTP.6.0", "MSXML2.ServerXMLHTTP.4.0", "MSXML2.ServerXMLHTTP.3.0", "MSXML2.ServerXMLHTTP")
      If tmpHTTP is Nothing Then Set tmpHTTP = CreateObject(vHTTPType)
      If Not tmpHttp is Nothing Then Exit For
    Next
  On Error Goto 0
  tmpHTTP.setOption(2)= &h3300 ' SslErrorIgnoreFlags
  Set NewServerXMLHTTP = tmpHttp
End Function


Function NewADOBDStream ()
  Set NewADOBDStream = CreateObject("ADODB.Stream")
  NewADOBDStream.Type = 1 ' binary
  NewADOBDStream.Open
End Function


Function NewXMLHTTP ()
  Dim tmpHTTP, vObject
  Set tmpHttp = Nothing
  On Error Resume Next
  For Each vObject in Array("MSXML2.XMLHTTP.6.0", "MSXML2.XMLHTTP.4.0", "MSXML2.XMLHTTP.3.0", "MSXML2.XMLHTTP")
      If tmpHttp is Nothing Then Set tmpHttp = CreateObject(vObject)
      If Not tmpHttp is Nothing Then Exit For
    Next
  On Error Goto 0
  Set NewXMLHTTP = tmpHttp
End Function


Function ParseDate (vDate)
  Dim aDate, ind, vYear, vMonth, vDay, aMonth, oDateTime
  aDate = Split (vDate)
  ind=LBound(aDate)
  vYear = cInt (aDate(3+ind))
  If vYear < 2000 Then vYear = 2000 + vYear
  vDay = CInt(aDate(1+ind))
  vMonth = 1
  For Each aMonth in Array("JAN", "FEB", "MAR", "APR", "MAY", "JUN", "JUL", "AUG", "SEP", "OCT", "NOV", "DEC")
    If InStr(Ucase(aDate(2+ind)),Ucase(aMonth))=1 then exit for
    vMonth = vMonth + 1
  Next
  ParseDate = DateSerial(vYear, vMonth, vDay) + cDate (aDate(4+ind))
  Set oDateTime = CreateObject("WbemScripting.SWbemDateTime")
  oDateTime.SetVarDate ParseDate,false
  ParseDate = cdate(oDateTime.GetVarDate (true))
End Function


Function setDate (strFile, oDate)
  Dim objShell, objFolder, objFolderItem, vFolder, vFile
  vFolder = oFSO.GetParentFolderName(strFile)
  vFile = oFSO.GetFileName(strFile)
  Set objShell = CreateObject("Shell.Application")
  Set objFolder = objShell.NameSpace(vFolder)
  Set objFolderItem = objFolder.ParseName(vFile)
  objFolderItem.ModifyDate = oDate
End Function


Function CreateFolder (vFolder)
  Dim vParent, vResult
  vParent = oFSO.GetParentFolderName(vFolder)
  CreateFolder = False 
  If vParent = vFolder Or oFSO.FileExists(vParent) Then Exit Function
  If Not oFSO.FolderExists(vParent) Then CreateFolder = CreateFolder(vParent)
  If oFSO.FolderExists(vParent) And  Not oFSO.FileExists(vFolder) Then oFSO.CreateFolder vFolder
  If oFSO.FolderExists(vFolder) Then CreateFolder = True
End Function


Function HTTPSend (oXMLHTTP)
  On Error Resume Next
  oXMLHTTP.Send
  If Err.Number <> 0 Then
    HTTPSend = Err.Number
  Else
    HTTPSend = True  
  End If
  On Error Goto 0
End Function
