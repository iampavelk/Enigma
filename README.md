code for [ENIGMA project](https://hyperskill.org/projects/274)

Humanity has explored ways to keep secrets since the early days — non-standard hieroglyphs were found in a tomb from the Old Kingdom of Egypt around 1900 BC. Julius Caesar invented a substitution cipher in 60 BC. The Enigma machine was designed in 1918 to protect communications in the banking industry. In the early 1970s, IBM founded the "crypto group," which developed a block cipher to protect its customers' data. In 1973, the US adopted it as a national standard; it took 25 years for hackers to crack it. This project allows you to write a program for encrypting messages and files. But first, you need some basic knowledge about ciphers. You will start with the validation of user input. Then you need to convert chars to ASCII values. In the end, you will build a simple cipher that creates a file and encrypts it with a Linux utility.

Stage 1: Is it correct?

Description
There are different methods to encrypt a file. Before getting to the encryption, let's teach your program to read the standard input. It should also understand whether the user input is correct or not. Let's break the stage into several steps:

Start with the message Enter a message:
Read a string from the standard input;
Check whether the string is correct. The string can contain uppercase letters and spaces only;
If everything is correct, output the following message: This is a valid message! Otherwise, output This is not a valid message!
You can read the user input and pass it to a variable. The code snippet below is an example of how you can do it. Feel free to use any method:

read -r string
echo "$string"

You can also check a variable with regex expressions. The code snippet below is an example of how you can do it. Feel free to use any method:

string="DIVIDE AND CONQUER"
re='^[A-Z ]+$'
if [[ "$string" =~ $re ]]; then
    echo "Do something!"
else
    echo "Do another thing!"
fi

Or, an alternative:

string="DIVIDE AND CONQUER"
re='^[A-Z ]+$'
check_message() {
  [[ "$1" =~ $re ]] && echo true || echo false
}
is_message=$(check_message "$string")

Objectives
Start the program with the welcoming message Enter a message:
Read a string from the standard input and check whether it's correct. The string can contain uppercase letters and space. If everything is right, output This is a valid message! Otherwise — This is not a valid message!

Stage 2:ASCII converter

Description
Let's create a basic cipher to encrypt a letter with a key. This stage includes the following steps:

Ask for an uppercase letter Enter an uppercase letter:
Read a letter from the standard input;
Ask for a key Enter a key: The key should be a number between 0 and 9;
Read the key from the standard input;
If everything is correct:
Calculate the encrypted letter (shift the letter to the right by the key value)
Output the encrypted letter with Encrypted letter: %letter%
Otherwise, output Invalid key or letter!
You can get the ASCII value of a character with the code snippet below. Feel free to use any method:

letter="A"
ord() {
  value=$(printf "%d\n" "'$letter")
}

You can also get the ASCII character of a value with the code snippet below. Feel free to use any method:

value="65"
chr() {
  char=$(printf "%b\n" "$(printf "\\%03o" "$value")")
}

To find an encrypted letter, convert a letter to a number, add the key, and convert the number to the letter again. Remember, once you reach Z continue with A.

Stage 3 Caesar cipher

Description
You've learned how to encrypt a letter. It's time to work on a message. Create the Caesar Cipher to encrypt and decrypt a message where the key is a constant value — 3.

Objectives
Let's break the task into several steps:

Ask for a command:
Type 'e' to encrypt, 'd' to decrypt a message:
Enter a command:

Read the command from the standard input;
Check whether the command is valid. Otherwise, output Invalid command!;
Ask for a message;
Check whether the message has the correct format. A message can contain uppercase letters and spaces.
If the command is e, encrypt all letters by shifting them three times to the right. A will become D. Keep spaces as they are.
Output the encrypted message with the header Encrypted message:
If the command is d, decrypt the letters by shifting them up three times to the left. D will be A. Keep spaces as they are.
Output the decrypted message with the header Decrypted message:
Otherwise, output This is not a valid message!
