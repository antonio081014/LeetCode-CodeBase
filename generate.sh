#!/bin/bash

if [ $# -ne 1 ]; then
echo "Needs File Name as Argument."
exit 0
fi

if [ ! -f ./code.swift ]; then
echo "Source Code file: code.swift not exists."
exit 0
fi

echo $1

echo "- Create file $1.swift"

touch ./Swift/$1.swift

echo "- Add File Document Header."

echo "/**" >> ./Swift/$1.swift
echo " * https://leetcode.com/problems/$1/" >> ./Swift/$1.swift
echo " * " >> ./Swift/$1.swift
echo " * " >> ./Swift/$1.swift
echo " */ " >> ./Swift/$1.swift
echo "// Date: $(date)"
echo "- Copy Source Code to $1.swift tail."
cat ./code.swift >> ./Swift/$1.swift

echo "- Clear code.swift"
echo "" >  ./code.swift

echo "- Generate README.md"
swift readme_gen.swift > README.md

./push_with_msg.sh "Add $1.swift"
