# todo_app

**Used patterns**:

- BLoC.
- Clean Architecture Layers inspired by ('(https://resocoder.com/flutter-clean-architecture-tdd/)').

**app features**:

 app has three main screens(login, my todos, others todo "display other people todos").

- login.
- user can add + edit + view + delete his tasks.
- display user main profile info.
- store user todos in local storage to be accessible at any time.
- the app have light and dark theme.


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
6. **Mockito** for testing.





