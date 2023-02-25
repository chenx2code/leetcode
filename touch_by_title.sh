#!/bin/bash

# 判断是否传入了参数
if [ $# -eq 0 ]; then
	  echo "Please provide a title."
	    exit 1
fi

# 获取传入的字符串
input_str=$1

# 判断传入的字符串是否为空
if [ -z "$input_str" ]; then
	  echo "Title can't be empty."
	    exit 1
fi

# 将字符串中的空格替换为横线
processed_str=${input_str//" "/"-"}

# 删除第一个横线
processed_str=${processed_str/-/""}

# 添加 .md 后缀
processed_str="$processed_str.md"

# 判断文件是否存在，如果存在则添加一个序号
if [ -e "$processed_str" ]; then
	  i=1
	    while [ -e "${processed_str%.*}_${i}.md" ]; do
		        let i++
			  done
			    processed_str="${processed_str%.*}_${i}.md"
fi

# 创建文件并写入内容
echo -e "## $input_str\n#### 1. 基本思路\n###### 1.1 \n\nTime Complexity: O() - \n\nSpace Complexity: O() - \n\n#### 2. 代码\n###### 2.1 " > "$processed_str"

# 判断文件是否创建成功，如果创建成功则打开文件并返回文件名，否则返回空
if [ -e "$processed_str" ]; then
	  case "$(uname -s)" in
		      Linux*)   xdg-open "$processed_str" ;;
		          Darwin*)  open "$processed_str" ;;
			      CYGWIN*)  start "$processed_str" ;;
			          MINGW*)   start "$processed_str" ;;
				      *)        echo "Unknown OS" ;;
				        esac
					  echo "$processed_str"
				  else
					    echo ""
fi

