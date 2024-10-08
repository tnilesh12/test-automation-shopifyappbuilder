#!/bin/bash

# Check if the correct number of arguments is provided
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <local_json_path> <new_package_name>" # <build_gradle_path>"
    exit 1
fi

# Assign arguments to variables
LOCAL_JSON_PATH="$1"
NEW_PACKAGE_NAME="$2"
# BUILD_GRADLE_PATH="$3"

PROJECT_JSON_PATH="C:/mobile app developement/new/shopifyappbuilder/android/app/google-services.json"
BUILD_GRADLE_PATH="C:/mobile app developement/new/shopifyappbuilder/android/app/build.gradle"

# Update the package name in the build.gradle file
# sed -i '' "s/applicationId \"[^\"]*\"/applicationId \"$NEW_PACKAGE_NAME\"/" "$BUILD_GRADLE_PATH"
# echo "Package name updated to $NEW_PACKAGE_NAME in $BUILD_GRADLE_PATH"

# Check if the file exists before applying sed
if [ -f "$(realpath $BUILD_GRADLE_PATH)" ]; then
    sed -i '' "s/applicationId \"[^\"]*\"/applicationId \"$NEW_PACKAGE_NAME\"/" "$(realpath $BUILD_GRADLE_PATH)"
    echo "Package name updated to $NEW_PACKAGE_NAME in $BUILD_GRADLE_PATH"
else
    echo "Error: Build Gradle file not found at $(realpath $BUILD_GRADLE_PATH)"
    exit 1
fi




# Copy the google-services.json file
cp "$LOCAL_JSON_PATH" "$PROJECT_JSON_PATH"
# cp "$LOCAL_JSON_PATH" "$(dirname $BUILD_GRADLE_PATH)"/google-services.json

echo "google-services.json copied successfully!"
