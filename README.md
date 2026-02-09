# EzyShope 👟

A sophisticated E-commerce solution built with **Flutter**. EzyShope goes beyond basic UI by implementing persistent state management, allowing users to save their preferences and cart items locally.

---

## 🎨 Visual Overview

### Core Experience (Dashboard & Details)
<p align="center">
  <img src="ezyshope mockup1.png" width="800" alt="EzyShope Core UI">
</p>

### User Data (Cart & Favorites)
<p align="center">
  <img src="ezyshope mockup2.png" width="800" alt="EzyShope Data Management">
</p>

---

## ✨ Key Features

### 🛠️ Advanced Navigation
- **Dynamic Dashboard**: Features a category-based filtering system (All, Jackets, Sneakers) that updates the product grid in real-time.
- **Multi-Level Navigation**: Integrated **Drawer** for deep links and a **Bottom Navigation Bar** for quick switching between Home, Favorites, and Profile.
- **Direct Access**: AppBar integration for instant navigation to the Cart.

### 🛍️ Shopping & Customization
- **Product Specifics**: Detailed view screens including a **Size Selection** system.
- **Interactive Cart**: Full CRUD functionality (Create, Read, Update, Delete) with real-time quantity adjustment and total price calculation.
- **Wishlist System**: One-tap "Favorite" toggle to save desired items.

---

## ⚙️ Technical Sophistication

### 🔄 State Management (Provider)
Used **Provider** to create a reactive architecture where the Cart and Favorites lists update across the entire app instantly without needing to refresh screens.

### 💾 Local Persistence (Shared Preferences)
The standout feature of EzyShope:
- **Data Persistence**: All Cart items and Favorite selections are stored locally using **Shared Preferences**. 
- **User Retention**: User data remains saved even after the app is closed or restarted, providing a professional-grade user experience.

### 🏗️ Layout Mastery
- Optimized **GridView** for product listings.
- Custom-built **Bottom Sheets** and Tab-based filtering logic.

---

## 🚀 How to Run
1. Clone the repo: `git clone https://github.com/ahmad-ali22/EzyShope.git`
2. Install dependencies: `flutter pub get`
3. Run the app: `flutter run`
