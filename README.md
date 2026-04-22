# 🧾 Grocery App (Code Sample)

## 📱 Overview

This repository contains a **sample iOS Grocery Application** designed to demonstrate a scalable project architecture, clean code structure, and modular development approach.

The app focuses on **grocery list management and receipt scanning**, allowing users to extract structured data (items, quantity, price) from receipts and manage their grocery lists efficiently.

> ⚠️ This is a **sample codebase only**, created to demonstrate architecture and coding practices. It is not a production-ready application.

---

## ✨ Key Features

### 🔐 Authentication Module

* Login
* Register
* Forgot Password
* Passcode Security (if enabled in flow)

---

### 🏠 Dashboard

* View grocery lists (buckets)
* Navigate between app modules
* Quick access to invoices and notifications

---

### 🧺 Grocery Buckets

* Create grocery lists (buckets)
* Add / edit / delete items
* Organize items by list

---

### 🧾 Invoice / Receipt Scanning

* Scan grocery receipts from images
* Extract:

  * Item Name
  * Quantity
  * Price
* Convert receipt data into structured list format

---

### 🔔 Notifications

* In-app notifications
* Notification management screen
* Settings-based notification control

---

### ⚙️ Settings Module

* Profile settings
* Change password
* Notification settings
* App preferences

---

## 🏗 Architecture Overview

The project follows a **modular MVC-style architecture** with separation of concerns across features.

```
.
├── API Manager
│   ├── End points
│   ├── Models
│   └── Services
│
├── AppManager
├── Constants
├── Controllers
│   ├── Authentications
│   ├── Buckets
│   ├── Dashboard
│   ├── Invoices
│   ├── Notifications
│   └── Settings
│       └── Notifications
│
├── Helper
├── Settings
└── fonts
```

---

## 📂 Folder Breakdown

### 🌐 API Manager

Handles all network communication and backend integration.

* **End points** → API routes and URL definitions
* **Models** → Request/Response models
* **Services** → API service layer (network calls, parsing, error handling)

---

### 📱 AppManager

* Central application configuration
* App-wide state handling
* Initial setup logic

---

### 🧩 Constants

* API constants
* App constants
* Keys and identifiers

---

### 🎮 Controllers

Main UI logic layer of the application.

* **Authentications** → Login, Register, Forgot Password
* **Buckets** → Grocery list management
* **Dashboard** → Main home screen
* **Invoices** → Receipt scanning and processing
* **Notifications** → Notification listing
* **Settings** → User settings and preferences

#### Settings → Notifications

* Notification preferences screen
* Toggle notification settings

---

### 🛠 Helper

* Utility functions
* Extensions
* Reusable helper methods

---

### ⚙️ Settings

* App configuration settings
* User preferences handling

---

### 🔤 Fonts

* Custom font assets
* Font configuration and usage

---

## 🧠 Architecture Principles

* Modular structure
* Separation of concerns
* Reusable components
* Scalable folder design
* Clean code practices

---

## 🚀 Purpose of This Project

This project is built to demonstrate:

* How a real-world iOS project is structured
* Clean and scalable architecture design
* Separation of API, UI, and business logic
* Feature-based modular development

---

## ⚠️ Important Note

This repository is a **sample code only** and is intended for:

* Code structure reference
* Architecture demonstration
* Development best practices

It is **not a production application** and some features may be simplified or mocked.

---

## 👨‍💻 Summary

A sample Grocery iOS application showcasing:

* Receipt scanning and data extraction
* Grocery list management
* Modular architecture
* Clean and maintainable code structure

---

⭐ If you're reviewing this project, it is meant purely to understand coding style, structure, and architecture approach.
