---
tags:
  - guide
---

# Git Commands
[Official Git Documentation](https://git-scm.com/)

## Cheat-Sheet

![git-cheat-sheet](https://github.com/hamerski/PH-364-S26-wiki/blob/main/docs/images/Git-Commands-Cheat-Sheet.png?raw=true)

Using the same conventions as them variables will be indicated in angle brakets: \<variable\>

### git add
Type 

```
git add .
```

To add the current working directory to the staging area.

To add a specific file:

```
git add <file-name>
```

### git commit

The commit command saves your work to the current branch.

```
git commit -m "write a message in quotes about adding your file"
```

### git checkout

The [checkout](https://git-scm.com/docs/git-checkout) command is how you work with different branches.

Use 

```
git checkout -b <branch-name>
```
To create a new branch.

And 

```
git checkout <branch-name>
```
To switch branches.

### git merge

The [merge](https://git-scm.com/docs/git-merge) command allows you to combine two branches together. For example merging your changes in your personal local branch into the main branch.

For example:
```
git merge <branch-name> main
```
Will merge the specified branch with the main branch.

### git push

The [push](https://git-scm.com/docs/git-push) command sends your changes to the repository.

The standard notation is

```
git push <remote> <branch>
```

For example

```
git push origin main
```

will push the main branch to the origin, if the origin has been added using

```
git remote add origin git@github.com:<user>/<repository>.git
```
## GitHub

GitHub has its own commands on top of git. The most relevant here is the [pull-request](https://git-scm.com/book/en/v2/GitHub-Contributing-to-a-Project.html#_iterating_on_a_pull_request) or PR. 

A PR is a request to the project maintainer to merge changes you made in a fork with the main repo. This can be done through the GitHub web interface, or use 

```
gh pr create
```

in the terminal to create a pr.

