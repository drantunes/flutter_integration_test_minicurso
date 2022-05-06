output="../build/ios_integ"
product="build/ios_integ/Build/Products"
dev_target="15.4"

flutter build ios integration_test/app_test.dart --release 

pushd ios
    xcodebuild -workspace Runner.xcworkspace \
               -scheme Runner \
               -configuration Flutter/Release.xcconfig \
               -derivedDataPath $output \
               -sdk iphoneos build-for-testing 
popd

pushd $product
zip -r "ios_tests.zip" "Release-iphoneos" "Runner_iphoneos$dev_target-arm64.xctestrun"
popd

gcloud firebase test ios run --test "build/ios_integ/Build/Products/ios_tests.zip" \
  --device model=ipad5,version=$dev_target,locale=en_US,orientation=portrait \
  --xcode-version=13.3.1 \
  --timeout 3m \
  --results-bucket=gs://<seuprojeto>.appspot.com \
  --results-dir=tests/firebase