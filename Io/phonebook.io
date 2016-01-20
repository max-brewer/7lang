#!/usr/local/bin/io

doFile("curlyBracketsMapSyntax.io")
phoneBookContents := File with("phonebook.json") openForReading contents
phoneNumbers := doString(phoneBookContents)
phoneNumbers keys println
phoneNumbers values println

