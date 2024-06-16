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



## Main Dependencies:

1. **Flutter BLoC** for State Management.
2. **Auto Router** (Routing package).
3. **Get It** (Service Locator and Dependencies container).
4. **Dio** (Http Client).
5. **BLoC Test**.
6. **Http Mock Adapter** for testing.




### Notes:

1. Test report will saved in report.json file.

