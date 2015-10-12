#RequireAdmin
#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Res_Fileversion=1.0
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
#include "File.au3"
#include <ButtonConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
FileInstall("C:\Program Files\7-Zip\7z.exe", "7z.exe", 1)
Opt("WinTitleMatchMode", -2)
startup()
;setup();Uncomment this line if you need to reconfigure Mailer. Optionally you could edit the registry keys found at "HKLM\SOFTWARE\BetaLeaf Software\FalsePositiveReporter"
mail()
Func setup()
	#Region ### START Koda GUI section ### Form=
	$FalsePositiveSettings = GUICreate(StringTrimRight(@ScriptName, 4) & " Settings", 192, 210, 775, 254, BitOR($GUI_SS_DEFAULT_GUI, $DS_SETFOREGROUND))
	$OkButton = GUICtrlCreateButton("Ok", 0, 184, 75, 25)
	$CancelButton = GUICtrlCreateButton("Cancel", 116, 184, 75, 25)
	If RegRead("HKLM\SOFTWARE\BetaLeaf Software\FalsePositiveReporter", "Server") Then
		Global $serverDefault = RegRead("HKLM\SOFTWARE\BetaLeaf Software\FalsePositiveReporter", "Server")
	Else
		Global $serverDefault = "smtp.gmail.com"
	EndIf
	$ServerInput = GUICtrlCreateInput($serverDefault, 65, 5, 121, 21)
	$ServerLabel = GUICtrlCreateLabel("Server", 20, 8, 35, 17)
	If RegRead("HKLM\SOFTWARE\BetaLeaf Software\FalsePositiveReporter", "IPPort") Then
		Global $IPPortDefault = RegRead("HKLM\SOFTWARE\BetaLeaf Software\FalsePositiveReporter", "IPPort")
	Else
		Global $IPPortDefault = "465"
	EndIf
	$PortInput = GUICtrlCreateInput($IPPortDefault, 65, 33, 121, 21)
	GUICtrlSetLimit(-1, 5)
	$PortLabel = GUICtrlCreateLabel("Port", 20, 36, 23, 17)
	If RegRead("HKLM\SOFTWARE\BetaLeaf Software\FalsePositiveReporter", "FromName") Then
		Global $FromNameDefault = RegRead("HKLM\SOFTWARE\BetaLeaf Software\FalsePositiveReporter", "FromName")
	Else
		Global $FromNameDefault = "John Smith"
	EndIf
	$FromEmailInput = GUICtrlCreateInput($FromNameDefault, 65, 57, 121, 21)
	$FromEmailLabel = GUICtrlCreateLabel("From", 20, 60, 27, 17)
	If RegRead("HKLM\SOFTWARE\BetaLeaf Software\FalsePositiveReporter", "ToAddress") Then
		Global $ToAddressDefault = RegRead("HKLM\SOFTWARE\BetaLeaf Software\FalsePositiveReporter", "ToAddress")
	Else
		Global $ToAddressDefault = "support.is@cmclab.net;samples@digital-defender.com;sample@preventon.com;support-tech@returnil.com;malwaresample@herdprotect.com;info@chicalogic.com;submit@antiy.com;virus@arcabit.com;v3sos@ahnlab.com;virus@avast.com;virus@avira.com;virus_submission@bitdefender.com;samples@bluepointsecurity.com;malwaresubmit@avlab.comodo.com;vms@drweb.com;malware@emcosoftware.com;submit@emsisoft.com;virus@esafe.com;samples@escanav.com;submitvirus@fortinet.com;research@spy-emergency.com;viruslab@f-prot.com;labs@fsb-antivirus.com;vsamples@f-secure.com;samples@ikarus.at;submit@samples.immunet.com;info@kaspersky.com;support@jiangmin.com;research@lavasoft.com;virus_research@avertlabs.com;virus@micropoint.com.cn;avsubmit@submit.microsoft.com;virus@nanoav.ru;samples@eset.com;support@noralabs.com;support@norman.com;virus_info@inca.co.kr;virus@pandasecurity.com;psafe@psafe.com;kefu@360.cn;support@rubus.co.in;newvirus@s-cop.com;samples@sophos.com;detections@spybot.info;vlab@srnmicro.com;avsubmit@symantec.com;virus@hacksoft.com.pe;virus@thirtyseven4.com;submit@trojanhunter.com;support@simplysup.com;virus@filseclab.com;malware-cruncher@sunbelt-software.com;viruslab@hauri.co.kr;newvirus@anti-virus.by;virus@zillya.com;huangruimin@kingsoft.com;pomoc@mks.com.pl;support@aegislab.com;viruslab@quickheal.com;trojans@agnitum.com;bav@baidu.com;bkav@bkav.com.vn;huangruimin@kingsoft.com;samples@mysecuritywin.com"
	EndIf
	$ToEmailInput = GUICtrlCreateInput($ToAddressDefault, 65, 81, 121, 21)
	$ToEmailLabel = GUICtrlCreateLabel("To", 20, 84, 17, 17)
	If RegRead("HKLM\SOFTWARE\BetaLeaf Software\FalsePositiveReporter", "Username") Then
		Global $UsernameDefault = RegRead("HKLM\SOFTWARE\BetaLeaf Software\FalsePositiveReporter", "Username")
	Else
		Global $UsernameDefault = "myemail@gmail.com"
	EndIf
	$UserInput = GUICtrlCreateInput($UsernameDefault, 65, 105, 121, 21)
	$UserLabel = GUICtrlCreateLabel("User", 20, 108, 26, 17)
	If RegRead("HKLM\SOFTWARE\BetaLeaf Software\FalsePositiveReporter", "Password") Then
		Global $PasswordDefault = RegRead("HKLM\SOFTWARE\BetaLeaf Software\FalsePositiveReporter", "Password")
	Else
		Global $PasswordDefault = ""
	EndIf
	$PassInput = GUICtrlCreateInput($PasswordDefault, 65, 129, 121, 21, BitOR($GUI_SS_DEFAULT_INPUT, $ES_PASSWORD))
	$PassLabel = GUICtrlCreateLabel("Pass", 20, 132, 27, 17)
	If RegRead("HKLM\SOFTWARE\BetaLeaf Software\FalsePositiveReporter", "ssl") Then
		Global $ssl = RegRead("HKLM\SOFTWARE\BetaLeaf Software\FalsePositiveReporter", "ssl")
	Else
		Global $ssl = "4"
	EndIf
	$UseSSL = GUICtrlCreateCheckbox("Use SSL?", 65, 160, 121, 17, BitOR($GUI_SS_DEFAULT_CHECKBOX, $BS_LEFT))
	GUICtrlSetState($UseSSL, $ssl)
	GUISetState(@SW_SHOW)
	#EndRegion ### END Koda GUI section ###
	While 1
		$nMsg = GUIGetMsg()
		Switch $nMsg
			Case $GUI_EVENT_CLOSE
				Exit
			Case $CancelButton
				Exit
			Case $OkButton
				GUISetState(@SW_HIDE)
				Global $SmtpServer = GUICtrlRead($ServerInput)
				Global $IPPort = GUICtrlRead($PortInput)
				Global $FromName = GUICtrlRead($FromEmailInput)
				Global $ToAddress = GUICtrlRead($ToEmailInput)
				Global $Username = GUICtrlRead($UserInput)
				Global $Password = GUICtrlRead($PassInput)
				Global $FromAddress = $Username
				Global $ssl = GUICtrlRead($UseSSL)
				RegWrite("HKLM\SOFTWARE\BetaLeaf Software\FalsePositiveReporter", "Server", "REG_SZ", $SmtpServer)
				RegWrite("HKLM\SOFTWARE\BetaLeaf Software\FalsePositiveReporter", "IPPort", "REG_SZ", $IPPort)
				RegWrite("HKLM\SOFTWARE\BetaLeaf Software\FalsePositiveReporter", "FromName", "REG_SZ", $FromName)
				RegWrite("HKLM\SOFTWARE\BetaLeaf Software\FalsePositiveReporter", "ToAddress", "REG_SZ", $ToAddress)
				RegWrite("HKLM\SOFTWARE\BetaLeaf Software\FalsePositiveReporter", "Username", "REG_SZ", $Username)
				RegWrite("HKLM\SOFTWARE\BetaLeaf Software\FalsePositiveReporter", "Password", "REG_SZ", $Password)
				RegWrite("HKLM\SOFTWARE\BetaLeaf Software\FalsePositiveReporter", "FromAddress", "REG_SZ", $FromAddress)
				RegWrite("HKLM\SOFTWARE\BetaLeaf Software\FalsePositiveReporter", "ssl", "REG_SZ", $ssl)
				Return
		EndSwitch
	WEnd
EndFunc   ;==>setup
Func startup()
	If RegRead("HKLM\SOFTWARE\BetaLeaf Software\FalsePositiveReporter", "Server") Then
		Global $SmtpServer = RegRead("HKLM\SOFTWARE\BetaLeaf Software\FalsePositiveReporter", "Server")
	Else
		setup()
	EndIf
	If RegRead("HKLM\SOFTWARE\BetaLeaf Software\FalsePositiveReporter", "IPPort") Then
		Global $IPPort = RegRead("HKLM\SOFTWARE\BetaLeaf Software\FalsePositiveReporter", "IPPort")
	Else
		setup()
	EndIf
	If RegRead("HKLM\SOFTWARE\BetaLeaf Software\FalsePositiveReporter", "FromName") Then
		Global $FromName = RegRead("HKLM\SOFTWARE\BetaLeaf Software\FalsePositiveReporter", "FromName")
	Else
		setup()
	EndIf
	If RegRead("HKLM\SOFTWARE\BetaLeaf Software\FalsePositiveReporter", "ToAddress") Then
		Global $ToAddress = RegRead("HKLM\SOFTWARE\BetaLeaf Software\FalsePositiveReporter", "ToAddress")
	Else
		setup()
	EndIf
	If RegRead("HKLM\SOFTWARE\BetaLeaf Software\FalsePositiveReporter", "Username") Then
		Global $Username = RegRead("HKLM\SOFTWARE\BetaLeaf Software\FalsePositiveReporter", "Username")
		Global $FromAddress = $Username
	Else
		setup()
	EndIf
	If RegRead("HKLM\SOFTWARE\BetaLeaf Software\FalsePositiveReporter", "Password") Then
		Global $Password = RegRead("HKLM\SOFTWARE\BetaLeaf Software\FalsePositiveReporter", "Password")
	Else
		setup()
	EndIf
	If RegRead("HKLM\SOFTWARE\BetaLeaf Software\FalsePositiveReporter", "ssl") Then
		Global $ssl = RegRead("HKLM\SOFTWARE\BetaLeaf Software\FalsePositiveReporter", "ssl")
	Else
		setup()
	EndIf
EndFunc   ;==>startup
Func mail()
	$Subject = "False Positive" ; subject from the email - can be anything you want it to be
	$Body = 'The password to decrypt this archive is "infected"'
	Local $sFileName = ""
	Local $tpath = @TempDir & "\" & @MON & "-" & @MDAY & "-" & @YEAR & "-" & @HOUR & "-" & @MIN & "-" & @SEC & "\"
	For $i = 1 To $cmdline[0]
		If StringInStr($cmdline[$i], ".lnk") Then ;Follow Link
			Local $shortcut = FileGetShortcut($cmdline[$i])
			$cmdline[$i] = $shortcut[0]
		EndIf
		If StringInStr($cmdline[$i], ".exe") Then ;Bypass Email Exe filter.
			FileCopy($cmdline[$i], StringTrimRight($cmdline[$i], 4) & ".vir", 1)
			$cmdline[$i] = StringTrimRight($cmdline[$i], 4) & ".vir"
		EndIf
		ShellExecuteWait(@ScriptDir & '\7z.exe', 'a -tzip "' & $tpath & 'InfectedFiles.zip" "' & $cmdline[$i] & '" -pinfected', $tpath, '', @SW_HIDE)
		If FileExists(StringTrimRight($cmdline[$i], 4) & ".vir") Then FileDelete(StringTrimRight($cmdline[$i], 4) & ".vir")
	Next
	$AttachFiles = $tpath & "InfectedFiles.zip"
	$CcAddress = "" ; address for cc - leave blank if not needed
	$BccAddress = "" ; address for bcc - leave blank if not needed
	$Importance = "High" ; Send message priority: "High", "Normal", "Low"
	Global $oMyRet[2]
	Global $oMyError = ObjEvent("AutoIt.Error", "MyErrFunc")
	$rc = _INetSmtpMailCom($SmtpServer, $FromName, $FromAddress, $ToAddress, $Subject, $Body, $AttachFiles, $CcAddress, $BccAddress, $Importance, $Username, $Password, $IPPort, $ssl)
	If @error Then
		MsgBox(0, "Error sending message", "Error code:" & @error & "  Description:" & $rc)
	EndIf
	; The UDF
EndFunc   ;==>mail
Func _INetSmtpMailCom($s_SmtpServer, $s_FromName, $s_FromAddress, $s_ToAddress, $s_Subject = "", $as_Body = "", $s_AttachFiles = "", $s_CcAddress = "", $s_BccAddress = "", $s_Importance = "Normal", $s_Username = "", $s_Password = "", $IPPort = 25, $ssl = 0)
	Local $objEmail = ObjCreate("CDO.Message")
	$objEmail.From = '"' & $s_FromName & '" <' & $s_FromAddress & '>'
	$objEmail.To = $s_ToAddress
	Local $i_Error = 0
	Local $i_Error_desciption = ""
	If $s_CcAddress <> "" Then $objEmail.Cc = $s_CcAddress
	If $s_BccAddress <> "" Then $objEmail.Bcc = $s_BccAddress
	$objEmail.Subject = $s_Subject
	If StringInStr($as_Body, "<") And StringInStr($as_Body, ">") Then
		$objEmail.HTMLBody = $as_Body
	Else
		$objEmail.Textbody = $as_Body & @CRLF
	EndIf
	If $s_AttachFiles <> "" Then
		Local $S_Files2Attach = StringSplit($s_AttachFiles, ";")
		For $x = 1 To $S_Files2Attach[0]
			$S_Files2Attach[$x] = _PathFull($S_Files2Attach[$x])
;~          ConsoleWrite('@@ Debug : $S_Files2Attach[$x] = ' & $S_Files2Attach[$x] & @crlf & '>Error code: ' & @error & @crlf) ;### Debug Console
			If FileExists($S_Files2Attach[$x]) Then
				ConsoleWrite('+> File attachment added: ' & $S_Files2Attach[$x] & @CRLF)
				$objEmail.AddAttachment($S_Files2Attach[$x])
			Else
				MsgBox("0", "Error", 'File not found to attach: ' & $S_Files2Attach[$x])
				SetError(1)
				Return 0
			EndIf
		Next
	EndIf
	$objEmail.Configuration.Fields.Item("http://schemas.microsoft.com/cdo/configuration/sendusing") = 2
	$objEmail.Configuration.Fields.Item("http://schemas.microsoft.com/cdo/configuration/smtpserver") = $s_SmtpServer
	If Number($IPPort) = 0 Then $IPPort = 25
	$objEmail.Configuration.Fields.Item("http://schemas.microsoft.com/cdo/configuration/smtpserverport") = $IPPort
	;Authenticated SMTP
	If $s_Username <> "" Then
		$objEmail.Configuration.Fields.Item("http://schemas.microsoft.com/cdo/configuration/smtpauthenticate") = 1
		$objEmail.Configuration.Fields.Item("http://schemas.microsoft.com/cdo/configuration/sendusername") = $s_Username
		$objEmail.Configuration.Fields.Item("http://schemas.microsoft.com/cdo/configuration/sendpassword") = $s_Password
	EndIf
	If $ssl = "1" Then
		$objEmail.Configuration.Fields.Item("http://schemas.microsoft.com/cdo/configuration/smtpusessl") = True
	EndIf
	;Update settings
	$objEmail.Configuration.Fields.Update
	; Set Email Importance
	Switch $s_Importance
		Case "High"
			$objEmail.Fields.Item("urn:schemas:mailheader:Importance") = "High"
		Case "Normal"
			$objEmail.Fields.Item("urn:schemas:mailheader:Importance") = "Normal"
		Case "Low"
			$objEmail.Fields.Item("urn:schemas:mailheader:Importance") = "Low"
	EndSwitch
	$objEmail.Fields.Update
	; Sent the Message
	$objEmail.Send
	If @error Then
		SetError(2)
		Return $oMyRet[1]
	Else
		MsgBox(0, "Email", "OK")
	EndIf
	$objEmail = ""
EndFunc   ;==>_INetSmtpMailCom
;
;
; Com Error Handler
Func MyErrFunc()
	$HexNumber = Hex($oMyError.number, 8)
	$oMyRet[0] = $HexNumber
	$oMyRet[1] = StringStripWS($oMyError.description, 3)
	ConsoleWrite("### COM Error !  Number: " & $HexNumber & "   ScriptLine: " & $oMyError.scriptline & "   Description:" & $oMyRet[1] & @CRLF)
	SetError(1); something to check for when this function returns
	Return
EndFunc   ;==>MyErrFunc
