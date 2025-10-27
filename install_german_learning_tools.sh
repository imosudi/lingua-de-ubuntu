#!/usr/bin/env bash
# ============================================================
#  Lingua-de-Ubuntu: German Learning Environment Setup Script
#  Author: Isiaka Olukayode Mosudi
#  License: BSD-3-Clause
#  Compatible with: Ubuntu 24.04 LTS
# ============================================================

set -e

echo "🚀 Starting Lingua-de-Ubuntu setup..."

# ------------------------------
# Update system and essentials
# ------------------------------
sudo apt update && sudo apt upgrade -y
sudo apt install -y curl wget git python3 python3-pip build-essential unzip

# ------------------------------
# Install Anki (Flashcard Tool)
# ------------------------------
echo "📘 Installing Anki..."
sudo apt install -y anki

# ------------------------------
# Install GoldenDict (Dictionary Frontend)
# ------------------------------
echo "📖 Installing GoldenDict..."
sudo apt install -y goldendict
mkdir -p ~/Dictionaries

# ------------------------------
# Install LanguageTool (Grammar & Spell Checker)
# ------------------------------
echo "📝 Installing LanguageTool..."
sudo apt install -y default-jre
mkdir -p ~/LanguageTool && cd ~/LanguageTool
LT_VERSION="6.5"
wget -q "https://languagetool.org/download/LanguageTool-${LT_VERSION}.zip" -O LT.zip
unzip -o LT.zip && rm LT.zip
cd ~

# ------------------------------
# Install eSpeak (Text-to-Speech)
# ------------------------------
echo "🗣️ Installing eSpeak..."
sudo apt install -y espeak

# ------------------------------
# Install Forvo Downloader (Pronunciation Audio Fetcher)
# ------------------------------
echo "🔊 Installing Forvo Downloader..."
pip install --upgrade pip
pip install forvo-downloader

# Create a helper alias for easy access
echo "alias forvo='python3 -m forvo_downloader.cli'" >> ~/.bashrc
source ~/.bashrc

# ------------------------------
# Optional: Audio player for listening practice
# ------------------------------
sudo apt install -y vlc

# ------------------------------
# Summary
# ------------------------------
echo "✅ Lingua-de-Ubuntu setup complete!"
echo ""
echo "📦 Installed tools:"
echo " - Anki (Flashcards)"
echo " - GoldenDict (Multilingual Dictionary)"
echo " - LanguageTool (Grammar & Spell Checker)"
echo " - eSpeak (Text-to-Speech)"
echo " - Forvo Downloader (Pronunciation Fetcher)"
echo ""
echo "💡 Tips:"
echo " - Run 'anki' to start creating decks."
echo " - Launch 'goldendict' and add dictionaries in ~/Dictionaries."
echo " - Use 'java -jar ~/LanguageTool/LanguageTool-6.5/languagetool.jar' for grammar checking."
echo " - Run 'forvo --help' to fetch German pronunciations by keyword."
echo ""
echo "🎯 Viel Erfolg beim Deutschlernen!"
echo "=============================================="