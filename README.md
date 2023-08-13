# CoopMedlem-Flutter

Technical Assessment

## The goal of this task is to: 


1. **Location-Based Store Search:**
   - Users should be able to search for the closest Coop stores based on their current location.
   - Alternatively, users should be able to enter a zip code (postnummer) or placename to search for nearby stores.

2. **Store Details:**
   - Users should have the ability to view the details of a selected store.
   - The store details should include relevant information about the store, such as its address, contact details, and operating hours.

3. **Download Newsletter:**
   - Users should be able to download the newsletter (Kundeavis) from the selected store.
   - The app should provide a user-friendly interface to access and download the newsletter.

4. **GET Requests:**
   - The app should utilize the provided GET requests to fetch the required information about the stores.
   - It should properly format the requests based on the user's input (zip code, placename, latitude, longitude).

5. **Compatibility and Accessibility:**
   - The app should be compatible with both iOS and Android devices.
   - It should provide an intuitive and accessible user interface for a seamless user experience.

6. **Bonus: Flutter Implementation:**
   - The app should be implemented using the Flutter framework.
   - It should run effectively on both iOS and Android devices, providing a consistent experience.

7. **Bonus: Map Integration:**
   - The app should display the selected store on a map.
   - Users should have the option to view directions from their current location to the selected store on the map.

 ## Technical Requirements

1. **Mobile App Platform:**
   - The app should be developed for both iOS and Android platforms.
   - It should be implemented using the Flutter framework to ensure cross-platform compatibility.

2. **User Location Retrieval:**
   - The app should have the capability to retrieve the user's current location using the device's GPS.
   - Alternatively, it should allow users to manually enter a zip code (postnummer) or placename for location-based searches.

3. **API Integration:**
   - The app should integrate with the provided Coop APIs using appropriate HTTP GET requests.
   - It should handle different types of API requests based on user inputs (zip code, placename, latitude, longitude).

4. **Store Details Display:**
   - The app should present the details of the selected store in a clear and organized manner.
   - Information such as address, contact details, and operating hours should be displayed.

5. **Newsletter Download:**
   - The app should provide a functionality to download the newsletter (Kundeavis) associated with the selected store.
   - The downloaded content should be accessible to users for viewing.

6. **Map Integration:**
   - The app should integrate with a map service to display the selected store's location.
   - Users should have the option to view the route and directions from their current location to the store.

7. **User Interface (UI) and User Experience (UX):**
   - The app's UI should be intuitive, user-friendly, and consistent across both iOS and Android platforms.
   - The app should follow best practices for UX design to ensure a smooth and enjoyable user experience.

8. **Error Handling and Validation:**
   - The app should implement appropriate error handling and validation mechanisms.
   - It should provide informative error messages in case of unsuccessful API requests or other issues.

# How to Run

    Install Flutter
    git clone https://github.com/jabransiddiqui/medlem.git
    cd medlem
    run pub get
    run flutter run

# iOS Quicker
    iOS Notes here.
# Android Quicker
    Android Notes here.

# Screenshot
|   |   |
|--------|-----|
|![Alt text](/lib/assets/images/1.png?raw=true "Screenshot 1") | ![Alt text](/lib/assets/images/2.png?raw=true "Screenshot 2") |
|![Alt text](/lib/assets/images/3.png?raw=true "Screenshot 3") | ![Alt text](/lib/assets/images/4.png?raw=true "Screenshot 4") |
|![Alt text](/lib/assets/images/5.png?raw=true "Screenshot 5") | ![Alt text](/lib/assets/images/6.png?raw=true "Screenshot 6") |
|![Alt text](/lib/assets/images/7.png?raw=true "Screenshot 7") | ![Alt text](/lib/assets/images/8.gif?raw=true "Gif 8") |

# Plugins
Plugin and there version used in this repository.

| Plugin | Pub |
|--------|-----|
| [flutter_bloc](./packages/flutter_bloc/) | [![Pub](https://img.shields.io/pub/v/flutter_bloc.svg?style=flat-square)](https://pub.dartlang.org/packages/flutter_bloc) |
| [equatable](./packages/equatable/) | [![Pub](https://img.shields.io/pub/v/equatable.svg?style=flat-square)](https://pub.dartlang.org/packages/equatable) |
| [dio](./packages/dio:/) | [![Pub](https://img.shields.io/pub/v/dio.svg?style=flat-square)](https://pub.dartlang.org/packages/dio) |
| [lottie](./packages/lottie:/) | [![Pub](https://img.shields.io/pub/v/lottie.svg?style=flat-square)](https://pub.dartlang.org/packages/lottie) |
| [google_maps_flutter](./packages/google_maps_flutter:/) | [![Pub](https://img.shields.io/pub/v/google_maps_flutter.svg?style=flat-square)](https://pub.dartlang.org/packages/google_maps_flutter) |
| [flutter_cache_manager](./packages/google_maps_flutter:/) | [![Pub](https://img.shields.io/pub/v/flutter_cache_manager.svg?style=flat-square)](https://pub.dartlang.org/packages/flutter_cache_manager) |
| [geolocator](./packages/google_maps_flutter:/) | [![Pub](https://img.shields.io/pub/v/geolocator.svg?style=flat-square)](https://pub.dartlang.org/packages/geolocator) | 
| [flutter_polyline_points](./packages/google_maps_flutter:/) | [![Pub](https://img.shields.io/pub/v/flutter_polyline_points.svg?style=flat-square)](https://pub.dartlang.org/packages/flutter_polyline_points) |   
| [flutter_inappwebview](./packages/google_maps_flutter:/) | [![Pub](https://img.shields.io/pub/v/flutter_inappwebview.svg?style=flat-square)](https://pub.dartlang.org/packages/flutter_inappwebview) |   
