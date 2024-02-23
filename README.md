# Genuine Technology Job Task - Flutter App

## Introduction

This Flutter application has been developed as part of the job task for Genuine Technology. The application focuses on handling user authorization, displaying a paginated customer list with detailed information, images, and maintaining a user-friendly UI. The state management tool used in this app is GetX.

## Folder Structure

        lib
        ├── application
        │   ├── app.dart
        │   └── binders
        │       └── state_bindings.dart
        ├── data
        │   ├── models
        │   │   ├── customer.dart
        │   │   ├── customer_list_response.dart
        │   │   ├── page_info.dart
        │   │   └── user_profile.dart
        │   ├── services
        │   └── utility
        │       └── urls.dart
        ├── main.dart
        └── presentation
            ├── ui
            │   ├── controllers
            │   │   ├── auth_controller.dart
            │   │   ├── customer_controller.dart
            │   │   └── login_controller.dart
            │   ├── screens
            │   │   ├── auth
            │   │   │   ├── login_screen.dart
            │   │   │   └── profile_screen.dart
            │   │   ├── customer_details_screen.dart
            │   │   ├── homescreen.dart
            │   │   └── splash_screen.dart
            │   └── widgets
            │       ├── grid_view_tile.dart
            │       └── list_view_tile.dart
            └── utils
                └── app_colors.dart

## Dependencies

The project uses the following external packages for enhanced functionality:

cached_network_image: ^3.3.1
cupertino_icons: ^1.0.6
dio: ^5.4.1
get: ^4.6.6
infinite_scroll_pagination: ^4.0.0
shared_preferences: ^2.2.2
device_preview: ^1.1.0
sizer: ^2.0.15

## Screenshots

### HomeScreen

![HomeScreen](path_to_your_image1.png)
_Description of the HomeScreen_

### CustomerDetailsScreen

![CustomerDetailsScreen](path_to_your_image2.png)
_Description of the CustomerDetailsScreen_

### LoginController

![LoginController](path_to_your_image3.png)
_Description of the LoginController_

### CustomerController

![CustomerController](path_to_your_image4.png)
_Description of the CustomerController_

## Requirements Fulfillment

State Management Tool: The app uses GetX for state management.

User Authorization Handling: User authorization is handled using AuthController and LoginController.

Customer List Pagination: The customer list is paginated using the CustomerController and infinite_scroll_pagination package.

Customer Image and Details: The customer details screen (CustomerDetailsScreen) displays detailed information, including images.

Error Handling: Errors are handled and displayed with proper messages using Get.snackbar.

User-Friendly UI: Efforts have been made to create a user-friendly UI, including clean and readable code.

Clean Code: The code follows Flutter best practices, aiming for clean, readable, and understandable code.

## Conclusion

This Flutter application meets the specified requirements, showcasing the ability to handle user authorization, paginate through a customer list, and present detailed customer information with a user-friendly UI. The codebase is organized and follows best practices for maintainability.
