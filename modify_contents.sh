#!/bin/bash

# Check if the correct number of arguments is provided
if [ "$#" -ne 3 ]; then
    # echo "Usage: $0 <local_json_path> <app_name> <current_app_package_name> <new_package_name> <logo_path>" # <build_gradle_path>"
    echo "Usage: $0 <app_name> <new_package_name> <current_package_name>"
    exit 1
fi
echo $(pwd)/"$1"
echo $(pwd)/"$2"
echo $(pwd)/"$3"
# SCRIPT_PATH="${BASH_SOURCE[0]}"
# echo "${SCRIPT_PATH}"
# exit 1

# Assign arguments to variables
APP_NAME="$1"
NEW_PACKAGE_NAME="$2"
CURRENT_APP_PACKAGE_NAME="$3"
LOCAL_GOOGLE_JSON_PATH="/Users/itgeeksmac12/Documents/FlutterProject/shopifyappbuilder/client_info/$1/google-services.json"
PROJECT_GOOGLE_JSON_PATH="/Users/itgeeksmac12/Documents/FlutterProject/shopifyappbuilder/android/app/google-services.json"
# Copy the google-services.json file
cp "$LOCAL_GOOGLE_JSON_PATH" "$PROJECT_GOOGLE_JSON_PATH"
echo "google-services.json copied successfully!"

LOCAL_SPLASH_LOGO_PATH="/Users/itgeeksmac12/Documents/FlutterProject/shopifyappbuilder/client_info/$1/ic_app_icon.png"
PROJECT_SPLASH_LOGO_PATH="/Users/itgeeksmac12/Documents/FlutterProject/shopifyappbuilder/assets/images/ic_app_icon.png"
# Copy the ic_app_icon.png file
cp "$LOCAL_SPLASH_LOGO_PATH" "$PROJECT_SPLASH_LOGO_PATH"
echo "ic_app_icon.png copied successfully!"

LOCAL_APP_CONFIG_PATH="/Users/itgeeksmac12/Documents/FlutterProject/shopifyappbuilder/client_info/$1/app_config.dart"
PROJECT_APP_CONFIG_PATH="/Users/itgeeksmac12/Documents/FlutterProject/shopifyappbuilder/ShopifyCode/lib/app_config/app_config.dart"
# Copy the app_config.dart file
cp "$LOCAL_APP_CONFIG_PATH" "$PROJECT_APP_CONFIG_PATH"
echo "app_config.dart copied successfully!"


LOCAL_Info_plist_PATH="/Users/itgeeksmac12/Documents/FlutterProject/shopifyappbuilder/client_info/$1/Info.plist"
PROJECT_Info_plist_PATH="/Users/itgeeksmac12/Documents/FlutterProject/shopifyappbuilder/ios/Runner/Info.plist"
# Copy the Info.plist file
cp "$LOCAL_Info_plist_PATH" "$PROJECT_Info_plist_PATH"
echo "Info.plist copied successfully!"


Google_LOCAL_Info_plist_PATH="/Users/itgeeksmac12/Documents/FlutterProject/shopifyappbuilder/client_info/$1/GoogleService-Info.plist"
Google_PROJECT_Info_plist_PATH="/Users/itgeeksmac12/Documents/FlutterProject/shopifyappbuilder/ios/Runner/GoogleService-Info.plist"
# Copy the Info.plist file
cp "$Google_LOCAL_Info_plist_PATH" "$Google_PROJECT_Info_plist_PATH"
echo "Google_Info.plist copied successfully!"


# Copy the flutter_launcher_icons_temp.yaml file
cp "flutter_launcher_icons_temp.yaml" "flutter_launcher_icons.yaml"
# Update the flutter_launcher_icons.yaml file
sed -i "" "s|APP_NAME|$APP_NAME|g" flutter_launcher_icons.yaml
echo "flutter_launcher_icons.yaml completed successfully!"


# Copy the package_rename_config_temp.yaml file
cp "package_rename_config_temp.yaml" "package_rename_config.yaml"
# Update the package_rename_config.yaml file
sed -i "" "s/"APP_NAME"/$APP_NAME/g" package_rename_config.yaml
sed -i "" "s/"CURRENT_APP_PACKAGE_NAME"/$CURRENT_APP_PACKAGE_NAME/g" package_rename_config.yaml
sed -i "" "s/"APP_PACKAGE_NAME"/$NEW_PACKAGE_NAME/g" package_rename_config.yaml
echo "package_rename_config.yaml completed successfully!"




flutter pub run flutter_launcher_icons
echo "flutter_launcher_icons completed successfully!"
dart run package_rename
echo "package_rename completed successfully!"

#flutter build apk
#echo "apk build successfully!"

# fro mac  /Users/itgeeksmac12/Documents/FlutterProject 


# C:/Users/train/AndroidStudioProjects
# C:/mobile app developement/new


