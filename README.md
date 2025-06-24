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
