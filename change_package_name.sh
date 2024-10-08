# #!/bin/bash

# # Define the old and new package names
# old_package="com.example.newpackage"
# new_package="com.itgeeks.shopifyappbuilder"

# # Update the AndroidManifest.xml file
# # sed -i "s/$old_package/$new_package/g" android/app/src/main/AndroidManifest.xml

# # Update the build.gradle file
# sed -i "s/$old_package/$new_package/g" android/app/build.gradle

# # Update the MainActivity.java file (if necessary)
# sed -i "s/$old_package/$new_package/g" android/app/src/main/kotlin/com/example/MainActivity.kt

# # Update the Info.plist file (if you're using iOS)
# sed -i "" "s/$old_package/$new_package/g" ios/Runner/Info.plist

# # Rename the Android package directory
# mv android/app/src/main/java/$(echo $old_package | tr '.' '/') android/app/src/main/java/$(echo $new_package | tr '.' '/')

# # Rename the iOS package directory (if you're using iOS)
# mv ios/Runner/$(echo $old_package | tr '.' '/') ios/Runner/$(echo $new_package | tr '.' '/')

# # Rename the Dart package directory
# mv lib/$(echo $old_package | tr '.' '/') lib/$(echo $new_package | tr '.' '/')


# flutter pub run flutter_launcher_icons



# # Display a message indicating the package name change
# echo "Package name changed from $old_package to $new_package"
