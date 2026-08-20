# 📝 Online Exam App

A modern **Online Examination & Learning Mobile Application** built with Flutter and Dart. Users can browse technical exams, take timed quizzes, receive instant results, review their answers, and manage their profiles.

## ✨ Features

* 🔐 User authentication
* 🏠 Browse and select exams
* 📝 Timed exams with question navigation
* ⏱️ Countdown timer with timeout handling
* 📊 Instant exam results and scoring
* 🔎 Review correct and incorrect answers
* 👤 Edit profile and change password

## 📱 Screenshots

<div align="center">
  <table>
    <tr>
      <td align="center"><b>Browse Categories</b></td>
      <td align="center"><b>Timed Exam View</b></td>
      <td align="center"><b>Instant Scoring</b></td>
    </tr>
    <tr>
      <td><img src="https://github.com/user-attachments/assets/a9f2ce37-f258-4a1e-83fd-4e860956cd2c" width="230"/></td>
      <td><img src="https://github.com/user-attachments/assets/1973adba-280b-4376-9e58-d41fa4f8cb09" width="230"/></td>
      <td><img src="https://github.com/user-attachments/assets/126b5964-2ddd-4c20-b178-e2d1f3d260b7" width="230"/></td>
    </tr>
    <tr>
      <td align="center"><b>Review Answers</b></td>
      <td align="center"><b>Track Progress</b></td>
      <td align="center"><b>Manage Profile</b></td>
    </tr>
    <tr>
      <td><img src="https://github.com/user-attachments/assets/6d641ded-24d6-4cae-84b6-68b2030192f5" width="230"/></td>
      <td><img src="https://github.com/user-attachments/assets/0b0437b6-bdd8-42af-ab3a-1af9b5f4c162" width="230"/></td>
      <td><img src="https://github.com/user-attachments/assets/72a3e3c3-b9df-431e-89da-4fb3c4c5f70a" width="230"/></td>
    </tr>
  </table>
</div>

## 🛠️ Tech Stack

* **Flutter & Dart**
* **Clean Architecture**
* **BLoC / Cubit**
* **GetIt / Injectable**
* **Dio & Retrofit**
* **JSON Serialization**
* **Flutter Secure Storage**
* **RESTful API**

## 📂 Project Structure

```text
lib/
├── config/
│   ├── base_response/
│   ├── base_state/
│   ├── di/
│   ├── dio/
│   ├── models/
│   └── security_storage/
│
├── core/
│   ├── errors/
│   ├── router/
│   ├── theme/
│   ├── utilities/
│   ├── values/
│   └── widgets/
│
├── features/
│   ├── auth/
│   ├── change_password/
│   ├── edit_profile/
│   ├── exam_result/
│   ├── exams/
│   ├── exams_questions/
│   ├── home/
│   └── splash/
│
└── main.dart
```


## 🚀 Getting Started

### Prerequisites

Make sure you have installed:

* Flutter SDK
* Dart SDK
* Android Studio or VS Code
* Android Emulator or a physical Android device

### Installation

Clone the repository:

```bash
git clone https://github.com/mohamedaly0206/Online-Exam-App.git
```

Navigate to the project:

```bash
cd online_exam_app
```

Install dependencies:

```bash
flutter pub get
```

Generate required files:

```bash
dart run build_runner build --delete-conflicting-outputs
```

Run the application:

```bash
flutter run
```

---



## 👨‍💻 Development

Built with a focus on **Clean Architecture, reusable components, scalable state management, and maintainable code**.
