cd ./packages/core
flutter pub get
cd ../data
flutter pub get && dart run build_runner build --delete-conflicting-outputs                  
cd ../domain
flutter pub get
cd ../../
flutter pub