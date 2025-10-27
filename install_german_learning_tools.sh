#!/usr/bin/env bash
# =========================================================
#  German Learning Environment Setup for Ubuntu 24.04
#  Author: Isiaka Mosudi
#  Description: Installs open-source tools to accelerate
#  German language learning on Ubuntu.
# =========================================================

set -e  # Stop on first error

echo "=============================================="
echo "🧠 Setting up German Learning Environment..."
echo "=============================================="

# ---- Update system ----
sudo apt update -y && sudo apt upgrade -y

# ---- Install core learning tools ----
echo "📚 Installing Anki (flashcard system)..."
sudo apt install -y anki

echo "📖 Installing GoldenDict (dictionary frontend)..."
sudo apt install -y goldendict

echo "🗣️ Installing eSpeak NG (German TTS engine)..."
sudo apt install -y espeak-ng

echo "✅ Installing LanguageTool (grammar checker)..."
sudo snap install languagetool

# ---- Optional: Add stardict dictionaries for GoldenDict ----
echo "📦 Installing Stardict German-English dictionaries..."
sudo apt install -y stardict-english-german stardict-german-english || echo "⚠️ Some Stardict dictionaries may not be in Ubuntu 24.04 repos."

# ---- Install supporting tools ----
echo "🌐 Installing wget, curl, git for future downloads..."
sudo apt install -y wget curl git

# ---- Optional: Tatoeba CLI for sentence practice ----
echo "💬 Installing Tatoeba CLI (via Python)..."
sudo apt install -y python3-pip
pip install tatoeba-cli --break-system-packages || pip install tatoeba-cli --user

# ---- Optional: Lingva Translate (frontend for Google Translate) ----
echo "🌍 Installing Lingva Translate via Docker (optional)..."
if command -v docker &> /dev/null
then
    read -p "Do you want to deploy Lingva Translate locally? (y/n): " yn
    case $yn in
        [Yy]* ) docker run -d -p 5000:3000 thedaviddelta/lingva-translate;;
        * ) echo "Skipping Lingva Translate setup.";;
    esac
else
    echo "⚠️ Docker not found. Skipping Lingva Translate."
fi

# ---- Final notes ----
echo ""
echo "🎉 Installation complete!"
echo "Tools installed:"
echo "  - Anki (Spaced Repetition)"
echo "  - GoldenDict (Dictionary with Stardict support)"
echo "  - eSpeak NG (German text-to-speech)"
echo "  - LanguageTool (Grammar checking)"
echo "  - Tatoeba CLI (Sentence examples)"
echo ""
echo "💡 Tips:"
echo "  - Launch Anki and add a 'German Frequency Deck'."
echo "  - Open GoldenDict → Edit → Dictionaries → Add sources (e.g., /usr/share/stardict)."
echo "  - Test eSpeak with: espeak-ng -v de 'Guten Morgen, wie geht es dir?'"
echo "  - Run LanguageTool locally: languagetool"
echo ""
echo "✅ All set. Viel Erfolg beim Deutschlernen!"
echo "=============================================="