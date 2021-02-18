'*************************************************************
'******** parse_jpeg_for_mosaic.vbs V1.1 02/2021 *************
'*************************************************************
'***Set your own paths***************************************
objStartFolder = "D:\Astro-Stellina\stellina-bdaf4f"
mosaicFolder= "D:\Astro-Stellina\mosaic"
ExifToolPath= "D:\Astro-Stellina\exiftool.exe"
'*************************************************************
'***Usage: cscript parse_jpeg_for_mosaic.vbs m80 *************
'*************************************************************

 
Dim objFSO, oFolder, objShell
Set objShell = CreateObject("WScript.Shell")
Set objFSO = Createobject("Scripting.FileSystemObject")
Set objArgs = Wscript.Arguments

target = ucase(objArgs(0))
NumberOfFiles=0
MinIndex = 9

mosaicFolder= mosaicFolder & "\"
destination = mosaicFolder & target & "\"

If objFSO.FolderExists(mosaicFolder & target) Then
    Else
    Set objFolder = objFSO.CreateFolder(mosaicFolder & target)
End If

wscript.echo date&" "&time&" ---> Searching for "&target
ShowSubfolders objFSO.GetFolder(objStartFolder)

FinalFolder = replace(trim(mosaicFolder & target & "-" & NumberOfFiles & "-" & replace(date,"/","")& " " &replace(time,":",""))," ","-")
objFSO.movefolder mosaicFolder & target,  FinalFolder
wscript.echo date&" "&time&" ---> "& NumberOfFiles &" jpeg have been copied to "  & FinalFolder






Sub ShowSubFolders(Folder)
    For Each Subfolder in Folder.SubFolders
        

        if InStr(Subfolder.path, target) and InStr(Subfolder.path, "capture")Then
            'wscript.echo Subfolder.Path
            CollectData(Subfolder.Path)
        end if

     
     ShowSubFolders Subfolder

    Next
End Sub


Function CollectData(path)

    Set oFolder = objFSO.GetFolder(path)

    indexmax=0
    filepath=""
    parent=Replace(Replace(Replace(oFolder.DateLastModified,"/",""),":","")," ","-")
    For Each oFile in oFolder.Files
        ext = objFSO.GetExtensionName(oFile.path)
       
       
       
        if ext="jpeg" Then
           index=cInt(mid(oFile.name,5,4))
        
            if index > indexmax Then
                indexmax = index
                filepath = oFile.path
                filename = oFile.name
           
            end if
        
        
        
        end if
        
         
     


    Next 

        if indexmax > MinIndex Then
                objFSO.CopyFile filepath, destination, TRUE
                NumberOfFiles=NumberOfFiles+1
                    

              
                Set objWshScriptExec = objShell.Exec(ExifToolPath & " -ImageDescription "& chr(34) & filepath & chr(34))
                Set objStdOut = objWshScriptExec.StdOut

                While Not objStdOut.AtEndOfStream
                    strLine = objStdOut.ReadLine
                    expname = replace(trim(right(strLine,len(strline)-instr(strLine,":")))," ","")
                Wend
                Set objWshScriptExec = objShell.Exec(ExifToolPath & " -ModifyDate "& chr(34) & filepath & chr(34))
                Set objStdOut = objWshScriptExec.StdOut

                While Not objStdOut.AtEndOfStream
                    strLine = objStdOut.ReadLine
                   datename = replace(replace(right(strLine,len(strline)-instr(strLine,":")),"/","-"),":","")
                Wend

                
                objFSO.Movefile destination & filename, destination & expname & "---" & parent & ".jpeg"
        End if
end function

