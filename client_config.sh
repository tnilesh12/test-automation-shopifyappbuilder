#!/bin/bash

# Check if the correct number of arguments is provided
if [ "$#" -ne 3 ]; then
    # echo "Usage: $0 <local_json_path> <app_name> <current_app_package_name> <new_package_name> <logo_path>" # <build_gradle_path>"
    echo "Usage: $0 <app_name> <new_package_name> <current_package_name>"
    exit 1
fi

# Assign arguments to variables, use quotes to handle spaces
APP_NAME="$1"
NEW_PACKAGE_NAME="$2"
CURRENT_PACKAGE_NAME="$3"

# Paths (relative paths in CI)
LOCAL_CLIENT_PATH="client_info/$NEW_PACKAGE_NAME"  # Assuming all client-specific files are under 'client_info'
PROJECT_PATH="$(pwd)"

# Files to copy
LOCAL_GOOGLE_JSON_PATH="$LOCAL_CLIENT_PATH/google-services.json"
PROJECT_GOOGLE_JSON_PATH="$PROJECT_PATH/android/app/google-services.json"

LOCAL_LOGO_PATH="$LOCAL_CLIENT_PATH/icon-1024x1024.jpg"
PROJECT_LOGO_PATH="$PROJECT_PATH/assets/app_logos/icon-1024x1024.jpg"

LOCAL_SPLASH_LOGO_PATH="$LOCAL_CLIENT_PATH/ic_app_icon.png"
PROJECT_SPLASH_LOGO_PATH="$PROJECT_PATH/assets/images/ic_app_icon.png"

LOCAL_APP_CONFIG_PATH="$LOCAL_CLIENT_PATH/app_config.dart"
PROJECT_APP_CONFIG_PATH="$PROJECT_PATH/lib/app_config/app_config.dart"

LOCAL_INFO_PLIST_PATH="$LOCAL_CLIENT_PATH/Info.plist"
PROJECT_INFO_PLIST_PATH="$PROJECT_PATH/ios/Runner/Info.plist"

GOOGLE_LOCAL_INFO_PLIST_PATH="$LOCAL_CLIENT_PATH/GoogleService-Info.plist"
GOOGLE_PROJECT_INFO_PLIST_PATH="$PROJECT_PATH/ios/Runner/GoogleService-Info.plist"

# Keystore file paths
LOCAL_KEYSTORE_PATH="$LOCAL_CLIENT_PATH/key" #.jks"
PROJECT_KEYSTORE_PATH="$PROJECT_PATH/android/app/key" #.jks"

# Copy files
echo "Copying google-services.json..."
cp "$LOCAL_GOOGLE_JSON_PATH" "$PROJECT_GOOGLE_JSON_PATH" || { echo "Failed to copy google-services.json"; exit 1; }
echo "google-services.json copied successfully!"

echo "Copying icon-1024x1024.jpg..."
cp "$LOCAL_LOGO_PATH" "$PROJECT_LOGO_PATH" || { echo "Failed to copy icon-1024x1024.jpg"; exit 1; }
echo "icon-1024x1024.jpg copied successfully!"

echo "Copying ic_app_icon.png..."
cp "$LOCAL_SPLASH_LOGO_PATH" "$PROJECT_SPLASH_LOGO_PATH" || { echo "Failed to copy ic_app_icon.png"; exit 1; }
echo "ic_app_icon.png copied successfully!"

echo "Copying app_config.dart..."
cp "$LOCAL_APP_CONFIG_PATH" "$PROJECT_APP_CONFIG_PATH" || { echo "Failed to copy app_config.dart"; exit 1; }
echo "app_config.dart copied successfully!"

echo "Copying Info.plist..."
cp "$LOCAL_INFO_PLIST_PATH" "$PROJECT_INFO_PLIST_PATH" || { echo "Failed to copy Info.plist"; exit 1; }
echo "Info.plist copied successfully!"

echo "Copying GoogleService-Info.plist..."
cp "$GOOGLE_LOCAL_INFO_PLIST_PATH" "$GOOGLE_PROJECT_INFO_PLIST_PATH" || { echo "Failed to copy GoogleService-Info.plist"; exit 1; }
echo "GoogleService-Info.plist copied successfully!"

# Copy client-specific keystore
echo "Copying key.jks..."
cp "$LOCAL_KEYSTORE_PATH" "$PROJECT_KEYSTORE_PATH" || { echo "Failed to copy key.jks"; exit 1; }
echo "key.jks copied successfully!"

# Update flutter_launcher_icons.yaml
echo "Copying and updating flutter_launcher_icons.yaml..."
cp "flutter_launcher_icons_temp.yaml" "flutter_launcher_icons.yaml" || { echo "Failed to copy flutter_launcher_icons_temp.yaml"; exit 1; }
sed -i "s|APP_PACKAGE_NAME|$NEW_PACKAGE_NAME|g" flutter_launcher_icons.yaml || { echo "Failed to update flutter_launcher_icons.yaml"; exit 1; }
echo "flutter_launcher_icons.yaml updated successfully!"

# Update package_rename_config.yaml
echo "Copying and updating package_rename_config.yaml..."
cp "package_rename_config_temp.yaml" "package_rename_config.yaml" || { echo "Failed to copy package_rename_config_temp.yaml"; exit 1; }
sed -i "s|APP_NAME|$APP_NAME|g" package_rename_config.yaml || { echo "Failed to update package_rename_config.yaml with APP_NAME"; exit 1; }
sed -i "s|CURRENT_APP_PACKAGE_NAME|$CURRENT_PACKAGE_NAME|g" package_rename_config.yaml || { echo "Failed to update package_rename_config.yaml with CURRENT_APP_PACKAGE_NAME"; exit 1; }
sed -i "s|APP_PACKAGE_NAME|$NEW_PACKAGE_NAME|g" package_rename_config.yaml || { echo "Failed to update package_rename_config.yaml with APP_PACKAGE_NAME"; exit 1; }
echo "package_rename_config.yaml updated successfully!"

# Run Flutter commands to apply the new configurations
echo "Running flutter_launcher_icons..."
flutter pub run flutter_launcher_icons || { echo "Failed to run flutter_launcher_icons"; exit 1; }
echo "flutter_launcher_icons completed successfully!"

echo "Running package_rename..."
dart run package_rename || { echo "Failed to run package_rename"; exit 1; }
echo "package_rename completed successfully!"
