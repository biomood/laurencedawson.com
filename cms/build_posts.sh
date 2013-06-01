# Clear the previously generated posts
rm ../posts/*;

# Create the post list page
cat header.html > "../index.html";
cat about.html >> "../index.html";
echo "<h2>Blog Posts</h2>" >> "../index.html";
echo "<ul>" >> "../index.html";

# Generate the new post list page
for filename in `ls ../markdown/* | sort -r`;
  do     

    # Grab the basename and postname
    basename=$(basename "$filename");
    postname="${basename%.*}";
    title=$(head -1 $filename);
    date=${postname:0:10};

    # Transform each markdown file into a post
    cat header.html > "../posts/$postname.html";
    markdown $filename >> "../posts/$postname.html";
    cat footer.html >> "../posts/$postname.html";

    # Add the post to the post list page
    echo "<li>$date » <a href=\"posts/$postname.html\">$title</a></li>" >> "../index.html";

    # Print the filename to the terminal
    echo "Generated: $postname";
done

# Finish the post list page
echo "</ul>" >> "../index.html";
cat footer.html >> "../index.html";
