#!/bin/bash

# Install .NET SDK
echo "Installing .NET SDK..."
curl -sSL https://dot.net/v1/dotnet-install.sh | bash /dev/stdin --channel 8.0

# Add .NET to PATH
export PATH="$PATH:$HOME/.dotnet"
echo ".NET SDK installed and added to PATH."

# Install the required workloads
echo "Installing required workloads..."
dotnet workload install wasm-tools
echo "Workloads installed successfully."

# Verify installed workloads
echo "Verifying installed workloads..."
dotnet workload list

# Build the project
echo "Building the project..."
dotnet publish bookCatalog\bookCatalog.Blazor\bookCatalog.Blazor.csproj -c Release
echo "Project built successfully."

# Verify index.html exists
if [ ! -f bookCatalog.Blazor/bin/Release/net8.0/publish/wwwroot/index.html ]; then
    echo "Error: index.html not found in WebClient/bin/Release/net9.0/publish/wwwroot/"
    exit 1
fi


# Copy the output to the build directory
echo "Copying output to build directory..."
mkdir -p build/wwwroot
cp -r bookCatalog.Blazor/bin/Release/net8.0/publish/wwwroot/* build/wwwroot/
echo "Output copied successfully."

# Verify index.html exists in the copied build directory
if [ ! -f build/wwwroot/index.html ]; then
    echo "Error: index.html not found in build/wwwroot/"
    exit 1
fi


echo "Build and verification completed successfully."
