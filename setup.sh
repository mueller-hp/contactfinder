#!/bin/bash

# Contact Finder - Local Development Setup Script
echo "🔧 Contact Finder - Local Setup"
echo "================================"

# Check if .env file exists
if [ ! -f .env ]; then
    echo "📝 Creating .env file from template..."
    cp .env.example .env
    echo "✅ .env file created!"
    echo "⚠️  Please edit .env and replace 'your_serpapi_key_here' with your actual API key"
    echo "   Get your key from: https://serpapi.com/manage-api-key"
else
    echo "✅ .env file already exists"
fi

# Check if SerpAPI key is configured
if grep -q "your_serpapi_key_here" .env 2>/dev/null; then
    echo "⚠️  WARNING: Please update your SerpAPI key in .env file"
    echo "   Current key appears to be the example placeholder"
fi

# Start local development server
echo ""
echo "🚀 Starting local development server..."
echo "   Opening Contact Finder in your browser..."

# Try different methods to start a local server
if command -v python3 &> /dev/null; then
    echo "   Using Python 3 HTTP server on http://localhost:8000"
    python3 -m http.server 8000 --bind 127.0.0.1 &
    SERVER_PID=$!
elif command -v python &> /dev/null; then
    echo "   Using Python HTTP server on http://localhost:8000"
    python -m SimpleHTTPServer 8000 &
    SERVER_PID=$!
elif command -v node &> /dev/null && command -v npx &> /dev/null; then
    echo "   Using Node.js serve on http://localhost:3000"
    npx serve . -l 3000 &
    SERVER_PID=$!
else
    echo "❌ No suitable HTTP server found."
    echo "   Please install Python 3 or Node.js to run the development server"
    echo "   Or open index.html directly in your browser"
    exit 1
fi

# Give server time to start
sleep 2

# Open browser (try different commands based on OS)
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    # Linux
    if command -v xdg-open &> /dev/null; then
        xdg-open "http://localhost:8000" 2>/dev/null
    fi
elif [[ "$OSTYPE" == "darwin"* ]]; then
    # Mac OSX
    open "http://localhost:8000"
elif [[ "$OSTYPE" == "msys" ]] || [[ "$OSTYPE" == "cygwin" ]]; then
    # Windows
    start "http://localhost:8000"
fi

echo ""
echo "✅ Contact Finder is running!"
echo "   🌐 URL: http://localhost:8000"
echo "   📱 Mobile test: Use your computer's IP address instead of localhost"
echo ""
echo "📝 Next steps:"
echo "   1. Test the search functionality"
echo "   2. Verify Hebrew RTL layout is correct"
echo "   3. Check that SerpAPI integration works"
echo "   4. Test mobile responsiveness"
echo ""
echo "🛑 To stop the server: Press Ctrl+C"

# Wait for user to stop server
trap "kill $SERVER_PID 2>/dev/null; echo ''; echo '🛑 Server stopped. Contact Finder development session ended.'; exit 0" INT

# Keep script running
wait $SERVER_PID