
wp post generate --count=100 --post_type='portfolio';

lista=`wp post list --post_type="portfolio" --field=ID`;

count=0;
for i in $lista; 
	do
	cat=$((count % 3)); 
	cat=$(($cat+3)); 
	echo $cat;
 	echo 'INSERT INTO wp_term_relationships (object_id, term_taxonomy_id, term_order) VALUES ('$i',' $cat', 0)' > query.sql ;
	wp db query < query.sql;
	echo 'SELECT `count` FROM  `wp_term_taxonomy` WHERE  `term_taxonomy_id` = '$cat > query.sql ;
	cat_count=`wp db query < query.sql`;
	cat_count=`echo $cat_count | sed 's/[^0-9]*//g'`;
	echo 'UPDATE wp_term_taxonomy SET count='$(($cat_count+1))' WHERE term_taxonomy_id='$cat > query2.sql ;
	wp db query < query2.sql;
	wp post update $i --post_title="Portfolio teste "$i
	wp post update $i --post_content="in culpa qui officia dempor incididuesse cillum do   
	 mollit anim id est labrud exercitaticaecat cupidat seectetur adipisicing eli"$i;
	wp post meta update $i link_do_video "https://www.youtube.com/watch?v=ZWzNWYN8qDA";
	count=$(($count+1));
done

for i in $lista;
	do
		ATTACHMENT_ID="$(wp media import http://gzsihai.com/data/out/43/im-500200020.png --porcelain)"
	 wp post meta add $i _thumbnail_id $ATTACHMENT_ID
done
