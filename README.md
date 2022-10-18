# Management Portal

Web application created for technical test purpose only.

## Note

To make sure the app runs smoothly, please debugging the app from the terminal by inserting 'flutter run' since there are still ongoing bugs regarding images displayed on flutter web app.

## Code Structure

📦lib
 ┣ 📂bloc
 ┃ ┣ 📜auth_bloc.dart
 ┃ ┣ 📜auth_event.dart
 ┃ ┣ 📜auth_state.dart
 ┃ ┗ 📜bloc_observer.dart
 ┣ 📂cubit
 ┃ ┣ 📜login_cubit.dart
 ┃ ┣ 📜login_state.dart
 ┃ ┣ 📜signup_cubit.dart
 ┃ ┗ 📜signup_state.dart
 ┣ 📂models
 ┃ ┣ 📜category.dart
 ┃ ┣ 📜payment.dart
 ┃ ┣ 📜post.dart
 ┃ ┗ 📜user.dart
 ┣ 📂pages
 ┃ ┣ 📜home.dart
 ┃ ┣ 📜login.dart
 ┃ ┣ 📜signup.dart
 ┃ ┗ 📜upload.dart
 ┣ 📂repositories
 ┃ ┗ 📜auth_repository.dart
 ┣ 📂widgets
 ┃ ┗ 📜avatar.dart
 ┣ 📜.DS_Store
 ┣ 📜firebase_options.dart
 ┣ 📜main.dart
 ┗ 📜theme.dart

## Features

![Title](/assets/flutter_01.png)

![Title](/assets/flutter_02.png
### Simple and Minimalistic Design
Beautiful UI design and clean background will give a nice first impression for every new user.

![Title](/assets/flutter_03.png)
### What You See Is What You Get
When users land on the home screen, they can see and understand all the functions that the app provides in a quick glance.

![Title](/assets/flutter_04.png)
### Premium Membership
For premium users, they can access to all of the available contents.

![Title](/assets/flutter_05.png)
### Post to Community
Every verified users are able to post either normal or premium contents to the community.

