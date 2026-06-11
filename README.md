# Reclaim Flutter App

---
## Getting Started 🚀

This project contains 3 flavors:

- development
- staging
- production

To run the desired flavor either use the launch configuration in VSCode / Android Studio or use the following commands:

```sh
# Development
$ flutter run --flavor development --target lib/main_development.dart

# Staging
$ flutter run --flavor staging --target lib/main_staging.dart

# Production
$ flutter run --flavor production --target lib/main_production.dart
```

For production builds use the script at `tool/build/build.sh`. The script will generate 
obfuscation symbol mappings. Those symbols won't be included into source control, but please 
don't delete them, unless you are sure they are stored elsewhere. Otherwise we won't be able to 
read alarms at any app monitoring tool.

//TODO(init): Update the platforms this project will work:
_\*Reclaim works on Android, iOS, Windows, Linux and Web._


This project contains auto-generated code, and the code generator needs to be invoked everytime there's a change
in annotated code.

To run the code generator, execute the following command:

```sh
# For a one-off build
dart run build_runner build -d
```

```sh
# For constantly building automatically as the code changes
dart run build_runner watch -d
```

## Adding assets

The project uses `flutter_gen` for generating an `Assets` class with all the assets' paths. If you add a new asset into the 
asset directory, you must also run `build_runner` so the `Assets` class can be updated with the new references. 

---

## Data Models

Data is modelled for use with Bloc & Cubits using the Freezed pub package. In order to generate the 
freezed classes, see the code generation section above.

---

## Running Tests 🧪

To run all unit and widget tests use the following command:

```sh
$ flutter test --coverage --test-randomize-ordering-seed random
```

To view the generated coverage report you can use [lcov](https://github.com/linux-test-project/lcov).

```sh
# Generate Coverage Report
$ genhtml coverage/lcov.info -o coverage/

# Open Coverage Report
$ open coverage/index.html
```

---

### Firebase

We are using Firebase for App Distribution, so a simplified version of the Firebase project setup was made,
i.e. we didn't create one Firebase project for each environment (production, staging and development). If
we need to use Firebase Auth, Firebase Cloud Firestore, or any other service that needs separation of 
environments, then we will have to create separate Firebase projects.

The Firebase setup was made using the `flutterfire` cli version 0.3.0-dev.16. This experimental version 
is the only who supports configurating different app flavours. Unfortunately it's not yet production ready 
and has bugs.

You can use it running the following command, substituting the correct parameters. Please take a look
at the current native side folder structures to avoid misconfiguring Firebase.

```console
flutterfire configure \
--project="{{packageName}}" \
--platforms="ios,android" \
--ios-build-config=Debug-production \
--ios-out=/ios/Runner/GoogleService-Info.plist \
--android-out=/android/app/google-services.json \
--ios-bundle-id="reclaim.vercel.app" \
--android-package-name="reclaim.vercel.app" \
--out=/firebase/firebase_options_production.dart
--debug-symbols-ios \
--overwrite-firebase-options \
--yes
```

Or for the other environments:

```console
flutterfire configure \
--project="{{packageName}}" \
--platforms="ios,android" \
--ios-build-config=Debug-staging \
--ios-out=/ios/Runner/staging/GoogleService-Info.plist \
--android-out=/android/app/src/staging/google-services.json \
--ios-bundle-id="reclaim.vercel.app.stg" \
--android-package-name="reclaim.vercel.app.stg" \
--out=/firebase/firebase_options_staging.dart
```

Don't include option `--debug-symbols-ios` while we don't add Crashlytics into the project.