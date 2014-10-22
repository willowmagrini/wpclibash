while read id;
 	do titulo=`head -n 1 lista-titulos`;
 	wp post update $id --post_name="noticia-"$id --post_title=$titulo;
	echo "post ID= "$id" Título= "$titulo;
 	cat lista-titulos | sed '1d' > temp; 
	cp temp lista-titulos;
	done <lista-posts

