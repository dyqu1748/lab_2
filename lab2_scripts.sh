#!/bin/bash
# Author: Dylan Quach
# Date: 1/31/2019

#Problem 1 Code:
#Asking user for regular expression and file name with a prompt.
echo "Please enter in a regular expression: "
#Store regular expression entered by user in regEx for grep use later.
read regEx
echo "Please enter in the file name: "
#Store file name entered by user in fileName for grep use later.
read fileName
#Use ^ and $ to mark beginning and end of line we want to grep (some numbers in the file go on for longer and may be picked up if we don't have this). Phone numbers consist of 10 numbers separated by -  like xxx-xxx-xxxx. Use [0-9] to make sure those parts of the line are only numbers, and use {3\} and {4\} to see if numbers occur 3 or 4 times respectively (use {4\} only at the end since that's when we see the occurance of 4 numbers repeatedly). Separate the numbers with - to catch the hyphens in a phone number.  
grep -c '^[0-9]\{3\}-[0-9]\{3\}-[0-9]\{4\}$' 'regex_practice.txt' 
#An email usually looks like xxxx@[only_letters].com. Again, we'll make use ^ and $ to make sure we don't get any lines that go on further that the .com. For the first half, the email can be anything so we'll use .\+ to catch any character that occurs for at least 1 or more times. Then, after the @ character, we'll need to use [A-Za-z]\+ to get the email domain. Email domains don't have numbers or other types of character besides letters, so that's why we must use [A-Za-z]. We need to use the \+ because we can't have an empty email domain. Finally, we'll use .com$ to catch the last part of the line.
grep -c '^.\+@[A-Za-z]\+.com$' 'regex_practice.txt'
#We'll follow most of the same logic as the previous phone number grep, but instead of ^[0-9]\{3\} for the beginning, we'll use ^303 because we're only looking for phone numbers with the 303 area code. Other than that, the rest of the coede is the same. We'll use >phone_results.txt to dump the info we get into that file.
grep '^303-[0-9]\{3\}-[0-9]\{4\}$' 'regex_practice.txt' >phone_results.txt
#We'll follow some of the same logic as the previous email grep. Since we're only concerned with the latter part of the email, we can simply do @geocities.com$ to find lines that have that at the end. This will grep only the lines with @geocities.com at the end, indicating that those lines are emails with the domain that we want. Then, we'll use >email_results.txt to dump the results into that file.
grep '@geocities.com$' 'regex_practice.txt' >email_results.txt
#We'll grep the lines the have the regular expression that user entered in the file the user provided and dump those results in command_results.txt.
grep $regEx $fileName >command_results.txt
