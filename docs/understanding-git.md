---
tags:
  - git
---

## Understanding Git

I am creating my wiki contribution as I watch the video, since I feel like I am finally understanding more of what is actually going on. I am going to write out my understanding of the process.

First, I was initially confused on the distinction between directories and repositories, but I now understand that a repository **IS** a directory with special privileges. A local repository is linked to shared repository via the the `git remote add origin` command (also requires `git pull --set-upstream origin main` to be run first, but only once, and I believe that this is not **ALWAYS** what we want to do, just what we are doing in this class. If you wanted to push changes to a different branch on origin other than main, the command would look different).

When we make changes to files inside our repo or directories, we need to make sure that the local repo has "made" these changes, so we first stage the changed files using `git add`. At this point, we can check to see if files have been successfully staged by using `git status`. If the modified files are staged, it will say "files to be added: " and list the files. We then use `git commit`, which sets the changes as a permanent part of the local repo's history.

Before pushing changes, we need to make sure we are current with the shared repo, so we use `git config pull.rebase false`. 

Finally, we use `git push` to push the changes to the shared repository.

Sometimes git can give you errors when you try to push or pull about changes on your local repository conflicting with changes on the remote repository. It can be useful in this case to reset your local repository to exactly what is on the remote one. However, this must be done carefully since it will **delete all of your local changes**. Before trying this, make sure to copy all of the files you care about to a location outside the repository. Then you can run `git reset --hard`, making your local repository an exact copy of the remote repository.
