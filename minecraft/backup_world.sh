#!/bin/bash

if [[ -t 1 ]]; then
    colors=$(tput colors)
    if [[ $colors ]]; then
        RED='\033[0;31m'
        LIGHT_GREEN='\033[1;32m'
        NC='\033[0m'
    fi
fi

if [[ -z ${MINECRAFT_BUCKET} ]]; then
	printf "Please set the env variable ${RED}MINECRAFT_BUCKET${NC} to the s3 archive bucket name.\n"
	exit 0
fi

if [[ -z ${MINECRAFT_ARCHIVE_LIMIT} ]]; then
	printf "Please set the env variable ${RED}MINECRAFT_ARCHIVE_LIMIT${NC} to limit the number of archives to keep.\n"
	exit 0
fi

backup_bucket=${MINECRAFT_BUCKET}
backup_limit=${MINECRAFT_ARCHIVE_LIMIT}
world=$1
printf "Creating archive of ${RED}${world}${NC}\n"
archive_name="${world}-$(date +"%H-%M-%S-%m-%d-%Y").zip"
zip -r $archive_name $world

printf "Checking if bucket has more than ${RED}${backup_limit}${NC} files already.\n"
content=( $(aws s3 ls s3://$backup_bucket | awk '{print $4}') )

if [[ ${#content[@]} -eq $backup_limit || ${#content[@]} -gt $backup_limit  ]]; then
    echo "There are too many archives. Deleting oldest one."
    # We can assume here that the list is in cronological order
	printf "${RED}s3://${backup_bucket}/${content[0]}\n"
    aws s3 rm s3://$backup_bucket/${content[0]}
fi

printf "Uploading ${RED}${archive_name}${NC} to s3 archive bucket.\n"
state=$(aws s3 cp $archive_name s3://$backup_bucket)

if [[ "$state" =~ "upload:" ]]; then
    printf "File upload ${LIGHT_GREEN}successful${NC}.\n"
else
    printf "${RED}Error${NC} occured while uploading archive. Please investigate.\n"
fi
