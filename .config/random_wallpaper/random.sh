#!/bin/bash

# Папка с обоями
WALLPAPER_DIR=~/wallpapers

# Выбираем случайный файл с расширениями .jpg, .jpeg и .png
WALLPAPER=$(find $WALLPAPER_DIR -type f \( -name "*.jpg" -o -name "*.jpeg" -o -name "*.png" \) | shuf -n 1)

# Устанавливаем обои на оба монитора с помощью feh
feh --bg-fill $WALLPAPER

# Применяем цветовую схему с помощью pywal
wal -i $WALLPAPER -n

# Обновляем polybar
# Перезагружаем polybar, чтобы применить изменения цветов
# Здесь предполагается, что у вас есть конфигурация polybar, использующая цвета из pywal
if pgrep -x "polybar" > /dev/null; then
    killall -q polybar
    # Ждем завершения всех процессов Polybar
    while pgrep -x "polybar" > /dev/null; do sleep 1; done
fi
polybar top &

# Перезапускаем BSPWM
# bspc wm -r