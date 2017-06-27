# sina-sitescraper
sitescrapper for sina

Tool: 
- chrome plugin: Web Scraper
- character converter: https://www.freeformatter.com/java-dotnet-escape.html#ad-output
- Json formatter: https://jsonformatter.curiousconcept.com


For comment data: 
- Shell script curl for getting comment data
- Convert data from escaped unicode to utf: 
```
native2ascii -encoding utf8 -reverse comment-2.txt comment-2-utf.txt
```
- pretty print json 
```
cat comment-2-utf.txt | python -m json.tool >pretty.txt
native2ascii -encoding utf8 -reverse pretty.txt pretty-utf.txt;
```

substring: 
```
cat comment-2.txt | sed  's/\(.*\)\(comment_total_count.*\)}}/\2/'| cut -f3 -d'"'
```

Get the comment for given blogid: 
```
./testCurl.sh {blogid}
```

Get commments for list of blogs from the csv file: 
```
cat sina-blog-list_20170623.csv |awk -F ',' '{print $1}' |cut -d '_' -f 2 |cut -d '.' -f 1 | 
```
Random sleeper to be more server friendly: 
This will introduce a 1-30 second random sleep/pause in the script.  Can be handy at times.
```
sleep $[ ( $RANDOM % 30 )  + 1 ]s
```

TODO: 
  - Iterate to get all comments. 
  - link comments with content, the scraping meta info. 
  - iterate the blogs and pull images. 
  - store data into db. 
  - style data in the way I need,
  
Make a site: 
1. more than one user
2. user have permission on able to see others comment
3. user could add ranking to comments.
4. user could write summary or comments to the main content
5. user able to print summary, blog content, top comments? (like top 5 comments or comments over some number? The number could become a category tool. 
6. select which file to print, remember history selection, number of time viewing some page. 


  
