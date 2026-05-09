#!/bin/bash

# Script för att skapa användare och konfigurera deras hemkataloger.
# Scriptet måste köras som root eftersom useradd och filrättigheter kräver administratörsbehörighet.

# Kontrollera att scriptet körs som root.
if [ "$EUID" -ne 0 ]; then
    echo "Fel: Detta script måste köras som root."
    exit 1
fi