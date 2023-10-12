# Branches
The bootcamp will use feature branches.
Create an issue at github.com to get a ticket number
![](media/Pasted_image_20230918201946.png)


```git
git checkout -b 1_semanic_versioning
```
The ```-b``` creates a new branch.
The ```1_semanic_versioning``` is the name referring to ticket issue num 1 and ticket description.

New branch created
![](media/Pasted_image_20230918202304.png)

To push the new branch use ```git push```
This will give an error
![](media/Pasted_image_20230918202512.png)

Push again with
```git
git push --set-upstream origin 1_semanitc_versioning
```

Branch now exist on Github
![](media/Pasted_image_20230918203001.png)

Added info about semantic versioning in the `README.md` file, commited and pushed to repo.

### Tagging
Tagging usually happens after merging a branch or bring a Pull Request into the main branch.

Remember to include the ticket! `#1 add :mage: to semantic versioning`
(Done separately here, should have be done in the first commit/push) since Github will pick it up and add to the issue ![](media/Pasted_image_20230918205627.png)



```git
git tag 0.1.0

# push the tag
git push --tags
```

![](media/Pasted_image_20230918204634.png)

![](media/Pasted_image_20230918204722.png)

### Merging branch with main
Make a Pull Request in Github

![](media/Pasted_image_20230918205103.png)



```git

```

## Semantic Versioning
https://semver.org/
```
MAJOR - 1.0.0
MINOR - 0.1.0
PATCH - 0.0.1
```
MAJOR - make incompatible API changes
MINOR - add functionality with backward compatible manner
PATCH - make backward compatible bug fixes