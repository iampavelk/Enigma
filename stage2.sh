#!/usr/bin/env bash

# Function to get ASCII value of a character
ord() {
    local letter="$1"
    printf "%d\n" "'$letter"
}

# Function to get character from ASCII value
chr() {
    local value="$1"
    printf "%b\n" "$(printf "\\%03o" "$value")"
}

# Ask for an uppercase letter
echo -n "Enter an uppercase letter:"
read letter

# Ask for a key
echo -n "Enter a key:"
read key

# Validate input
# Check if letter is a single uppercase letter (A-Z)
if [[ ! "$letter" =~ ^[A-Z]$ ]]; then
    echo "Invalid key or letter!"
    exit 1
fi

# Check if key is a single digit (0-9)
if [[ ! "$key" =~ ^[0-9]$ ]]; then
    echo "Invalid key or letter!"
    exit 1
fi

# Convert letter to ASCII value
letter_ascii=$(ord "$letter")

# Calculate position in alphabet (A=0, B=1, ..., Z=25)
letter_pos=$((letter_ascii - 65))

# Apply the cipher (shift by key, wrap around using modulo 26)
encrypted_pos=$(((letter_pos + key) % 26))

# Convert back to ASCII value (add 65 to get back to A-Z range)
encrypted_ascii=$((encrypted_pos + 65))

# Convert ASCII value back to character
encrypted_letter=$(chr "$encrypted_ascii")

# Output the result
echo "Encrypted letter: $encrypted_letter"
