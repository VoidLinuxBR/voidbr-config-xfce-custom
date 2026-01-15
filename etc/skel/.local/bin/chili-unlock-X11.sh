#!/bin/bash

# Detecta o display atual
DISPLAY_VALUE=$(echo $DISPLAY)

# Se estiver vazio, tenta pegar o display padrão
if [ -z "$DISPLAY_VALUE" ]; then
  DISPLAY_VALUE=":0"
fi

export DISPLAY="$DISPLAY_VALUE"
export XAUTHORITY="$HOME/.Xauthority"

# Libera acesso ao X pro root
xhost +SI:localuser:root

# Notifica o sucesso
if command -v notify-send >/dev/null 2>&1; then
  notify-send "🔥 ChiliUnlock" "Acesso liberado pro root no display $DISPLAY"
else
  echo "[INFO] notify-send não encontrado, mas permissão foi aplicada."
fi
