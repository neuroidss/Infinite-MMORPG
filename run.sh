#!/bin/bash

# run.sh - Setup and Run Script for Infinite MMORPG Server

echo "Starting Infinite MMORPG Server setup..."

# --- Configuration ---
# Use environment variables or defaults
export HOSTNAME=${HOSTNAME:-"0.0.0.0"}
export PORT=${PORT:-3000}
# Set to true to enable debug mode with bots and pre-created content
export DEBUG=${DEBUG:-true}
# Set Ollama API URL (OpenAI compatible endpoint)
export OLLAMA_API_URL=${OLLAMA_API_URL:-"http://10.8.0.14:11434/v1/chat/completions"}
# Set Ollama model to use (ensure it's running and supports function calling)
export OLLAMA_MODEL=${OLLAMA_MODEL:-"qwen2.5-coder:7b-instruct-q8_0"} # or another suitable model

# --- Dependencies Check ---
echo "Checking for Node.js and npm..."
if ! command -v node &> /dev/null
then
    echo "Error: Node.js is not installed. Please install Node.js (v16 or higher recommended) and npm."
    exit 1
fi
if ! command -v npm &> /dev/null
then
    echo "Error: npm is not installed. Please install npm (usually comes with Node.js)."
    exit 1
fi

echo "Node.js version: $(node --version)"
echo "npm version: $(npm --version)"

# --- Install Dependencies ---
echo "Installing server dependencies..."
# Navigate to script directory to ensure node_modules is local (optional but good practice)
# cd "$(dirname "$0")"
# Check if node_modules exists and has dependencies, otherwise install
if [ ! -d "node_modules" ] || [ ! -f "package-lock.json" ]; then
    echo "Running npm install..."
    # Create a minimal package.json if it doesn't exist, to track dependencies
    if [ ! -f "package.json" ]; then
        echo '{ "name": "infinite-mmorpg-server", "version": "1.0.0", "type": "module", "dependencies": {} }' > package.json
        npm install socket.io@4.7.4 express@4.18.2 uuid@9.0.1 node-fetch@^3.3.2 three@^0.160.0
        # Note: 'three' is technically only needed for bot AI vector math server-side in this setup
    else
         # Ensure required dependencies are listed or install them
         npm install socket.io@4.7.4 express@4.18.2 uuid@9.0.1 node-fetch@^3.3.2 three@^0.160.0 --save
    fi

    if [ $? -ne 0 ]; then
        echo "Error: npm install failed. Please check errors."
        exit 1
    fi
else
    echo "node_modules directory found, skipping npm install. Run 'npm install' manually if needed."
fi


# --- Run Server ---
echo "Starting the server..."
echo " > Hostname: $HOSTNAME"
echo " > Port: $PORT"
echo " > Debug Mode: $DEBUG"
echo " > Ollama API: $OLLAMA_API_URL"
echo " > Ollama Model: $OLLAMA_MODEL"
echo "Make sure Ollama is running and accessible at $OLLAMA_API_URL with model $OLLAMA_MODEL loaded."
echo "Access the game in your browser at http://<your-ip-or-localhost>:$PORT"
echo "---------------------------------------------"

# Use exec to replace the shell process with the node process
exec node server.js

# If node exits, the script will end here.
echo "Server process finished."
exit 0
