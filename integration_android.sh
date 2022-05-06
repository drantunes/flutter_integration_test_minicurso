pushd android
flutter build apk
./gradlew app:assembleAndroidTest
./gradlew app:assembleDebug -Ptarget=integration_test/app_test.dart
popd

gcloud firebase test android run --type instrumentation \
  --app build/app/outputs/apk/debug/app-debug.apk \
  --test build/app/outputs/apk/androidTest/debug/app-debug-androidTest.apk \
  --device-ids=Pixel2 \
  --os-version-ids=29 \
  --orientations=portrait \
  --use-orchestrator \
  --timeout 3m \
  --results-bucket=gs://<seuprojeto>.appspot.com \
  --results-dir=tests/firebase