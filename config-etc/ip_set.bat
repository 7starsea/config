@echo off

set /p choice=   1.设置静态IP  2.设置动态IP  请选择[1或2]:
echo.
if "%choice%"=="1" goto staticip
if "%choice%"=="2" goto dynamicip
goto main

:staticip
@echo.
@echo -------------------------------------------
@echo.
@echo     手动设置网络地址 无线网络连接 IP地址   
@echo           IP：192.168.1.10                
@echo     子网掩码：255.255.255.0                
@echo         网关：192.168.1.254                
@echo          DNS：192.168.2.1               
@echo.
@echo -------------------------------------------
@echo.
@echo 正在设置...
@echo off
netsh interface ip set address name="无线网络连接" source=static addr=192.168.1.10 mask=255.255.255.0 gateway=192.168.1.254 gwmetric=1
netsh interface ip set dns name="无线网络连接" source=static addr=192.168.2.1
::netsh interface ip add dnsservers name="无线网络连接" address=192.168.2.1 index=1


echo 设置完成
pause
exit 

:dynamicip
@echo.
@echo -------------------------------------------
@echo.
@echo    自动获取网络地址 无线网络连接 IP地址                    
@echo.
@echo -------------------------------------------
@echo.
@echo 正在设置...
@echo off
netsh interface ip set address name="无线网络连接" source=dhcp
netsh interface ip set dns name="无线网络连接" source=dhcp
echo 设置完成
pause
exit
:end 

