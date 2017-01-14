# $1 = pasta e nome do tema
# $2 = nome do site
cd ~/themes/;
nome=$1
dir= ~/themes/$nome;
git clone https://github.com/wpbrasil/odin.git $nome
cp ~/htdocs/ferramentas/Gruntfile.js $dir/src;
echo "">> $dir/assets/js/main.js;
mkdir $dir/assets/js/src/;
cd $nome/src;
mv $dir/assets/js/main.js $dir/assets/js/src/main.js;

sudo npm install;
cd $dir/inc;
echo "<?php //Funcoes chamadas por Ajax" >> ajax-functions.php;
echo "<?php //Custom post types//" >> custom-post.php;
echo "<?php //Custom-fields" >> custom-fields.php;
cd ..;
echo "require_once get_template_directory() . '/inc/ajax-functions.php';" >> functions.php;
echo "require_once get_template_directory() . '/inc/custom-post.php';" >> functions.php;
echo "require_once get_template_directory() . '/inc/custom-fields.php';" >> functions.php;

sed -i -e 's/Theme Name: Odin/Theme Name: '$nome/'g' style.css;
cd ~/htdocs/rede;
site=`wp site create --slug=$nome --porcelain`;
echo $site
url=`wp site list --blog_id=$site --field=url`;
wp theme activate $nome --url=$url;


# # echo $1;
# # echo $2;
# var=1;
# # echo ${!var};
# while [ "${!var}" != "" ]
# do
#   echo ${!var};
#   echo $var;
#   var=$(( $var + 1 ))
# done