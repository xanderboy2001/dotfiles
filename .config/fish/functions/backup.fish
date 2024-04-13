# Function to create a backup file
# ex: backup file.txt
# results: copies file to file.txt.bak
function backup --argument filename
    cp $filename $filename.bak
end
