boot_time.sh

Простой скрипт для учета рабочего времени. Предназначен для linux (ubuntu, debian систем). Логика проста - скрипт анализирует время включения компьютера, максимальное время включения компьютера в 09:05 (СВОЕ ВРЕМЯ ВЫСТАВЛЯЕТЕ КАК ХОТИТЕ, это лишь под мое рабочее время!!!) после считается опоздание. Используется "zenity" для вывода диалогового окна. (Предварительно на все станции установите пакет:  sudo apt install zenity!) Формирует лог файл (boot_check.log) в директории $HOME. Скрипт предназначен на установку сервера в директорию /scripts, /srv. Тестировался на Ubuntu server 20.04/24.04. Используется домен LDAP. В лог файл передается следующее:
    1. Время включения ПК 
    2. Текущий пользователь. 
    3. hostname (учетная запись) 
    4. IP адрес ПК. 
Массовый цикл сбора логов со всех ПК и функцию отправки через почту/telegram/slack - удалил.

A simple script for recording working hours. Designed for linux (ubuntu, debian systems). The logic is simple - the script analyzes the computer's turn-on time, the maximum computer turn-on time is at 09:05 (SET YOUR TIME AS YOU WANT, it's only for my working hours!!!) after that, the delay is considered. Zenity is used to display the dialog box. (Pre-install the sudo apt install zenity package on all stations!) Generates a log file (boot_check.log) in the $HOME directory. The script is intended for installing the server in the /scripts, /srv directories. It was tested on Ubuntu server 20.04/24.04. An LDAP domain is used. The following is passed to the log file:
    1. PC boot time
    2. Current user. 
    3. hostname (account) 
    4. PC IP address. 
I removed the mass log collection cycle from all PCs and the function for sending logs via email/Telegram/Slack.

