#!/bin/bash

# This is to get comments from the server
# In the for call to server, will need to get the total number of request from the server 
# for pagination. 
# To run this program, paramter is blogid. 
# ./testCurl.sh 5d9eeb970100ncii


getComment()
{
  	PAGEID=$1
  	echo "getcomment() for $PAGEID"

	commentFileName=$now"-comment-"$blogid"-"$PAGEID".txt"
	requestParam="blogid=$blogid&pagesize=20&page=$PAGEID&nightmode=0"


	curl --compressed -X POST \
	  "${headers[@]}" \
	  --data "blogid=$blogid&pagesize=20&page=$PAGEID&nightmode=0" \
	  http://blog.sina.cn/dpool/blog/newblog/riaapi/mblog/get_commentlist.php \
	  -o $commentFileName
  echo "Got user comment for requestParam=$requestParam, file is saved as $commentFileName"
}

if [ -z "$1" ]
  then
    echo "No argument supplied. Default to 5d9eeb970100ncii"
    blogid="5d9eeb970100ncii"
  else 
  	blogid=$1
  	echo "$(date +'%Y%m%d %H-%M'):On your mark - Pulling data for blogid=$blogid .... Let's go!"
fi

now="$(date +'%Y%m%d')"

pageid=1
requestParam=""

while read line ; do
	headers=("${headers[@]}" -H "$line")
done < headers.txt
#echo "${headers[@]}"

getComment $pageid
commentFileName=$now"-comment-"$blogid"-"$PAGEID".txt"
#commentFileName="comment-2.txt"

comment_total_count=0
if [ -f "$commentFileName" ]
then
	comment_total_count=$(cat $commentFileName | sed  's/\(.*\)\(comment_total_count.*\)}}/\2/'| cut -f3 -d'"')
	echo "comment_total_count=$comment_total_count"

	numCommentPage=$(($comment_total_count))
	numCommentPage=$((($numCommentPage+19)/20))	
	echo "after content return: $numCommentPage "

	count=1

	for ((i=2; i<=$numCommentPage; i++)) 
	  do 
	  	count=$(($count+1))
	    getComment $count
	 done	
else
	echo "$commentFileName not found. Can't process further."
fi

echo "$(date +'%Y%m%d %H-%M'):Done with my task for blogid=$blogid. Sleeping time :)"
	

