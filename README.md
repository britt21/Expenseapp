# myexpense


App Architecture and Patterns Used

The application is built using the MVVM (Model-View-ViewModel) architecture pattern. This pattern was chosen for its scalability and maintainability, ensuring clear separation of concerns. The architecture consists of the following layers:

Model: Handles data-related operations, including fetching and saving data from Firebase Firestore and local storage.

View: Represents the UI layer, where Flutter widgets are used to display data to the user. It observes the ViewModel for state updates.

ViewModel: Acts as a bridge between the Model and the View. It manages the state and business logic, exposing data to the View through reactive patterns.

Key Benefits of MVVM:

Clear separation of UI and business logic.

Reusability of components.

Simplified testing by isolating logic in the ViewModel.

Tools and Libraries Utilized

Core Dependencies:

cupertino_icons (1.0.8): Provides iOS-style icons for a native iOS look and feel.

get (4.6.6): Simplifies state management, dependency injection, and navigation.

get_storage (2.1.1): Lightweight storage solution for caching and persisting small data locally.

google_fonts (6.2.1): Access to a wide range of custom fonts for consistent typography.

flutter_svg (2.0.17): Renders SVG images for scalable and high-quality vector graphics.

UI/UX Enhancements:

blurry_modal_progress_hud (1.0.3): Displays a modal progress indicator with a blurry background for better user feedback during loading states.

top_snackbar_flutter (3.1.0): Provides customizable top snackbar notifications for alerts and success messages.

Firebase Integration:

firebase_auth (5.4.1): Enables user authentication via Firebase.

firebase_core (3.10.1): Core Firebase library to initialize Firebase services.

cloud_firestore (5.6.2): Provides integration with Firebase Firestore for real-time database operations.

Testing:

test (1.24.9): Used for writing and running unit tests.

mockito (5.4.2): Provides a mocking framework for creating unit tests with ease.

Known Trade-offs or Limitations

Offline Support:

While get_storage provides lightweight local caching, the app’s reliance on Firebase Firestore for data persistence means limited offline functionality. Adding robust offline support would require more comprehensive local data synchronization.

Scalability:

The current implementation of state management using GetX is effective for small to medium-sized apps. However, larger applications might benefit from more structured state management libraries like Provider or Bloc for better long-term maintainability.

Dependency on Firebase:

The app heavily depends on Firebase for backend services, which might limit flexibility if switching to another backend solution is required in the future.

Testing Coverage:

While mockito and test are included, comprehensive test cases covering edge scenarios and integration testing are yet to be fully implemented.

UI Performance:

Heavy reliance on widgets like SVG rendering and blurred modal HUDs might cause performance issues on lower-end devices.

Codebase with Clear Commit History

The development process is documented through a clear and structured commit history. The following are two key branches reflecting the major milestones in the project:

feature_addrecord:

Implements the functionality to add records to the Firestore database.

Includes state management using GetX for dynamic UI updates.

Added validations and error handling during record creation.

add_items_final_release:

Finalized the item addition feature, ensuring seamless integration with Firestore.

Added progress indicators using blurry_modal_progress_hud.

Improved the user experience with enhanced error messaging and success notifications.

Refactored the codebase to adhere to MVVM principles and removed redundant code.

![Screenshot_20250128_210515.png](..%2F..%2FDownloads%2Fexpense%2FScreenshot_20250128_210515.png)
![Screenshot_20250128_210541.png](..%2F..%2FDownloads%2Fexpense%2FScreenshot_20250128_210541.png)
![Screenshot_20250128_210552.png](..%2F..%2FDownloads%2Fexpense%2FScreenshot_20250128_210552.png)


