---
title: Windows 8 用户密码管理批处理
tags:
  - win管理员密码修改
  - 批处理
  - 密码修改
  - windows密码
categories:
  - 杂
abbrlink: 690688740
photos: ['http://i4.buimg.com/567571/84bc0e716d41e7b5.jpg']
date: 2017-04-06 17:45:46
---

Windows 8 用户密码管理批处理
批处理快捷方便，可以节省一些时间。  

![Windows 8 用户密码管理](http://i4.buimg.com/567571/84bc0e716d41e7b5.jpg)

请复制下面的代码，右键另存为.bat文件。  
双击运行就可以愉快的修改管理员密码了。  


```
@echo off
echo;
REM @ECHO +++ 如需变更用户登陆密码请以管理员身份运行 +++
net user
REM @ECHO +++ 请以管理员身份运行 输入要变更的密码 以回车确认修改 +++
echo;
@ECHO +++ 请输入要变更密码的用户名 +++
echo;

:: BatchGotAdmin 
:------------------------------------- 
REM --> Check for permissions 
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system" 

REM --> If error flag set, we do not have admin. 
if '%errorlevel%' NEQ '0' ( 
 echo Requesting administrative privileges... 
 goto UACPrompt 
) else ( goto gotAdmin ) 

:UACPrompt 
 echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs" 
 echo UAC.ShellExecute "%~s0", "", "", "runas", 1 >> "%temp%\getadmin.vbs" 

 "%temp%\getadmin.vbs" 
 exit /B 

:gotAdmin 
 if exist "%temp%\getadmin.vbs" ( del "%temp%\getadmin.vbs" ) 
 pushd "%CD%" 
 CD /D "%~dp0" 
:-------------------------------------- 

set /p PCUser=
net user %PCUser% *
rem net user Wego *
echo;
@ECHO +++窗口将在5秒后自动关闭+++
echo;
rem control userpasswords2 命令可打开管理窗口
echo +++ 请按任意键退出 +++
echo;
pause > nul
```
