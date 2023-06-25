#!/bin/bash

find . -type d \( -name '__pycache__' -o -name '.pytest_cache' \) -exec rm -r {} +

# Argument must have the format <problem_number>_<problem_name>
argument="$1"

if ! [[ $argument =~ ([0-9]+)_([a-z_]+) ]]; then
    echo "Input format doesn't match '<number>_<name>'."
    exit
fi

problem_number="${BASH_REMATCH[1]}"
solution_filename="solution_$problem_number"
test_filename="test_$problem_number"
problem_link="https://leetcode.com/problems/$(echo "${BASH_REMATCH[2]}" | sed 's/_/-/g')/"
problem_name=$(echo "${BASH_REMATCH[2]}" | sed 's/_/ /g' | awk '{for(i=1;i<=NF;i++)sub(/./,toupper(substr($i,1,1)),$i)}1')
problem_solution_link="https://github.com/beatrizmakowski/leetcode/blob/main/algorithms/$argument/solution.py"

# If problem number starts with '0', remove it
if [[ $problem_number =~ ^0([0-9]+) ]]; then
    problem_number="${BASH_REMATCH[1]}"
fi

mkdir ./algorithms/$argument

cd ./algorithms/$argument

touch "$solution_filename.py"
echo "from $solution_filename import Solution

solution = Solution()

def test_example_1():
    pass

def test_example_2():
    pass

def test_example_3():
    pass
" >> "$test_filename.py"

cd ..
cd ..

# Update README.md
file="./README.md"

sed -i '$d; $d' "$file"

echo "| $problem_number | [$problem_name]($problem_link) | - | [Code]($problem_solution_link) | - | - | - |" >> "$file"
echo "</details>" >> "$file"
