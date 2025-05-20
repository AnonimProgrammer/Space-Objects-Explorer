# 🌌 Space Object Explorer

**Space Object Explorer** is a Flutter-based mobile application designed to help users explore and learn about various space objects including asteroids, planets, and satellites. The app fetches live data from public APIs and allows users to browse, inspect details, and mark favorites using a sleek, intuitive UI.

---

## 🚀 Features

- 🔭 **Live Data from 3 Public APIs**:
  - 🪨 **Asteroids** – [NASA NEO API](https://api.nasa.gov/neo/rest/v1/feed?api_key=D8jHooSCZEPSd1Nt6KaDqUB7pephg9H8N1BU1zYY)
  - 🪐 **Planets** – [Le Systeme Solaire API](https://api.le-systeme-solaire.net/rest/bodies/)
  - 🛰️ **Satellites** – [N2YO API](https://api.n2yo.com/rest/v1/satellite/above/0/0/0/180/0?apiKey=LMUEBY-UZGJM9-VNLC94-5H9G)

- 🧬 **Typed Models**  
  - Custom Dart models (`Asteroid`, `Planet`, `Satellite`) map the required fields from each API response.

- 🔌 **Service Layer**  
  - Three dedicated services handle `http.get` logic and return lists of the corresponding model.

- 🧭 **User Interface**  
  - Home page displays overview cards for each space object type.
  - Each card navigates to a categorized list view with objects retrieved using the respective service.
  - Tapping an object opens a detailed page with all relevant information.

- ⭐ **Favorites System**  
  - Users can add or remove any object to/from favorites from the corresponding favorites page or details page.
  - Favorites are stored persistently using `SharedPreferences`.
  - Logic for managing favorites is centralized in `favorites_storage.dart`.
  - Drawer menu links to:
    - Favorite Asteroids
    - Favorite Planets
    - Favorite Satellites

- 📊 **Custom Grading System**  
  - Simple Grading system was designed for different type of pages, for example red for planets, purple for satellites and green for asteroids.


- 🖋️ **Typography with Google Fonts**  
  - UI styling is enhanced using the [`google_fonts`](https://pub.dev/packages/google_fonts) package for clean, readable, and themed text.

---
