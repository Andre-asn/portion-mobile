# Portion - Bill Splitting App

A Flutter mobile application that makes splitting bills with friends easy, transparent, and hassle-free.

## 🎯 Problem Statement

- **Manual calculation errors**: People miscalculate splits, leading to over/underpayment
- **Payment confusion**: Multiple people pay for same items or items get missed
- **Awkward payment collection**: Person who paid has to chase friends for money
- **Lack of transparency**: Friends can't see what others ordered, causing disputes
- **Payment delays**: No easy way to pay back immediately or track who owes what

## ✨ Value Proposition

- **Eliminates calculation errors**: Automated item assignment and total calculation
- **Prevents double payments**: Real-time visibility of what others have claimed
- **Instant payment collection**: Friends can pay immediately through the app
- **Transparency**: Everyone sees the full receipt and all selections
- **Reduces social awkwardness**: No need to ask for money or remind people

## 🎯 Target Users

- **Primary**: Young professionals (22-35) who eat out frequently with friends/colleagues
- **Secondary**: College students who split meals and group expenses regularly
- **Tertiary**: Social groups who frequently share group expenses (birthday dinners, celebrations)

## 🏗️ Project Structure

```
lib/
├── models/           # Data models
│   ├── user.dart     # User model
│   ├── table.dart    # Bill splitting session model
│   └── item.dart     # Receipt item model
├── screens/          # UI screens
│   ├── onboarding_screen.dart  # App introduction
│   ├── main_screen.dart        # Main navigation
│   ├── tables_screen.dart      # Bill splitting sessions
│   ├── buddies_screen.dart     # Friends management
│   └── profile_screen.dart     # User profile
├── services/         # Business logic and API calls
├── providers/        # State management
├── widgets/          # Reusable UI components
├── utils/            # Utilities and helpers
│   └── theme.dart    # App theme configuration
└── main.dart         # App entry point
```

## 🚀 Getting Started

### Prerequisites

- Flutter SDK (^3.8.1)
- Dart SDK
- Android Studio / VS Code
- Android Emulator or physical device

### Installation

1. Clone the repository:
```bash
git clone <repository-url>
cd portion_mobile
```

2. Install dependencies:
```bash
flutter pub get
```

3. Run the app:
```bash
flutter run
```

## 📱 User Flows

### 1. Onboarding Flow
- Sign up → Profile setup → Add first buddies → Join/create first table

### 2. Bill Payer Flow
- Upload receipt → Select personal items → Choose buddies → Create table → Notify friends

### 3. Bill Participant Flow
- Receive notification → Open table → View receipt → Select items → Confirm total → Pay through app

### 4. Buddy Management Flow
- Send buddy requests → Accept/decline requests → Manage buddy list

## 🎨 Design System

The app uses a modern, clean design with:
- **Primary Color**: Indigo (#6366F1)
- **Secondary Color**: Emerald (#10B981)
- **Accent Color**: Amber (#F59E0B)
- **Error Color**: Red (#EF4444)
- **Success Color**: Green (#10B981)

## 📋 Current Features

### ✅ Implemented
- [x] Basic app structure and navigation
- [x] Onboarding flow with app introduction
- [x] Main navigation with bottom tabs
- [x] Tables screen (placeholder with mock data)
- [x] Buddies screen (placeholder with mock data)
- [x] Profile screen with user stats
- [x] Modern UI theme and design system
- [x] Data models for User, Table, and Item

### 🚧 In Progress
- [ ] Authentication system
- [ ] Receipt upload and OCR
- [ ] Real-time collaboration
- [ ] Payment integration
- [ ] Push notifications

### 📅 Planned Features
- [ ] Item selection interface
- [ ] Payment processing
- [ ] Receipt history
- [ ] Split calculations
- [ ] Social features
- [ ] Analytics and insights

## 🛠️ Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter
  cupertino_icons: ^1.0.8
  go_router: ^14.6.2          # Navigation
  provider: ^6.1.2            # State management
  flutter_svg: ^2.0.10+1      # SVG support
  cached_network_image: ^3.3.1 # Image caching
  intl: ^0.19.0               # Internationalization
  uuid: ^4.5.1                # Unique ID generation
```

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 📞 Support

For support, email support@portion.app or create an issue in this repository.

---

**Portion** - Making bill splitting simple, transparent, and social.