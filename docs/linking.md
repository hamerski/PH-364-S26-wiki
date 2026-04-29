---
tags:
  - Links
  - guide
---

# Linking Pages
## External Links
To link to an external page, you can use the standard markdown notation for links.
```markdown
[link text](https://link-url)
```
For example this links to the [wiki homepage](https://beav.es/364wiki26) using the shortened link: https://beav.es/364wiki26.

## Internal Pages
To link to another page on the wiki directly we can use relative links like so:
```
[page name](../page_filename)
```
The double periods '..' indicate the parent directory, since we're working in the /docs directory within the wiki repo directory this tells mkdocs to go up one level, then back down to the appropriate file. 

So now we can link to our [homepage](../home) directly.

## Images
For displaying images we can follow the same principle, but add an !, either point to a url of the image
```markdown
![image name](https://image-url)
```
Or for images in the image folder within our repo
```
![image name](../images/image.png)
```
