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

**app screens**:


![photo_2024-06-16_12-57-12](https://github.com/SanaKejji/todo-app/assets/90012213/e1795498-efd8-4aee-a6b1-9aa373f45c1b)
![photo_2024-06-16_12-57-14](https://github.com/SanaKejji/todo-app/assets/90012213/4a813aef-d80c-4738-a23b-5396f3638cc8)
![photo_2024-06-16_12-57-16](https://github.com/SanaKejji/todo-app/assets/90012213/a720cd86-d9eb-479e-98e0-37bb59821dd7)
![photo_2024-06-16_12-57-18](https://github.com/SanaKejji/todo-app/assets/90012213/2880710c-f715-49bb-98d9-c56617c07358)
![photo_2024-06-16_12-57-09](https://github.com/SanaKejji/todo-app/assets/90012213/b338f3b7-0344-4aa4-9bb5-be6357df2826)
