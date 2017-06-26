#!/bin/bash
while read line ; do
headers=("${headers[@]}" -H "$line")
done < headers.txt
echo "${headers[@]}"
curl --compressed -X POST \
   "${headers[@]}" \
   --data 'blogid=5d9eeb970100ncii&pagesize=20&page=1&nightmode=0' http://blog.sina.cn/dpool/blog/newblog/riaapi/mblog/get_commentlist.php \
-o comment-2.txt

