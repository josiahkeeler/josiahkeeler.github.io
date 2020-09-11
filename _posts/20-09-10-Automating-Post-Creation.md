---
layout: post
title: Automating Post Creation
date: 20-09-10 08:52
categories: coding
---
I tried putting this post up last night, but my sleep deprived brain said otherwise. The script I wrote to automatically name the files and add dates didn't work! I looked over the code after 6 hours of sleep and instantly found the issue. **One mislabeled variable.**

:woman_facepalming: (Jekyll doesn't support emojis out of the box and now I'm sad)

Posts in [Jekyll](https://jekyllrb.com/) powered blogs must follow a strict naming scheme. For example, the name of this post is *"20-09-10-Automating-Post-Creation.md"*. I don't want to manually type out the date, title, and category the post belongs to every day. That's why I wrote a small script to do it for me!

	DATE=$(date +"%y-%m-%d") #date
	TIME=$(date +"%H:%M") #time
	echo Enter a title 
	read TITLE
	echo Enter category
	read CATEGORY
	NAME=$(echo $TITLE | tr " " "-") #remove spaces and replace them with dashes
	FILE=$DATE-$NAME.md
	echo -e "---\n\ #generate front matter
	layout: post\n\
	title: $TITLE\n\
	date: $DATE $TIME\n\
	categories: $CATEGORY\n\
	---" > _posts/$FILE #save to file

This script takes input from the user and automatically generates a markdown file with the correct naming scheme and [front matter](https://jekyllrb.com/docs/front-matter/). All I have to do now is type up my post and **git push**! I'm way too happy about a simple bash script.

Peace Out!

JK
