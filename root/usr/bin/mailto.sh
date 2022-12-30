#!/command/with-contenv bash
# shellcheck shell=bash

log_dir=$1
subject=$2
exitcode=$3

if [ -n "$HEALTHCHECK_URL" ]; then

    MAX_BODY_LEN=100000

    log_file="$log_dir/backup.log"
    summary_file="$log_dir/summary.log"

    echo "$subject" > "$summary_file"

    subject_len=${#subject}
    avail_len=$((MAX_BODY_LEN - subject_len - 1))
    if [ "$avail_len" -gt 0 ]; then
        tail -c "$avail_len" "$log_file" >> "$summary_file"
    fi

    curl -s --data-raw "@$summary_file" "$HEALTHCHECK_URL/$exitcode"
fi


# Call the hijacked script
exec /usr/bin/mailto-original.sh "$@"
