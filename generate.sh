#!/bin/bash

errorMessage="Please follow command style like > generate.sh swift two-sum"

if [ $# -ne 2 ]; then
    echo $errorMessage
    exit 0
fi

echo $1 $2

fileExtension=""
folderName=""
fileName=""

if [ $1 = "swift" ]; then
    fileExtension=".swift"
    folderName="Swift"
    fileName=$2$fileExtension
    if [ ! -f ./code.swift ]; then
        echo "Source Code file: code.swift not exists."
        exit 0
    fi
elif [ $1 = "python" ]; then
    fileExtension=".py"
    folderName="Python"
    fileName=$2$fileExtension
    if [ ! -f ./code.py ]; then
        echo "Source Code file: code.py not exists."
        exit 0
    fi
elif [ $1 = "java" ]; then
    fileExtension=".java"
    folderName="Java"
    fileName=$2$fileExtension
    if [ ! -f ./code.java ]; then
        echo "Source Code file: code.java not exists."
        exit 0
    fi
else
    echo $errorMessage
    exit0
fi

echo "- Create file $2$fileExtension"

touch ./$folderName/$2$fileExtension

echo "- Add File Document Header."

echo "/**" >> ./$folderName/$fileName
echo " * https://leetcode.com/problems/$2/" >> ./$folderName/$fileName
echo " * " >> ./$folderName/$fileName
echo " * " >> ./$folderName/$fileName
echo " */ " >> ./$folderName/$fileName
echo "// Date: $(date)" >> ./$folderName/$fileName
echo "- Copy Source Code to $fileName tail."
cat ./code$fileExtension >> ./$folderName/$fileName

echo "- Clear code$fileExtension"
echo "" >  ./code$fileExtension

echo "- Generate README.md"
cd GenREADME
swift run > README.md
cd ..

./push_with_msg.sh "Add $fileName"
