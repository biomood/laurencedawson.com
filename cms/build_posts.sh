cat header.html > ../posts/hello_world.html
markdown ../markdown/hello_world.md >> ../posts/hello_world.html
cat footer.html >> ../posts/hello_world.html

for filename in ../markdown/*;
  do     
    filename=$(basename "$filename");
    filename="${filename%.*}";
    echo $filename;
done
