#!/bin/bash

# Install required dependencies
#sudo apt-get update
#sudo apt-get install -y nodejs npm python3 python3-pip

# Install Ollama
#curl -fsSL https://ollama.com/install.sh | sh

# Start Ollama service
#ollama serve &
#OLLAMA_PID=$!

# Pull the required model
#ollama pull qwen2.5-coder:7b-instruct-q8_0

# Create game directory
#mkdir mmorpg_game
#cd mmorpg_game

# Create backend file
#cat > backend.js << 'EOL'
#// Backend code will be inserted here
#EOL

# Create frontend file
#cat > index.html << 'EOL'
#<!-- Frontend code will be inserted here -->
#EOL

# Install backend dependencies
#npm install express socket.io three axios

#npm install express socket.io openai three

#npm install express socket.io openai crypto

#npm install express socket.io three cors

# Install required packages
#npm install ws uuid

#npm install express socket.io mongodb openai
npm install socket.io@4.7.4 express@4.18.2 uuid@9.0.1 node-fetch@^3.3.2 three@^0.160.0

echo "Starting server..."
echo "Frontend running at http://localhost:8000"
#node server.js
export HOSTNAME="0.0.0.0"
export PORT="8000"
export DEBUG="true"
# --- Configuration ---
# Use environment variables or defaults
#export HOSTNAME=${HOSTNAME:-"0.0.0.0"}
#export PORT=${PORT:-3000}
# Set to true to enable debug mode with bots and pre-created content
#export DEBUG=${DEBUG:-true}
# Set Ollama API URL (OpenAI compatible endpoint)
export OLLAMA_API_URL="http://localhost:11434/v1/chat/completions"
#export OLLAMA_API_URL="http://10.8.0.14:11434/v1/chat/completions"
#export OLLAMA_API_URL=${OLLAMA_API_URL:-"http://10.8.0.14:11434/v1/chat/completions"}
# Set Ollama model to use (ensure it's running and supports function calling)
#export OLLAMA_MODEL=${OLLAMA_MODEL:-"qwen2:7b-instruct"} # or another suitable model
export OLLAMA_MODEL="qwen2.5-coder:7b-instruct-q8_0" # or another suitable model

node server.js

#node game-server.js
#node backend.js
#node server.js

# Start backend
echo "Game setup complete!"
echo "Frontend running at http://localhost:8000"
#node backend.js
#node backend.js &
#BACKEND_PID=$!

echo "Game setup complete!"
echo "Frontend running at http://localhost:8000"
echo "Backend PID: $BACKEND_PID"
#echo "Ollama PID: $OLLAMA_PID"

# Cleanup on exit
#trap "kill $BACKEND_PID" EXIT
#trap "kill $BACKEND_PID $OLLAMA_PID" EXIT

