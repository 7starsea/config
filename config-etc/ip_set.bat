@echo off

set /p choice=   1.���þ�̬IP  2.���ö�̬IP  ��ѡ��[1��2]:
echo.
if "%choice%"=="1" goto staticip
if "%choice%"=="2" goto dynamicip
goto main

:staticip
@echo.
@echo -------------------------------------------
@echo.
@echo     �ֶ����������ַ ������������ IP��ַ   
@echo           IP��192.168.1.10                
@echo     �������룺255.255.255.0                
@echo         ���أ�192.168.1.254                
@echo          DNS��192.168.2.1               
@echo.
@echo -------------------------------------------
@echo.
@echo ��������...
@echo off
netsh interface ip set address name="������������" source=static addr=192.168.1.10 mask=255.255.255.0 gateway=192.168.1.254 gwmetric=1
netsh interface ip set dns name="������������" source=static addr=192.168.2.1
::netsh interface ip add dnsservers name="������������" address=192.168.2.1 index=1


echo �������
pause
exit 

:dynamicip
@echo.
@echo -------------------------------------------
@echo.
@echo    �Զ���ȡ�����ַ ������������ IP��ַ                    
@echo.
@echo -------------------------------------------
@echo.
@echo ��������...
@echo off
netsh interface ip set address name="������������" source=dhcp
netsh interface ip set dns name="������������" source=dhcp
echo �������
pause
exit
:end 

