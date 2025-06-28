# ଓଡ଼ିଆ ମଜାକଥା - Odia Jokes App 😄

A lightweight Flutter app that displays Odia jokes from Firebase or offline fallback JSON.

## 🔥 Features

- 🌓 Auto Light/Dark theme  
- 🌐 Firebase Firestore read-only jokes  
- 📦 Offline jokes fallback  
- 🇮🇳 Pure Odia script UI  
- ✅ Minimal, fast, and easy to use

## 🛠️ Setup Instructions

1. Clone the repo  
2. Run `flutter pub get`  
3. Install FlutterFire: `dart pub global activate flutterfire_cli`  
4. Configure Firebase: `flutterfire configure` (generates `firebase_options.dart`)  
5. Run the app: `flutter run` or build: `flutter build apk`

## 🚀 Launch
- Make sure Firestore has a collection `odia_jokes` with docs containing `text` fields (Odia jokes)
- Add your own Firestore rules as needed
