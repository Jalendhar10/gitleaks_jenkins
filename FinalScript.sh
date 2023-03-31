repos=(
# Add URLS For Repo you want to clone
 "https://github.com/sajal55/leaks_for_testing"
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
  cd /home/tools/gitleaks
 ./gitleaks detect -s "$repo_path" -r "$report_file" 

  # Archive the generated report
  archive_file="$repo_name.json"
  archive_path="$reports_dir/$archive_file"
  archive_dir=$(basename "$reports_dir")
  cd "$reports_dir"
  zip -r "$archive_file.zip" "$repo_name.json"
  cd -
  archive_path="$reports_dir/$archive_file.zip"
  archive_dir_path="$archive_dir/$archive_file.zip"
  echo "Archiving $archive_dir_path"
  archiveArtifacts "$archive_path"  
done
