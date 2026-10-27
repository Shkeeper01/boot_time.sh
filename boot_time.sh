#!/bin/bash

# --- Конфигурация ---
MAX_TIME="09:05"                # Максимально разрешённое время загрузки, СВОЁ ВРЕМЯ ВЫСТАВЛЯЕТЕ САМИ! 
LOG_FILE="$HOME/boot_check.log"  

# --- Сбор данных ---
BOOT_TIME=$(uptime -s | awk '{print $2}' | cut -d':' -f1-2)  # Время загрузки (ЧЧ:ММ)
CURRENT_USER=$(whoami)                                       # Текущий пользователь
HOSTNAME=$(hostname)                                         # Имя компьютера
IP_ADDR=$(hostname -I | awk '{print $1}')                    # Первый IP-адрес

# --- Проверка времени ---
if [[ "$BOOT_TIME" > "$MAX_TIME" ]]; then
    # Позже 09:05 — предупреждение
    zenity --warning \
           --title="⚠️ Нарушение графика!" \
           --text="Компьютер <b>$HOSTNAME</b> ($IP_ADDR) был включен в <b>$BOOT_TIME</b>.\nПользователь: <b>$CURRENT_USER</b>\n\n<b>Превышено разрешённое время ($MAX_TIME)!</b>" \
           --width=500
    STATUS="Нарушение"
else
    # В пределах нормы — приветствие
    zenity --info \
           --title="Добро пожаловать!" \
           --text="Компьютер <b>$HOSTNAME</b> ($IP_ADDR) включён в <b>$BOOT_TIME</b>.\nПользователь: <b>$CURRENT_USER</b>\n\nВремя загрузки в норме." \
           --width=400
    STATUS="Успех"
fi

# --- Запись в лог ---
{
    echo "================================="
    echo "Дата: $(date '+%Y-%m-%d %H:%M:%S')"
    echo "Пользователь: $CURRENT_USER"
    echo "Компьютер: $HOSTNAME ($IP_ADDR)"
    echo "Время загрузки: $BOOT_TIME"
    echo "Статус: $STATUS (Макс. время: $MAX_TIME)"
} >> "$LOG_FILE"
