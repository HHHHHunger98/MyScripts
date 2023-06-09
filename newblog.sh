#!/usr/bin/fish
set -l BLOG_TAGS_PATH ~/study/BlogSite/Wang98/tags/
set -l BLOG_POST_PATH ~/study/BlogSite/Wang98/_posts/
if test -d $BLOG_POST_PATH
	set -l CURR_DATE (date +"%Y-%m-%d")
	read -l -P "Please give a title for your new Blog (maximal length 15):" TITLENAME
	read -l -P "In what category falls this post:" TAGS_NAME
	if test (string length $TITLENAME) -le 15
		set -l BLOG_NAME (string join '' $BLOG_POST_PATH $CURR_DATE '-' $TITLENAME ".md")
		
		if test -e $BLOG_NAME 
			echo "The $BLOG_NAME already exist, please try once with another name!"
			exit
		else
			touch $BLOG_NAME
			echo "done"
			if test -e $BLOG_NAME
				echo >$BLOG_NAME "\
---
layout: post
title: $TITLENAME
date: $CURR_DATE
tags: $TAGS_NAME
---"
			end

			set -l TAGS (string split ' ' $TAGS_NAME)
			for TAG in $TAGS
				set -l TAG_FILE (string join '' $BLOG_TAGS_PATH $TAG ".md")
				if test -e $TAG_FILE
						continue
				else
						touch $TAG_FILE
						if test -e $TAG_FILE
							echo >$TAG_FILE "\
---
layout: tagpage
title: \"Tag: $TAG\"
tag: $TAG
---"
						end
				end
		     end
		end
	else
		echo "The title is too long"
	end
else
	echo "file $BLOG_POST_PATH do not exist!"
end
