wp post generate --count=15 --post_type='colunistas';

lista=`wp post list --post_type="colunistas" --field=ID`;

count=0;
for i in $lista;
	do
		wget  -O temp.jpg -o log https://loremflickr.com/320/240
		ATTACHMENT_ID="$(wp media import temp.jpg --porcelain)"
		echo $ATTACHMENT_ID
	 wp post meta add $i _thumbnail_id $ATTACHMENT_ID
done
