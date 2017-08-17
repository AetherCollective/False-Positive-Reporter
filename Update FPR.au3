#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Res_Fileversion=1.1
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
#include <InetConstants.au3>
#include <Misc.au3>
Download(BinaryToString(InetRead("https://raw.githubusercontent.com/BetaLeaf/False-Positive-Reporter/master/Update.txt", 1)), "FPR.exe", "FPR.exe")
ShellExecute("FPR.exe", "", @ScriptDir)

Func Download($sSrc, $sDest, $sName)
	$aDest = StringSplit($sDest, "\")
	Local $sDestDir
	For $i = 1 To UBound(StringSplit($sDest, "\")) - 2
		$sDestDir &= $aDest[$i] & "\"
	Next
	ClipPut($sDestDir)
	If Not FileExists($sDestDir) Then DirCreate($sDestDir)
	Do
		$hDownload = InetGet($sSrc, $sDest & ".downloading", $INET_FORCERELOAD, BitOR($INET_DOWNLOADBACKGROUND, $INET_BINARYTRANSFER))
		While InetGetInfo($hDownload, $INET_DOWNLOADCOMPLETE) = False
			ProgressSet(InetGetInfo($hDownload, $INET_DOWNLOADREAD) / InetGetInfo($hDownload, $INET_DOWNLOADSIZE) * 110, "Downloaded " & Round(InetGetInfo($hDownload, $INET_DOWNLOADREAD) / 1000000, 2) & " MB of " & Round(InetGetInfo($hDownload, $INET_DOWNLOADSIZE) / 1000000, 2) & " MB.", "Downloading " & $sName & "...")
			Select
				Case InetGetInfo($hDownload, $INET_DOWNLOADSUCCESS) = True
					ProgressSet("100", "Download Successful.", "Downloaded " & $sName)
					Sleep(1000)
					ExitLoop
				Case InetGetInfo($hDownload, $INET_DOWNLOADERROR) = True
					ProgressSet("0", "Retrying..." & @CRLF & "Press ESC to skip retrying.", "Download " & $sName & " Failed")
					$timer = TimerInit()
					Do
						If _IsPressed("1B") = True Then
							FileDelete($sDest & ".downloading")
							Return 0
						EndIf
					Until TimerDiff($timer) > 3000
					ExitLoop
			EndSelect
			Sleep((1000 / @DesktopRefresh) + 1)
		WEnd
	Until InetGetInfo($hDownload, $INET_DOWNLOADSUCCESS) = True
	FileClose($sDest & ".downloading")
	FileRecycle($sDest)
	FileMove($sDest & ".downloading", $sDest)
	Return 1
EndFunc   ;==>Download