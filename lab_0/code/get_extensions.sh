#!/bin/bash

# 进入 intermediate-code 目录
cd intermediate-code

# 获取所有文件的后缀名，并存入集合
extensions=$(find . -type f | sed -n 's/.*\.//p' | sort | uniq)

# 输出后缀集合
echo "File extensions in the intermediate-code directory:"
echo "$extensions"

