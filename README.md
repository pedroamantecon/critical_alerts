# critical_alerts

Use this script in order to retrieve all 'Critical' Dependabot alerts from a text list of repositories.

NOTE:

Please note that since the 'owner' is already specified in the script, only the repositories names need to be included in the repository list text file.
'jq' needs to be installed beforehand for filtering purposes.


I only chose to include certain fields, including:

'html_url'
'cwes'
'description'
'summary'
'cve_id'


Personalize the script for your own need, by chaning the jq filter in the 'ALERTS' variable.
