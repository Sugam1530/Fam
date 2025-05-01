# 🟠 Gradient Card UI Flutter App

A visually rich Flutter application that demonstrates custom-designed card layouts using gradients, background images, and scrollable components (e.g., HC1, HC9). This project includes a smooth splash screen, launcher icon generation, and reusable component architecture.

---

## 📲 Download Link:

https://drive.google.com/file/d/1K3DyfQlrFC0wwkfaUnbjvKuVhS-B3a8n/view?usp=sharing

## ✨ Features

- 🃏 **HC9 Gradient Cards**: Horizontally scrollable widgets with dynamic gradient backgrounds and aspect-ratio-based background images.
- 💧 **Dynamic Gradients**: Gradients parsed from JSON and reversed dynamically.
- 🔄 **Responsive Design**: Aspect ratio-aware card widths that adapt gracefully.
- 🚀 **Splash Screen**: Orange-themed animated splash screen.
- 🔖 **Custom Launcher Icon**: Integrated launcher icons generated via `flutter_launcher_icons`.

---

## 🧱 Project Structure

```
lib/
├── data/
│   └── models/
│       └── HC9CardModel.dart         # Data model for HC9 widget
├── presentation/
│   └── widgets/
│       └── HC9Widget.dart            # UI for HC9 card component
├── splash/
│   └── splash_screen.dart            # Animated splash screen
├── main.dart                         # App entry point
assets/
└── logo.png                          # App logo (for splash & icon)
```

---

## 📲 Setup Instructions

1. **Clone the Repo**

```bash
git clone https://github.com/Sugam1530/Fam.git
cd gradient-card-ui
```

2. **Install Dependencies**

```bash
flutter pub get
```

3. **Run the App**

```bash
flutter run
```

4. **Generate Launcher Icons**

Update your `pubspec.yaml`:

```yaml
flutter_launcher_icons:
  android: true
  ios: true
  image_path: "assets/logo.png"
  adaptive_icon_background: "#FFA500"
```

Then run:

```bash
flutter pub run flutter_launcher_icons
```

---

## 📦 Packages Used

- `flutter_launcher_icons`
- `flutter_native_splash` *(optional if splash is native)*
- `http` *(if you're fetching cards from API)*

---

## 💡 TODO (Optional)

- [ ] Add HC1 widget implementation
- [ ] Integrate API for card data
- [ ] Implement navigation from cards
- [ ] Add unit tests

---

## 🧑‍💻 Author

**Sugam Das**  
📍 Flutter Developer | Data Science Enthusiast  
📫 [Email](mailto:sugamdas1530@gmail.com)

---

## 📄 License

This project is open-source and available under the [MIT License](LICENSE).
