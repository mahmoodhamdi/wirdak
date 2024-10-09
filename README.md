# Wirdak - Islamic Azkar and Prayer App

## Project Overview

**Wirdak** is an Islamic mobile application designed to help users access **Azkar** (remembrances), prayer times, Hijri calendar, and other important Islamic features. The app offers a simple and intuitive UI to engage users in daily spiritual activities. The app includes sections for different types of Azkar, a built-in tasbih for counting prayers, and more.

The app UI is designed using **Flutter** and is structured in a modular way for ease of expansion and maintenance.

---

## Features

- **Azkar Categories**: Explore different categories of Azkar like morning, evening, and post-prayer remembrances.
- **Favorite Azkar**: Save your favorite Azkar for quick access.
- **Prayer Times**: Get accurate prayer times for your location.
- **Hijri Calendar**: Access the Islamic Hijri calendar for important dates.
- **Nearby Mosques**: Find the nearest mosques based on your location.
- **Tasbih**: A virtual tasbih to keep track of your recitations.
- **Share & Like Azkar**: Share Azkar with friends and like your favorites.
  
---

## Project Structure

<details>
<summary>Click to expand</summary>

```bash
lib/
│
├── core/
│   ├── common/
│   │   ├── cubits/
│   │   │   └── favorites_cubit.dart            # Bloc for managing favorite Azkar
│   │   │   └── favorites_state.dart            # State management for favorites
│   │   │   └── ziker_cubit.dart                # Bloc for managing Ziker actions
│   │   │   └── ziker_state.dart                # State management for Ziker actions
│   │   ├── models/
│   │   │   └── azkar_category.dart             # Data model for Azkar categories
│   │   │   └── azkar_model.dart                # Data model for individual Azkar
│   │   ├── widgets/
│   │   │   └── azkar_list_item.dart            # Widget for each Azkar list item
│   │   │   └── azkar_list.dart                 # Widget displaying list of Azkar
│   │   │   └── custom_app_bar.dart             # Custom reusable app bar widget
│   │   │   └── date_widget.dart                # Widget displaying current date
│   │   │   └── location_and_date_header.dart   # Header with location and date
│   │   │   └── location_widget.dart            # Widget displaying user location
│   │   │   └── ziker_actions.dart              # Actions (like, share, etc.) for Azkar
│   │   │   └── ziker_card.dart                 # Card displaying Azkar details
│   │   │   └── ziker_thwab.dart                # Widget showing rewards of Azkar
│   ├── utils/
│   │   ├── constants/
│   │   │   └── azkar_data.dart                 # Static data source for Azkar
│   │   │   └── colors.dart                     # Color palette used in the app
│   │   │   └── image_strings.dart              # Image paths for assets
│   │   │   └── text_strings.dart               # Text constants used in the app
│   │   │   └── text_styles.dart                # Styles for app text elements
│   │   ├── device/
│   │   │   └── device_utility.dart             # Utilities for device-related info
│   │   ├── formatters/
│   │   │   └── formatter.dart                  # Helper methods for formatting data
│   │   ├── theme/
│   │   │   └── theme.dart                      # Theme configuration for the app
│   │   ├── helpers/
│   │   │   └── spacing.dart                    # Helpers for adding space between widgets
│
├── features/
│   ├── hijri_calender/                         # Feature folder for Hijri calendar
│   ├── home/
│   │   └── presentation/
│   │       ├── cubit/
│   │       │   └── prayer_time_cubit.dart      # Bloc for managing prayer times
│   │       │   └── prayer_time_state.dart      # State management for prayer times
│   │       └── views/
│   │           └── home_view.dart              # Main home screen view
│   │       └── widgets/
│   │           └── all_prayers_widget.dart     # Widget displaying all prayer times
│   │           └── features_list_item.dart     # List item widget for home features
│   │           └── features_list.dart          # Widget displaying a list of home features
│   │           └── vertical_prayer_time.dart   # Widget showing prayer times vertically
│   ├── masbaha/                                # Feature folder for Tasbih (Masbaha)
│   ├── notifications/                          # Folder for notification-related features
│   ├── prayer_timer/                           # Folder for managing prayer timers
│   ├── reading_azkar/
│   │   └── presentation/
│   │       └── views/
│   │           └── all_azkar_view.dart         # View showing all Azkar
│   │           └── favourite_view.dart         # View showing favorite Azkar
│   │           └── ziker_view.dart             # View for displaying Azkar by category
│   ├── settings/                               # Feature folder for settings
│
├── app.dart                                    # Main app configuration
├── firebase_options.dart                       # Firebase integration options
├── main_development.dart                       # Main entry for development mode
└── main_production.dart                        # Main entry for production mode
```

</details>

---

## Core Components

### 1. **Azkar List**

Displays a list of different categories of Azkar, allowing the user to select and view specific remembrances. The Azkar are grouped by categories such as **Morning Azkar**, **Evening Azkar**, and **Post-Prayer Azkar**.

- `AzkarList` Responsible for displaying a scrollable list of categories.
- `AzkarListItem` Each item shows an Azkar category with its name and description.

### 2. **Ziker Card**

A reusable card component that displays the text of the Ziker along with actions like **like**, **share**, and a **count** button.

- `ZikerCard` Contains the full UI for displaying an individual Ziker along with buttons for interaction.
- `ZikerActions`  Action buttons embedded within each Ziker card.

### 3. **Favorites Feature**

The app allows users to save their favorite Azkar. The **FavoritesCubit** is responsible for managing the logic behind adding/removing favorites.

- `FavoritesCubit` Handles adding/removing Azkar from the favorites list.
- `FavoritesView` Displays a list of all the user's favorite Azkar.

### 4. **Custom AppBar**

A custom AppBar with flexible options for showing a back button, a title, and customizable styles.

---

## Upcoming Features

- **Prayer Time Notifications**: Notify users of prayer times based on their location.
- **Qibla Direction**: Help users find the direction of the Qibla from their current location.
- **Advanced Filtering**: Let users filter Azkar based on time of day, importance, or theme.

---

## Dependencies

The app uses the following primary packages:

- **flutter_screenutil**: For responsive UI across various screen sizes.
- **flutter_svg**: To render SVG images efficiently.
- **bloc**: For state management.
- **equatable**: For simplifying state comparison in BLoC architecture.

---

## Contributing

We welcome contributions! To contribute, follow these steps:

1. Fork the repository.
2. Create a feature branch: `git checkout -b feature-branch-name`
3. Commit your changes: `git commit -m 'Add a new feature'`
4. Push to the branch: `git push origin feature-branch-name`
5. Open a pull request.

---

## Contact

For any questions or suggestions, feel free to reach out:

- **Email**: <hmdy7486@gmail.com>
- **LinkedIn**: [mahmoodhamdi](https://www.linkedin.com/in/mahmoud-hamdy-alashwah)

---

### 📝 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

### 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

### Quote

> "مَن غَدَا إلى المَسْجِدِ ورَاحَ، أعَدَّ اللَّهُ له نُزُلَهُ مِنَ الجَنَّةِ كُلَّما غَدَا أوْ رَاحَ."
> صحيح البخاري
