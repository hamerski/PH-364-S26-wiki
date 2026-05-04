#!/bin/bash
export PREVIEW_URL="https://hub-orange.datasci.oregonstate.edu/ph364x001/user/$(whoami)/proxy/absolute/8080"
pip install -r dependencies.txt -qq
pip install pigar -qq
pigar -l ERROR gen -f ./ipynb_auto_reqs.txt ./docs --auto-select --question-answer yes
pip install -r ipynb_auto_reqs.txt -qq
rm -f ./ipynb_auto_reqs.txt
mkdocs serve -q -a localhost:8080 2>/dev/null & 
task_pid=$!  # Get the PID of the last backgrounded process
trap break INT
while kill -0 $task_pid 2>/dev/null; do
    echo -e "Hosting server... \nPlease go to $PREVIEW_URL to preview the server. Use ctrl-C to quit the process."
    sleep 5 
done
kill $task_pid
trap - INT
unset PREVIEW_URL
echo -e "\nServer process interrupted/ended. Ending script."

