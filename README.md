# todo_app

**Used patterns**:

- BLoC.
- Clean Architecture Layers inspired by ('(https://resocoder.com/flutter-clean-architecture-tdd/)').


### Project structure:

```
📦lib
 ┣ 📂core
 ┃ ┣ 📂di
 ┃ ┣ 📂error
 ┃ ┣ 📂services
 ┃ ┣ 📂theme
 ┃ ┣ 📂use_case
 ┣ 📂data
 ┃ ┣ 📂data_source
 ┃ ┣ 📂models
 ┃ ┗ 📂repositories
 ┣ 📂domain
 ┃ ┣ 📂repositories
 ┃ ┗ 📂use_cases
 ┣ 📂presentation
 ┃ ┣ 📂auth
 ┃ ┃ ┣ 📂bloc
 ┃ ┃ ┗ 📜auth_screen.dart
 ┃ ┣ 📂base
 ┃ ┃ ┣ 📂bloc
 ┃ ┃ ┗ 📜base_screen.dart
 ┃ ┣ 📂my_todos
 ┃ ┃ ┣ 📂bloc
 ┃ ┃ ┗ 📜my_todos_screen.dart
 ┃ ┣ 📂others_todos
 ┃ ┃ ┣ 📂bloc
 ┃ ┃ ┗ 📜others_todos_screen.dart
 ┃ ┗ 📂splash
 ┃ ┃ ┗ 📜splash_screen.dart
 ┣ 📂router
 ┃ ┣ 📂guards
 ┃ ┃ ┗ 📜auth_guard.dart
 ┃ ┣ 📜router.dart
 ┃ ┗ 📜router.gr.dart
 ┣ 📜app.dart
 ┗ 📜main.dart
```



## Main Dependences:

1. **Flutter BLoC** for State Management.
2. **Auto Router** (Routing package).
3. **Get It** (Service Locater and Dependencies container).
4. **Dio** (Http Client).
5. **BLoC Test**.
6. **Http Mock Adapter** for testing.

## Scripts:

```yaml
scripts:
  format: melos exec -- "flutter format ."

  fix_hints: melos exec -- "dart fix —apply ."

  flutter_test_report: flutter test --reporter  json  | tojunit --output report.json

  flutter_test: flutter test

  build_runner:
    run: |
      melos exec --depends-on="build_runner" --  $runner
    env:
      runner: flutter pub run build_runner build --delete-conflicting-outputs
      
  build_relese:
    run: flutter build apk
```

ex: `melos format .`

### Notes:

1. Test report will saved in report.json file.

