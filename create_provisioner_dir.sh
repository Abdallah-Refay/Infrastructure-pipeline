#I use provisioner directory to output sesitive data like private key, etc
#you could use it to output any secret data it's added to the gitignore file
#it should be created because it would through an error if it doesn't exist 
#you can run the following script and you will be good to go

if [ -d ./provisioner ]
    then
    echo "provisioner directory already exists all good"
else
    mkdir ./provisioner
    echo "provisioner directory created successfully"
fi