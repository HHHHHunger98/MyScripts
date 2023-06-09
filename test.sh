#!/usr/bin/fish
read -l -P "In what category falls this post:" tag_name

for tag in $tag_name
		echo "tag: $tag"
end

set TAGS (string split ' ' $tag_name)

for TAG in $TAGS
		echo "tag: $TAG"
end
