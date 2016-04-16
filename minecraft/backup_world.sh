#!/bin/bash

if [[ -t 1 ]]; then
    colors=$(tput colors)
    if [[ $colors ]]; then
        RED='\033[0;31m'
        LIGHT_GREEN='\033[1;32m'
        NC='\033[0m'
    fi
fi

backup_bucket=${MINECRAFT_BUCKET}
backup_limit=${MINECRAFT_ARCHIVE_LIMIT}
world=$1
printf "Creating archive of ${RED}${world}${NC}"
echo
archive_name="${world}-$(date +"%H-%M-%S-%m-%d-%Y").zip"
zip -r $archive_name $world

printf "Checking if bucket has more than ${RED}${backup_limit}${NC} files already."
echo
content=( $(aws s3 ls s3://$backup_bucket | awk '{print $4}') )

if [[ ${#content[@]} -eq $backup_limit || ${#content[@]} -gt $backup_limit  ]]; then
    echo "There are too many archives. Deleting oldest one."
    # We can assume here that the list is in cronological order
	printf "${RED}s3://${backup_bucket}/${content[0]}"
	echo
    aws s3 rm s3://$backup_bucket/${content[0]}
fi

printf "Uploading ${RED}${archive_name}${NC} to s3 archive bucket."
echo
state=$(aws s3 cp $archive_name s3://$backup_bucket)

if [[ "$state" =~ "upload:" ]]; then
    printf "File upload ${LIGHT_GREEN}successful${NC}."
	echo
else
    printf "${RED}Error${NC} occured while uploading archive. Please investigate."
	echo
fi
