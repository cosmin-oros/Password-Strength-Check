#!/bin/bash

WARNING = '\033[0;31m'
SUCCESS = '\033[32m'
CLEAR = '\033[0m'

FILE = ~C:\Users\cosmi\passwordStrength\password.txt
echo "\nType a password...\n"
read password

grep -w $password "$FILE" && echo $WARNING"\n- '$password' is an exploitable password"$CLEAR || echo $SUCCESS"\n+ '$password' doesn't look like a known exploitable password."$CLEAR

if [ ${#password} -ge 8 ]
then
    echo $SUCCESS"+ Password length looks good."$CLEAR
else
    echo $WARNING"- Try writing a longer password."$CLEAR
fi

numberOnly = `echo "$password" | grep -E ^\-?[0-9]*\.?[0-9]+$ `
if [ "$numberOnly" != '' ]
then 
    echo $WARNING"- Try using some letters in your password."$CLEAR
fi

specialChars = `echo "$password" | grep '[[:punct:]]'`
if [ "$specialChars" != '' ]
then
    echo $SUCCESS"+ Detected a special character."$CLEAR
else
    echo $WARNING"- Try using some special characters."$CLEAR
fi