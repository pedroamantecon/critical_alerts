# critical_alerts

Use this script in order to retrieve all 'Critical' Dependabot alerts from a text list of repositories.

NOTE:
Please note that since the 'owner' is already specified in the script, only the repositories names need to be included in the repository list text file.

I only chose to include certain fields, including:
'html_url'
'cwes'
'description'
'summary'

Personalize the script for your own need, by chaning the jq filter in the 'ALERTS' variable
