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

To include tags, use the same syntax shown at the top of this document:

```
---
tags: 
 - guide
---
```

Simply start your contribution with the same 3 lines at the very top, and write your tags with a hyphen, seperate tags with a linebreak.

Before writing your own tags, check the wiki to see if there are existing tags you can use to categorize your contribution. For example, if there is already a tag called `data viz`, we don't need a new tag called `plotting data`.

## Adding a Page
- Create a branch to work in on your machine.
- Add a Markdown page under docs/ or a notebook under docs/notebooks/.
%- Update mkdocs.yml by adding your page to the nav section like so:
%```
%nav:
%  - Page Title: page_file.md
%```
%this will add a link to the document in the sidebar.

- Commit & push your branch to save your changes to the github server.
- When you're ready to publish your page to the class wiki create a pull-request (PR).
- After your PR is merged it will automatically update the website with your changes.
- Check that the page has been added or updated properly.
