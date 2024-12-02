#!/bin/bash

# This script builds the app in release mode for different servers and copies each output into
# a specified output folder

# Initialize variables
version=""
version_code=""
output_path=""
servers=("development" "staging" "production")
platforms=("android-arm" "android-arm64" "android-x64")

# Parse the named arguments for the script itself
while [[ "$#" -gt 0 ]]; do
  case $1 in
    --version-name) version="$2"; shift ;;
    --version-code) version_code="$2"; shift ;;
    --output-dir) output_path="$2"; shift ;;
    *) echo "Unknown parameter passed: $1"; exit 1 ;;
  esac
  shift
done

# Ensure required parameters are set
if [[ -z "$version" || -z "$version_code" ]]; then
  echo "Missing required arguments: --version-name and --version-code"
  exit 1
fi

# Set default output path if not specified
if [[ -z "$output_path" ]]; then
  output_path="./artifacts"
fi

# Set the version name and version code formatted string
version_formatted=v$version-build-$version_code

# Function that builds the app and copies the output to the output path
build_and_copy() {
  local version="$1"
  local version_code="$2"
  local target_platform="$3"
  local target_server="$4"

  echo "Building for $target_server on $target_platform"
  flutter build apk \
    --release \
    --target-platform="$target_platform" \
    --build-name="$version" \
    --build-number="$version_code" \
    -t "lib/main_$target_server.dart"

  # Create the outputs folder if it does not exist, and copy the outputs to it
  mkdir -p "$output_path"
  cp build/app/outputs/flutter-apk/app-release.apk "$output_path/app-$target_server-$version_formatted-$target_platform.apk"
}

# Build for all combinations of servers and platforms

for server in "${servers[@]}"; do
  for platform in "${platforms[@]}"; do
    build_and_copy "$version" "$version_code" "$platform" "$server"
  done
done
