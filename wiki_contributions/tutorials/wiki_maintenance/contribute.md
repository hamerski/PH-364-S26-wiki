---
tags:
  - guide
---

## Overview

In this wiki, we will document strategies for coding and modeling, examples of computational methods, explanations of code and/or physics, and other information that might be useful to share across the class. This wiki serves two main purposes:

1. A central place to share resources and explanations that we have found useful, for the benefit of the whole class. 
2. A workflow that enables us to practice several key computing skills, such as collaboration, documentation, explanation of code, and usage of Git and the command line.

## Contribution Guidelines

You will make **weekly contributions** to the wiki using Git. **Contributions must follow the requirements** laid out in this document. We will update these guidelines as a class throughout the term as we figure out what works best.

Requirements:

1. You must **include a commit message** written by you (not auto-suggested by AI) that briefly describes your contribution.
2. You must **tag your contribution** with at least one tag to help keep the wiki organized.

We will cover how to write commit messages during the first week of class.

## Tagging Guidelines

To include tags, use the same syntax shown at the top of this document:

```
---
tags: 
 - guide
---
```

BEFORE ADDING YOUR TAGS: Check the wiki to see if there are [existing tags](tags.md) you can use to categorize your contribution. For example, if there is already a tag called `data viz`, we don't need a new tag called `plotting data`. Make sure that the tag you are adding to your document has the same capitalization and punctuation as the tag you are referencing, otherwise it will create a new tag and your document won't be properly sorted. 
Some existing tags include: "model fitting", "statistic", "guide", etc.


Simply start your contribution with the same 3 lines at the very top, and write your tags with a hyphen, seperate tags with a linebreak. Tags should follow this general format scheme when written:

1. All letters in a tag should be lowercase **unless** referencing something specific like a name that is known to be capitalized; for example, Astropy, QuTip.
2. All words in a tag should be separated by **spaces only**.

Examples of this from existing tags are: "model fitting", "cosmology", "python features", "QuTip". 

Rules are made for the sake of limiting duplicate tags where possible.


## Commit Message Guidelines

We will use [Conventional Commits](https://www.conventionalcommits.org/en/v1.0.0/) when writing a commit message. This standardizes the commit messages for ease of understanding changes and additions to the repository. Structure your commit message as follows: 
```
<type>[optional scope]: <description>

[optional body]

[optional footer(s)]
```

For the "type" field, here are the most common options:
- fix: the commit fixes a bug
- feat: the commit adds a new feature to the repository
- style: the commit changes the formatting
- docs: the commit adds or updates documatation

The title/description line should be concise, only contain information about what your commit includes, and in the imperative mood (eg. "add" instead of "added"). It should not include useless information such as "Wiki contribution week 1". Instead, a message could be "fix: add example of using a Chi Squared test." Also note that the maximum character of the title line is 50 characters, otherwise it gets truncated and overflows into the body.

The body is optional and has less conventions, but a general rule of thumb is to include the "what" in the title line, and the "why" in the body. There is no character limit, but GitHub will wrap lines at 72 characters. 

### Example Messages
- `docs: add example of Chi Squared test`
- `docs: add article on numerical differentiation`
- `fix: update image reference links in ipynb files`
- `feat: add author attribution feature utilizing git blame`
- `style: apply new color scheme`

### Adding a Multiline Commit Message

You should also notice that this commit message format has multiple lines. To write a multiline commit message, here are three methods:

1. Chain multiple `-m` flags together in the `git commit` command. For example, `git commit -m "docs: add commit message guidelines" -m "Added commit message guidelines to contribute.md."`will place the first quote in the title/desctiption, and the second quote in the body. 
2. Run the `git commit` without the `-m` flag. This automatically opens the default text editor in your command line, from which you can edit the commit message the same way you edit a file.
3. Hit enter on the commit message without closing the quote. This allows you to write more lines in the command line directly. Your terminal should look something like this:

```
git commit -m "docs: add commit message guidelines

- Added commit message guidelines to contribute.md based on Conventional Commits
- Resolved Issue #45 assigned to Group 3"
```

For more information on Conventional Commits, see <https://www.conventionalcommits.org/en/v1.0.0/>. 
