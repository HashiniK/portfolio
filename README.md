# 🌟 Hashini's Portfolio

A modern, responsive portfolio website built with Flutter Web to showcase my journey as a developer.

![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)
![Web](https://img.shields.io/badge/Web-4285F4?style=for-the-badge&logo=google-chrome&logoColor=white)

## ✨ Features

- **📱 Fully Responsive Design** - Optimized for all devices from mobile to desktop
- **🎨 Modern UI/UX** - Clean, minimalistic design with smooth animations  
- **⚡ Fast Performance** - Built with Flutter Web for optimal loading speeds
- **🌐 Cross-Platform** - Works seamlessly across all browsers
- **🎯 Interactive Elements** - Engaging user experience with smooth transitions
- **📧 Contact Integration** - Easy ways to get in touch

## 🚀 Live Demo

[View Live Portfolio](https://your-portfolio-url.com) <!-- Replace with your actual URL -->

## 🛠️ Tech Stack

- **Frontend:** Flutter Web
- **Language:** Dart
- **Styling:** Material Design & Custom UI Components
- **State Management:** Provider/Riverpod <!-- Update based on what you're using -->
- **Deployment:** Firebase Hosting <!-- Update based on your hosting -->
- **Version Control:** Git & GitHub

## 📂 Project Structure

```
lib/
├── constants/
│   ├── constants.dart           ✅ All constants
│   ├── app_colors.dart          ✅ Color scheme
│   ├── app_styles.dart          ✅ Text styles & themes
│   └── responsive_utils.dart    ✅ Responsive utilities
├── data/
│   └── project_data.dart        ✅ Featured & all projects data
├── models/
│       └── project.dart         ✅ Enhanced project model
├── screens/
│   ├── portfolio_page/
│   │   ├── portfolio_page.dart  ✅ Updated main page
│   │   └── widgets/             ✅ Individual widget files
│   │       ├── about_section.dart      ✅ App's about section
│   │       ├── contact_section.dart    ✅ App's contact section
│   │       ├── experience_section.dart ✅ App's experience section
│   │       ├── hero_section.dart       ✅ App's hero section
│   │       ├── navigation_header.dart  ✅ App's navigation header
│   │       ├── projects_section.dart   ✅ App's featured projects section
│   │       └── sidebar.dart            ✅ App's about section
│   └── projects_page/
│       └── projects_page.dart   ✅ All projects page
├── services/
│       └── email_service.dart   ✅ Enhanced email service
├── portfolio_app.dart           ✅ Main app entry
└── main.dart                    ✅ App entry point
```

## 🏃‍♂️ Getting Started

### Prerequisites

- Flutter (>=3.0.0)
- Dart SDK
- A web browser
- Git

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/HashiniK/portfolio.git
   cd portfolio
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Enable Flutter Web** (if not already enabled)
   ```bash
   flutter config --enable-web
   ```

4. **Run the application**
   ```bash
   flutter run -d chrome
   ```

### Building for Production

To build the web app for production:

```bash
flutter build web --release
```

The built files will be available in the `build/web` directory.

## 🎨 Customization

### Personalizing Content

1. **Update personal information** in `lib/data/`
2. **Add your projects** in `lib/models/project/`  
3. **Modify colors and themes** in `lib/constants/`
4. **Replace assets** in the `assets/` directory with your own images

### Adding New Sections

1. Create a new screen in `lib/screens/`
2. Add the screen to your `lib/portfolio_app/`
3. Update navigation and routing as needed

## 📱 Responsive Design

This portfolio is designed to work flawlessly across:

- **🖥️ Desktop** (1200px+)
- **💻 Laptop** (1024px - 1199px) 
- **📱 Tablet** (768px - 1023px)
- **📱 Mobile** (320px - 767px)

## 🤝 Contributing

Contributions, issues, and feature requests are welcome!

1. **Fork the Project**
2. **Create your Feature Branch** (`git checkout -b feature/AmazingFeature`)
3. **Commit your Changes** (`git commit -m 'Add some AmazingFeature'`)
4. **Push to the Branch** (`git push origin feature/AmazingFeature`)
5. **Open a Pull Request**

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 📞 Contact

**Hashini Kodithuwakku** - [hashini.kodithuwakku22@gmail.com](mailto:hashini.kodithuwakku22@gmail.com)

- 💼 **LinkedIn:** [Hashini Kodithuwakku](https://www.linkedin.com/in/hashini-kodithuwakku-4254a51a6/)
- 🐙 **GitHub:** [@HashiniK](https://github.com/HashiniK)
- 📱 **Phone:** +94702393876
- 📍 **Location:** Yakkala, Sri Lanka
- 🌐 **Portfolio:** [Hashini](https://your-portfolio-url.com)

## 🙏 Acknowledgments

- Flutter team for the amazing framework
- Material Design for the beautiful design system
- Open source community for inspiration and resources

---

⭐ **Star this repository if you found it helpful!**

*Built with ❤️ using Flutter*
