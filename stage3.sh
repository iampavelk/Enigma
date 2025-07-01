#!/usr/bin/env bash

key=3
re='^[A-Z ]+$'
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

encrypt() {
    echo -n "Enter a message:"
    read string
    if [[ "$string" =~ $re ]]; then
        encoded=''
        for (( i=0; i<${#string}; i++ )); do
            char=${string:$i:1}
            if [[ "$char" == " " ]]; then
                encoded+=" "
            else
                char_ascii=$(ord "$char")
                char_pos=$((char_ascii - 65))
                encrypted_char=$(((char_pos + key) % 26))
                encrypted_ascii=$((encrypted_char + 65))
                encoded+=$(chr "$encrypted_ascii")
            fi
        done
        echo "Encrypted message:
$encoded"
    else
        echo "This is not a valid message!"
    fi
}

decrypt() {
    echo -n "Enter a message:"
    read string
    if [[ "$string" =~ $re ]]; then
        decoded=''

        for (( i=0; i<${#string}; i++ )); do
            char=${string:$i:1}
            if [[ "$char" == " " ]]; then
                decoded+=" "
            else
                char_ascii=$(ord "$char")
                char_pos=$((char_ascii - 65))
                encrypted_char=$(((char_pos - key + 26) % 26))
                encrypted_ascii=$((encrypted_char + 65))
                decoded+=$(chr "$encrypted_ascii")

            fi
        done
        echo "Decrypted message:
$decoded"
    else
        echo "This is not a valid message!"
    fi
}


echo "Type 'e' to encrypt, 'd' to decrypt a message:
Enter a command:"
read -p "" choice

case $choice in
    e) encrypt ;;
    d) decrypt ;;
    *) echo "Invalid command!";;
esac
