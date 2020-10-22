#!/usr/bin/env bash

fonts_dir="${HOME}/.local/share/fonts"
if [ ! -d "${fonts_dir}" ]; then
    echo "mkdir -p $fonts_dir"
    mkdir -p "${fonts_dir}"
else
    echo "Fontes encontradas no diretório $fonts_dir"
fi

for type in Bold Light Medium Regular Retina; do
    file_path="${HOME}/.local/share/fonts/FiraCode-${type}.ttf"
    file_url="https://github.com/tonsky/FiraCode/blob/master/distr/ttf/FiraCode-${type}.ttf?raw=true"
    if [ ! -e "${file_path}" ]; then
        echo "wget -O $file_path $file_url"
        wget -O "${file_path}" "${file_url}"
    else
	echo "A fonte $file_path já está instalada!"
    fi;
done

echo "fc-cache -f"
fc-cache -f

if gsettings --help &> /dev/null then 
	ACTUALLY_FONT=$(gsettings get org.gnome.desktop.interface monospace-font-name)
	if [ "$ACTUALLY_FONT" = "'Ubuntu Mono 13'" ]; then
		 gsettings set org.gnome.desktop.interface monospace-font-name 'Fira Code Medium 11'
	fi
else
	echo "Parece que o gsettings não está instalado! Selecione usa fonte manualmente em"
	echo "CTRL+ATL+T > Editar > Preferências > Marque fonte personalizada > Selecione Fira Code Medium"
fi
