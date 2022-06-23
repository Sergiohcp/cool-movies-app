# CoolMovies App

CoolMovies is a mobile application with list of movies and reviews.

## Screenshots

![Screenshot 1](./assets/screenshots/screenshot_1.jpg)
![Screenshot 1](./assets/screenshots/screenshot_2.jpg)

## Installation and Run

Clone the repository using `master` branch.

```bash
git clone git@github.com:Sergiohcp/cool-movies-app.git
```

Go to the project folder and run "pub get" to download dependencies.

```bash
cd coolmovies_app
flutter pub get
```
Open a simulator (ios or android) and run the application.

```bash
flutter run
```

## About implementation

1. In this application I used the graphql_flutter library to use the client and perform queries and mutations. I preferred use controllers to perform these request, to make a better separation of the business logic from the screens.

2. The GetX library is used for managing observable states, managing controllers instances and for navigating between the screens wit named routes.

3. The application uses translation (getx) and is prepared for English, Portuguese and Spanish, just change it in the nu_app.dart file, at line 34. Example: locale: Locale('pt', 'BR') / locale: Locale('es', 'MX')

4. The app has unit tests, widget tests and integration tests with test, flutter_test and flutter_drive libraries.

## Folders

#### /lib

1. **repositories:** methods to access graphql client and perform requests.
2. **controllers:** global state and calls to repositories methods.
3. **core:** core files like colors, texts styles, api client, etc.
4. **graphql:** graphql queries and mutations.
5. **models:** entities of customer, offer, product and purchase.
6. **pages:** pages and specific widgets used in pages.
7. **utils:** translation and money mask.
8. **widgets:** shared widgets.

#### /

1**assets:** images and lottie files.