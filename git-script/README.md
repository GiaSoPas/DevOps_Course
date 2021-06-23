## Unleash your creativity with GitHub
* write a script that checks if there are open pull requests for a repository. An url like "https://github.com/$user/$repo" will be passed to the script
* print the list of the most productive contributors (authors of more than 1 open PR)
* print the number of PRs each contributor has created with the labels
* implement your own feature that you find the most attractive: anything from sorting to comment count or even fancy output format
* ask your chat mate to review your code and create a meaningful pull request
* do the same for her xD
* merge your fellow PR! We will see the repo history

### Hints
* [Have a look here](https://github.com/trending)
* read about GitHub API
* make use of curl and jq

### My Script 
Example:
```
gitscript.sh https://github.com/dotnet/AspNetCore.Docs
Checks if there are open pull requests for a repository
_______________________________________________________
user = dotnet
repo = AspNetCore.Docs
__________________________________
Answer: There are open PR
__________________________________
List of the most productive contributors (authors of more than 1 open PR)
Number: Name:
2 "guardrex"
5 "Rick-Anderson"
__________________________________________________________
Number of PRs each contributor has created with the labels
Number: Name: Label:
      1 "blowdart""Security-PU"
``` 
