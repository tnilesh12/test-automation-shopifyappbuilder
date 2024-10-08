#!/bin/bash

# Check if the correct number of arguments is provided
if [ "$#" -ne 5 ]; then
    echo "Usage: $0 <local_json_path> <app_name> <current_app_package_name> <new_package_name> <logo_path>" # <build_gradle_path>"
    exit 1
fi

# Assign arguments to variables
LOCAL_JSON_PATH="$1"
APP_NAME="$2"
CURRENT_APP_PACKAGE_NAME="$3"
NEW_PACKAGE_NAME="$4"
LOGO_PATH="$5"

PROJECT_JSON_PATH="C:/mobile app developement/new/shopifyappbuilder/android/app/google-services.json"
BUILD_GRADLE_PATH="C:/mobile app developement/new/shopifyappbuilder/android/app/build.gradle"

# Copy the google-services.json file
cp "$LOCAL_JSON_PATH" "$PROJECT_JSON_PATH"
# cp "$LOCAL_JSON_PATH" "$(dirname $BUILD_GRADLE_PATH)"/google-services.json

echo "google-services.json copied successfully!"


# Copy the flutter_launcher_icons_temp.yaml file
cp "flutter_launcher_icons_temp.yaml" "flutter_launcher_icons.yaml"
# Update the flutter_launcher_icons.yaml file
# sed -i "s/"LOGO_PATH"/$LOGO_PATH/g" flutter_launcher_icons.yaml
sed -i "s|LOGO_PATH|$LOGO_PATH|g" flutter_launcher_icons.yaml
echo "flutter_launcher_icons.yaml completed successfully!"


# Copy the package_rename_config_temp.yaml file
cp "package_rename_config_temp.yaml" "package_rename_config.yaml"
# Update the package_rename_config.yaml file
sed -i "s/"APP_NAME"/$APP_NAME/g" package_rename_config.yaml
sed -i "s/"APP_PACKAGE_NAME"/$NEW_PACKAGE_NAME/g" package_rename_config.yaml
echo "package_rename_config.yaml completed successfully!"




# flutter pub run flutter_launcher_icons
# flutter dart run package_rename






