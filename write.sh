DATE=$(date +"%Y-%m-%d")
TIME=$(date +"%H:%M")
echo Enter a title
read TITLE
echo Enter category
read CATEGORY
NAME=$(echo $TITLE | tr " " "-") #replacing spaces with dashes
FILE=$DATE-$NAME.md 
echo -e "---\n\
layout: post\n\
title: $TITLE\n\
date: $DATE $TIME\n\
categories: $CATEGORY\n\
---" > _posts/$FILE #save front matter to file
