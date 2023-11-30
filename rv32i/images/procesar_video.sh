#!/bin/bash

# Verifica que se haya proporcionado un nombre de video como argumento
if [ $# -eq 0 ]; then
    echo "Usage: $0 <nombre_del_video>"
    exit 1
fi

# Nombre del archivo de video
video="$1"

# Nombre base del archivo sin extensión
video_name=$(basename -- "$video")
video_name="${video_name%.*}"

# Directorio de salida para las imágenes
output_dir="images/"
temp_dir="${output_dir}temp/"
mkdir "$temp_dir"

# Ruta del script de Python
python_script="${output_dir}getbitmap.py"

rm -rf "$output_dir$video_name.bin"

# Paso 1: Dividir el video en imágenes
ffmpeg -i "$video" -vf fps=40,scale=64:64 "$temp_dir"frame_%04d.png

# Paso 2: Aplicar el script de Python a cada imagen
for file in "$temp_dir"*.png; do
    python3 "$python_script" "$file"
    cat "${file%.*}.bin" >> "${output_dir}${video_name}.bin"
done

# Extraer audio y guardar en formato binario solo si el formato del video es mp4
if [[ "$video" == *.mp4 ]]; then
    ffmpeg -i "$video" -vn -acodec pcm_s16le -ar 44100 -ac 2 -f s16le -y "$output_dir$video_name.audio.bin"
fi

rm -rf "$temp_dir"