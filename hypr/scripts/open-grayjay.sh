#!/bin/bash
start_grayjay() {
    # Kill any running instances of Grayjay
    pkill -f Grayjay

    # Navigate to the Grayjay directory
    cd ~/custom-installations/Grayjay.Desktop-linux-x64/Grayjay.Desktop-linux-x64-v2 || { echo "Failed to change directory"; return 1; }

    # Start Grayjay in the background
    ./Grayjay

    sleep 2

    # Wait for Grayjay to start and listen on a port
    local max_attempts=10
    local attempt=0
    port=""

    while [ $attempt -lt $max_attempts ]; do
        # Retrieve the port number used by Grayjay
        port=$(ss -tulpn | grep Grayjay | grep 512 | awk '{print $5}' | awk -F: '{print $2}')

        if [ -n "$port" ]; then
            echo "Grayjay started on port $port."
            return 0
        fi

        echo "Waiting for Grayjay to start..."
        sleep 1
        ((attempt++))
    done

    echo "Grayjay did not start correctly or is not listening on a port."
    return 0
}

# Call the function to start Grayjay
start_grayjay

# Open the subscriptions page in LibreWolf if the port was found
if [ -n "$port" ]; then
    librewolf "http://localhost:$port/web/subscriptions"
else
    echo "Failed to retrieve the port. Exiting."
    exit 1
fi
