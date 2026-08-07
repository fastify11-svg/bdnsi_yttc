@echo off
C:\xampp\mysql\bin\mysql.exe -u root -e "CREATE DATABASE IF NOT EXISTS yttccomb_temp;"
echo Importing SQL file...
C:\xampp\mysql\bin\mysql.exe -u root yttccomb_temp < C:\Users\Naeem\Downloads\yttccomb_application.sql
echo Done!
