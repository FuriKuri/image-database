# image-database

## Usage
```
$ ./stack.sh

{
    "StackId": "arn:aws:cloudformation:eu-west-1:073545597646:stack/image-database/208ea280-340c-11e7-ac2b-50a68645b2d2"
}
Wait for stack complete ...
Search images over: "https://furikuri.github.io/image-database/?gateway=..."
```

After the stack is deployed, you can access your images over the URL from the console output. Use the AWS S3 web console to upload your images.

## Todo
- [ ] AWS Lambda function for thumbnails
- [ ] Use Confidence as score
- [ ] Remove hard coded region
- [ ] Include the index.html in the stack 
