#!/bin/sh
set -eu

FONT_VERSION="v3.2.1"
FONTS="Hack JetBrainsMono"

case "$(uname)" in
  Darwin) FONT_DIR="$HOME/Library/Fonts" ;;
  Linux)  FONT_DIR="$HOME/.local/share/fonts" ;;
  *) echo "Unsupported OS" >&2; exit 1 ;;
esac

mkdir -p "$FONT_DIR"

for FONT_NAME in $FONTS; do
  if ls "$FONT_DIR"/"${FONT_NAME}"*"NerdFontMono"*.ttf >/dev/null 2>&1; then
    echo "$FONT_NAME Nerd Font Mono already installed, skipping."
    continue
  fi

  FONT_URL="https://github.com/ryanoasis/nerd-fonts/releases/download/${FONT_VERSION}/${FONT_NAME}.zip"
  tmp="$(mktemp -d)"
  curl -fsSL "$FONT_URL" -o "$tmp/font.zip"
  unzip -oq "$tmp/font.zip" -d "$FONT_DIR" '*NerdFontMono*.ttf'
  rm -rf "$tmp"
  echo "Installed $FONT_NAME Nerd Font Mono to $FONT_DIR"
done

if [ "$(uname)" = "Linux" ]; then
  fc-cache -f "$FONT_DIR"
fi
