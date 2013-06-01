# Clear the previously generated posts
rm ../posts/*;

# Create the post list page
cat header.html > "../posts.html";
echo "<h2>Archive</h2>" >> "../posts.html";
echo "<ul>" >> "../posts.html";

# Generate the new post list page
for filename in ../markdown/*;
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
    echo "<li>$date » <a href=\"posts/$postname.html\">$title</a></li>" >> "../posts.html";

    # Print the filename to the terminal
    echo "Generated: $postname";
done

# Finish the post list page
echo "</ul>" >> "../posts.html";
cat footer.html >> "../posts.html";
