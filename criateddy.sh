#!bin/bash
#cria posts de video com o endereço:
# https://www.youtube.com/watch?v=ZWzNWYN8qDA
# para desenvolvimewnto do site para teddy

wp post generate --count=100 --post_type='portfolio';

lista=`wp post list --post_type="eventos" --field=ID`;
count=0;
for i in $lista; 
	cat=$((count % 3)); 
	cat=$(($cat+3)); 
 	echo 'INSERT INTO wp_term_relationships (object_id, term_taxonomy_id, term_order) VALUES ('$i',' $cat', 0)' > query.sql ;
	wp db query < query.sql;
	wp post update $1 --post_title="Portfolio teste "$i
	wp post meta update $i  link_do_video "https://www.youtube.com/watch?v=ZWzNWYN8qDA";
	count=$(($count+1));
done