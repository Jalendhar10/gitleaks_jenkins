  GNU nano 6.2                                                                                                      Master1.sh                                                                                                                
#!/bin/bash

repos=(
# Add URLS For Repo you want to clone
 ""
)

# These are the paths where reports of scans and  repos will be cloned
base_dir="/home/tools" # here repos will be cloned
reports_dir="/home/tools/Leaks_Reports" #here reports will be stored
# Loop through each repository and clone it
for repo_url in "${repos[@]}"
do
  # Extract the repository name from the URL
  repo_name=$(basename "$repo_url" .git)

  # Clone the repository
  repo_path="$base_dir/$repo_name"
  git clone "$repo_url" "$repo_path"

  # Scan the repository for secrets using Gitleaks and Store results
  report_file="$reports_dir/$repo_name.json"
 ./gitleaks detect -s "$repo_path" -r "$report_file" 
done










