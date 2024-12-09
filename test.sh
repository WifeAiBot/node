#!/bin/bash

# Setup initial variables
file_name="content.txt"
commit_count=15
start_time=$(date +%s)  # Store the current timestamp for the first commit
commit_messages=(
  "Fixed a typo"
  "Updated content"
  "Minor tweaks"
  "Refactored some code"
  "Updated content description"
  "Fixed formatting issues"
  "Improved content"
  "Added more details"
  "Reviewed content"
  "Updated references"
  "Improved accuracy"
  "Corrected spelling mistakes"
  "Final review"
  "Refined wording"
  "Updated headings"
  "Improved readability"
  "Optimized text"
  "Minor corrections"
  "Added missing information"
  "Polished the content"
)

# Loop for 20 commits
for i in $(seq 1 $commit_count)
do
  # Calculate the new file name with the iteration number
  new_file_name="content-$i.txt"
  
  # Rename the file (simulate modifying the content)
  cp $file_name $new_file_name

  # Add the renamed file to staging
  git add $new_file_name
  
  # Randomize the commit message from the list
  commit_message="${commit_messages[$RANDOM % ${#commit_messages[@]}]}"
  
  # Calculate a randomized sleep time (e.g., between 2 and 5 minutes)
  sleep_time=$((1 + RANDOM % 2))
  
  # Commit the change with the random message
  git commit -m "$commit_message"
  
  # Rename the file for the next iteration
  mv $new_file_name $file_name
  
  # Wait for the random sleep time (simulating a human delay between commits)
  echo "Waiting for $sleep_time minutes before next commit..."
  sleep $((sleep_time * 60))

done

# Print a message indicating the script is done
echo "Completed $commit_count commits."

