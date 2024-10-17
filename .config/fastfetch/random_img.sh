#!/bin/bash

# Путь к папке с изображениями
IMAGE_DIR="$HOME/.config/fastfetch/images"

# Выбор случайного изображения из папки
RANDOM_IMAGE=$(find "$IMAGE_DIR" -type f | shuf -n 1)

# Обновление конфигурационного файла fastfetch (заменяем в строке source путь к изображению)
CONFIG_FILE="$HOME/.config/fastfetch/config.jsonc"

# Используем sed для замены строки "source" на новый путь к изображению
sed -i "s|\"source\": \".*\"|\"source\": \"$RANDOM_IMAGE\"|" "$CONFIG_FILE"

# Запуск fastfetch
fastfetch