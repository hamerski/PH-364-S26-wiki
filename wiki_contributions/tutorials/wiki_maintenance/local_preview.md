---
tags:
  - guide
---

# Previwing this Wiki Locally

When developing features for the wiki, it is helpful to preview the changes to the wiki locally, since pushing everything to main to test is never a good practice. To avoid that, I added a bash script in the root directory that allows us to preview this entire wiki locally. 

To run the script, simply type `bash preview.sh` in the root directory. The script will automatically install the packages and modules needed to serve the preview. After it's finished setting up, you will see "Hosting server..." in your terminal. Simply click on or copy-paste the link displayed to preview the wiki. To end the process, use control+C to keyboard-interrupt.  

