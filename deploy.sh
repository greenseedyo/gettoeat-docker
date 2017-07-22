date > fingerprint.txt
rsync -av --delete --exclude-from="rsync_exclude/production.txt" /Users/yo/docker/gettoeat-docker/ yo@13.112.82.166:/gettoeat/gettoeat-docker/
