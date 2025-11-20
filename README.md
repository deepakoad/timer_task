# 📱 Timer Task App — Flutter (MVVM Architecture)

A clean and modern Flutter application demonstrating 

**MVVM architecture**,
**API integration**, 
**list timers**, 
**mark-as-read functionality**,  
**visibility-based timer pause/resume**, 
and polished **UI/UX**.

This project was created as a technical assignment to showcase Flutter development skills.

---

## 🚀 Features

### ✔ Splash Screen
- Simple and clean splash screen with smooth navigation.

### ✔ Welcome Screen
- Intro screen with a "Get Started" button to enter the app.

### ✔ Home Screen
- Fetches posts from:  
  **https://jsonplaceholder.typicode.com/posts**
- Displays:
    - Post title
    - Timer (10/20/25s random)
    - Read/unread background color

### ✔ Timer Functionality (Fully Working)
Each post item has:
- A personal countdown timer
- Timer starts when item becomes visible on the screen
- Timer **pauses** when item scrolls out of view
- Timer **pauses** when user navigates to detail screen
- Timer **resumes** when coming back into view

### ✔ Mark as Read
- Tap any item → It becomes **read**
- Background color switches:
    - **Unread = Light Yellow**
    - **Read = White**
- Status is saved locally.

### ✔ Post Detail Screen
- Shows full post body using `/posts/{id}` API.

### ✔ Local Storage (SharedPreferences)
App stores:
- Read/unread status
- Cached posts list
- Timers restored when screen reloads

---

## 🏗 Project Architecture — MVVM


how to setup the

### Setup Instructions (Using Git URL)

Follow these steps to set up and run the project on your system.

1️⃣ Install Flutter

Download Flutter SDK from the official website:

🔗 https://docs.flutter.dev/get-started/install

Install Steps:

Download Flutter SDK (stable version)

Extract the zip file

Add Flutter to PATH

Run this command to verify:

flutter doctor


If all checkmarks are green → setup is complete.

2️⃣ Clone the Project Using Git URL

Open Terminal / CMD and run:

git clone https://github.com/deepakoad/timer_task.git


Then enter the project folder:

cd timer_task

3️⃣ Get Dependencies

Run:

flutter pub get


This installs all required packages such as:

provider

http

shared_preferences

visibility_detector

4️⃣ Connect a Real Device / Emulator
▶ For Android:

Enable USB debugging

Connect USB cable

Run:

flutter devices

▶ For iOS:

Open Xcode

Start iOS Simulator

5️⃣ Run the App
flutter run


The app will start with:

Splash Screen

Welcome Screen

Home Screen

6️⃣ Build APK (Optional)

If interviewer wants APK:

flutter build apk --release


APK will be created inside:

build/app/outputs/flutter-apk/app-release.apk

