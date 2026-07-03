#!/usr/bin/env bash

# Check if an argument was provided
if [ -z "$1" ]; then
    echo "Usage: $0 <number>"
    exit 1
fi

# Ensure the input is a valid positive integer
if [[ ! "$1" =~ ^[0-9]+$ ]]; then
    echo "false"
    exit 0
fi

number=$1
length=${#number}
sum=0
temp=$number

# Loop through each digit of the number
while [ $temp -gt 0 ]; do
    digit=$(( temp % 10 ))
    
    # Raise the digit to the power of the total length and add to sum
    power=$(( digit ** length ))
    sum=$(( sum + power ))
    
    # Remove the last digit
    temp=$(( temp / 10 ))
done

# Handle the edge case for 0 explicitly, as the while loop won't execute for 0
if [ $number -eq 0 ]; then
    sum=0
fi

# Output true or false based on the result
if [ $sum -eq $number ]; then
    echo "true"
    exit 0
else
    echo "false"
    exit 0
fi
