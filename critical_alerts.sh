#!/bin/bash

# Repository owner (leave as 'intenthq')
OWNER="intenthq"

# Output file name
OUTPUT_FILE="critical_alerts.txt"

# Check if the input file argument is provided
if [[ $# -eq 0 ]]; then
  echo "Please provide an input file containing the list of repositories."
  exit 1
fi

# Read the input file line by line and process each repository
while IFS= read -r REPO; do
  # Get the critical Dependabot alerts for the repository
  ALERTS=$(gh api "/repos/$OWNER/$REPO/dependabot/alerts" --jq '.[] | select(.security_advisory.severity == "critical") | {html_url, cwes, "cve_id": .security_advisory.cve_id, summary: .security_advisory.summary, description: .security_advisory.description}')

  # Print repository name and alerts (if any)
  if [[ ! -z "$ALERTS" ]]; then
    echo "Repository: $REPO" >> "$OUTPUT_FILE"
    echo "Alerts:" >> "$OUTPUT_FILE"
    echo "$ALERTS" | jq '.' >> "$OUTPUT_FILE"
    echo "--------------------------------------------------" >> "$OUTPUT_FILE"
  fi
done < "$1"

