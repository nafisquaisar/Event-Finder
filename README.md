# 📱 Event Finder App (Flutter)

## 📝 Overview

Event Finder is a Flutter-based mobile application that allows users to browse and explore nearby events such as concerts, sports matches, and meetups. The app fetches dynamic data from a mock API and presents it in a clean, responsive UI.

---

## 🎯 Screens Implemented

* ✅ Home Screen (Event List with Search)
* ✅ Event Detail Screen

---

## 🚀 Features

* Fetch events dynamically from API (GET request)
* Scrollable event list using ListView
* Clean and responsive UI design
* Search functionality (filter by title/location)
* Pull-to-refresh support
* Navigation from Home → Detail screen
* Dark & Light mode support
* Reusable components (EventCard, Button)
* Error handling and empty state UI

---

## 🌐 API Integration

Mock API used for fetching event data:

👉 https://your-api-link-here

### 📦 Data Fields Used:

* Event ID
* Title
* Category
* Date
* Time
* Location
* Image URL
* Distance
* Description

---

## 🛠 Tech Stack

* Flutter (Latest Stable)
* Dart
* HTTP package (API integration)

---

## ⚙️ State Handling

* Loading State → CircularProgressIndicator
* Error State → Error message UI
* Empty State → “No Events Found” UI

---

## 🧱 Project Structure

```
lib/
 ├── models/
 │    └── event_model.dart
 │
 ├── services/
 │    └── api_service.dart
 │
 ├── screens/
 │    ├── home_screen.dart
 │    ├── event_detail_screen.dart
 │    └── widgets/
 │         ├── event_card.dart
 │         ├── button.dart
 │
 ├── utils/
 │    └── app_colors.dart
```

---

## 📱 UI Highlights

* Modern card-based design
* Responsive layout using MediaQuery
* Dark & Light theme support
* Clean typography and spacing

---

## 🎥 Demo




---

## 📦 APK Download


---

## 🎯 Challenges Faced

* Handling API errors and network issues
* Designing responsive UI for multiple screen sizes
* Implementing consistent dark mode UI
* Managing clean component structure

---

## ✅ Conclusion

This project demonstrates real-world Flutter development practices including API integration, UI design, state handling, and navigation. The focus was on building a clean, scalable, and user-friendly mobile experience.
