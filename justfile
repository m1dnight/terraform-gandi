repo_name := file_name(justfile_directory())
backup_dir := "/Users/christophe/SynologyDrive/Terraform" / repo_name
state_file := "terraform.tfstate"
local := justfile_directory() / state_file
remote := backup_dir / state_file

# Extract the serial number from a terraform state file
_serial file:
    @jq -r '.serial' "{{ file }}"

# Back up terraform state to SynologyDrive
backup:
    #!/usr/bin/env bash
    set -euo pipefail
    local="{{ local }}"
    remote="{{ remote }}"

    # Ensure the backup directory exists
    mkdir -p "{{ backup_dir }}"

    # Abort if there is no local state to back up
    if [ ! -f "$local" ]; then
        echo "No local state file found at $local"
        exit 1
    fi

    local_serial=$(jq -r '.serial' "$local")

    # Compare serials if a remote backup already exists
    if [ -f "$remote" ]; then
        remote_serial=$(jq -r '.serial' "$remote")
        if [ "$remote_serial" -gt "$local_serial" ]; then
            echo "Remote backup has a higher serial — skipping."
            echo "  Local serial:  $local_serial"
            echo "  Remote serial: $remote_serial"
            exit 1
        fi
        if [ "$remote_serial" -eq "$local_serial" ]; then
            echo "State is already up to date (serial $local_serial)."
            exit 0
        fi
    fi

    # Copy local state to the backup location
    cp "$local" "$remote"
    echo "State backed up to $remote (serial $local_serial)"

# Restore terraform state from SynologyDrive
restore:
    #!/usr/bin/env bash
    set -euo pipefail
    local="{{ local }}"
    remote="{{ remote }}"

    # Abort if there is no remote backup to restore from
    if [ ! -f "$remote" ]; then
        echo "No backup found at $remote"
        exit 1
    fi

    remote_serial=$(jq -r '.serial' "$remote")

    # Compare serials if a local state already exists
    if [ -f "$local" ]; then
        local_serial=$(jq -r '.serial' "$local")
        if [ "$local_serial" -gt "$remote_serial" ]; then
            echo "Local state has a higher serial — skipping."
            echo "  Local serial:  $local_serial"
            echo "  Remote serial: $remote_serial"
            exit 1
        fi
        if [ "$local_serial" -eq "$remote_serial" ]; then
            echo "State is already up to date (serial $remote_serial)."
            exit 0
        fi
    fi

    # Copy the remote backup to the local state location
    cp "$remote" "$local"
    echo "State restored from $remote (serial $remote_serial)"
