#!/bin/bash

# Script för att skapa användare och konfigurera deras hemkataloger.
# Scriptet måste köras som root eftersom useradd och filrättigheter kräver administratörsbehörighet.

# Kontrollera att scriptet körs som root.
if [ "$EUID" -ne 0 ]; then
    echo "Fel: Detta script måste köras som root."
    exit 1
fi

# Kontrollera att minst ett användarnamn skickas in som argument.
if [ "$#" -eq 0 ]; then
    echo "Fel: Ange minst ett användarnamn."
    exit 1
fi

# Loopa igenom alla användarnamn som skickas in till scriptet.
for username in "$@"; do
    echo "Skapar användare: $username"

    # Skapa användaren med hemkatalog.
    useradd -m "$username"

    # Skapa undermappar i användarens hemkatalog.
    mkdir -p "/home/$username/Documents"
    mkdir -p "/home/$username/Downloads"
    mkdir -p "/home/$username/Work"

done
