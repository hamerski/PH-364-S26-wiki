---
tags:
 - How to push files
 - How to resolve push issues
---

A local repository is linked to a shared repository via the the "git remote add origin" command (also requires git pull- set-upstream origin main to be run first, but only once; this is not ALWAYS what we want to do, just what we are doing in this class. If you wanted to push changes to a different branch on origin other than main, the command would look different). 

When we make changes to files inside our repo or directories, we need to make sure that the local repo has "made" these changes, so we first stage the changed files using "git add". At this point, we can check to see if files have been successfully staged by using "git status". If the modified files are staged, it will say "files to be added: " and list the files. We then use git commit, which sets the changes as a permanent part of the local repo's history.

Before pushing changes, we need to make sure we are current with the shared repo, so we use "git config pull.rebase false". 
Finally, we use git push to push the changes to the shared repository. 

A more thorough guide is given here: [git instructions](git-instructions.md)
