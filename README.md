#  Enigma

## Table of contents
* [General info](#general-info)
* [Screenshots](#screenshots)
* [Learning Goals](#learning-goals)
* [Technologies](#technologies)
* [Setup](#setup)
* [Features](#features)
* [Future Enhancements](#future-enhancements)
* [Contact](#contact)

## General info
This project uses Ruby to build a tool for cracking an encryption algorithm and requires throughout planout regarding classes to use as well as understanding of the Encryption Algorithm.

The encryption is based on the Caesar Cipher. The idea is that we can translate a character by shifting it a certain number of places down the alphabet. For more on the Caesar cipher, See This [Description](http://practicalcryptography.com/ciphers/caesar-cipher) or the [Wikipedia Page](https://en.wikipedia.org/wiki/Caesar_cipher)

However, instead of using the same shift for every character, our algorithm will use 4 different shifts known as the A, B, C, and D shifts. Every fourth character will be shifted by the same amount, so the 1st, 5th, and 9th characters will be shifted with the A shift, the 2nd, 6th, and 10th characters will be shifted with the B shift, etc.

Additionally, our algorithm will use the standard lowercase alphabet, plus a space, so 27 characters in total. You can use the following code snippet to create the character set:

```
("a".."z").to_a << " "
```

## Screenshot


## Learning Goals
* Practice breaking a program into logical components
* Build classes that demonstrate single responsibilities
* Test drive a well-designed Object Oriented solution
* Work with file i/o

## Technologies
Project is created with:
* Ruby version: 2.7.2
* Command Line Interface(CLI)
* SimpleCov
* Git and Github

## Setup
To run this program, save a copy of this repository locally. In the MacOS
application 'Terminal,' navigate into the _enigma_ directory.
Then, run it (note: '$' is not typed).
1. Clone the repo using the web url:
   ```
   $ git clone https://github.com/Isikapowers/enigma
   ```
   or with a password-protected SSH key:
   ```
   $ git clone git@github.com:Isikapowers/enigma.git
   ```
2. Change into the directory:
   ```
   $ cd ../enigma
   ```
3. Encryption and Decryption on CLI:
   ```
   $ ruby ./lib/encrypt.rb message.txt encrypted.txt
   
   $ ruby ./lib/decrypt.rb encrypted.txt decrypted.txt <5 digit key> <6 digit date>
   ```

## Features
List of features:
* Built by using Test Driven Development(TDD)
* Command Line Interface Interaction
* Demonstrate classes with single responsibilites

## Future Enhancements:
* Implement the `crack` method that decrypts a message without being given the key.

## Contact
Created by
* [@isikapowers](https://github.com/Isikapowers)


