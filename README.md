# stroll_test

A new Flutter project.

## Architecture

This project follows a clean architecture approach, promoting separation of concerns and making the codebase easier to maintain. The core structure includes:

- **Core**: Contains essential services, utilities, and models.
- **Features**: Specific implementations of features (not shown in the current script but recommended for scalability).
- **Widgets**: Custom widgets used throughout the app.

## Code Snippets

### Main Application Entry

The main entry point of the application is located in `lib/main.dart`:

```dart
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: 'application/.env');
  await di.init();
  runApp(MyApp());
}
```

### Dependency Injection Setup

In `lib/core/services/injection_container.dart`:

```dart
final sl = GetIt.instance;

Future<void> init() async {
  sl.registerLazySingleton(() => LocalNotificationService());
  // Additional services...

    sl
    ..registerFactory(() =>
        ${featureNameCapitalized}Bloc(get${featureNameCapitalized}Data: sl()))
    ..registerLazySingleton(() => Get${featureNameCapitalized}Data(repository: sl()))
  

    // AuthenticationHiveDataSource
    ..registerLazySingleton<${featureNameCapitalized}Repository>(() =>
        ${featureNameCapitalized}RepositoryImpl(remoteDataSource: sl(), hiveDataSource: sl()))
    ..registerLazySingleton<${featureNameCapitalized}RemoteDataSource>(
      () => ${featureNameCapitalized}RemoteDataSourceImpl(network: sl()),
    )
       ..registerLazySingleton<${featureNameCapitalized}HiveDataSource>(
      () => ${featureNameCapitalized}HiveDataSourceImpl(),
    )
    ..registerLazySingleton(
        () => Network(baseUrl: UrlConfig.baseUrl, showLog: true));
}
```



## project Breakdown

Here’s a breakdown of the folder structure:

```
[project-name]/
├── application/
│   └── assets/
│       ├── images/
│       └── fonts/
│   └── .env
├── lib/
│   ├── core/
│   │   ├── error/
│   │   │   ├── exceptions.dart
│   │   │   └── failures.dart
│   │   ├── services/
│   │   │   └── injection_container.dart
│   │   ├── storage/
│   │   │   └── hive/
│   │   │       └── hive_service.dart
│   │   ├── theme/
│   │   │   ├── theme.dart
│   │   │   ├── colors.dart
│   │   │   ├── text_styles.dart
│   │   │   └── app_colors.dart
│   │   ├── usecases/
│   │   │   └── usecase.dart
│   │   ├── utils/
│   │   │   ├── typedef.dart
│   │   │   ├── constants.dart
│   │   │   ├── image_util.dart
│   │   │   ├── logger_util.dart
│   │   │   ├── url_launch_services.dart
│   │   │   └── validators.dart
│   │   ├── network/
│   │   │   ├── api_error.dart
│   │   │   ├── api_interceptor.dart
│   │   │   ├── error_interceptor.dart
│   │   │   ├── network_provider.dart
│   │   │   └── network.dart
│   │   ├── notifications/
│   │   │   ├── push_notification.dart
│   │   │   └── notification_service.dart
│   │   ├── widgets/
│   │   │   ├── custom_button.dart
│   │   │   └── custom_text_field.dart
│   │   ├── transitions/
│   │   │   ├── custom_slide_transition.dart
│   │   │   ├── custom_scale_transition.dart
│   │   │   ├── custom_rotation_transition.dart
│   │   │   ├── custom_size_transition.dart
│   │   │   └── custom_fade_slide_transition.dart
│   │   ├── extensions/
│   │   │   ├── context_extensions.dart
│   │   │   ├── widget_extensions.dart
│   │   │   └── string_extensions.dart
│   │   ├── routes/
│   │   │   └── routes.dart
│   └── main.dart
├── pubspec.yaml
├── .gitignore
└── README.md
```

## Feature Breakdown

Here’s a breakdown of the folder structure:

```
[project-name]/
├── lib/
│   ├── core/....
│   ├── features/
│   │   └── [feature-name]/
│   │       ├── data/
│   │       │   ├── datasources/
│   │       │   │   ├── [feature-name]_hive_data_source.dart
│   │       │   │   └── [feature-name]_remote_data_source.dart
│   │       │   ├── models/
│   │       │   │   └── [feature-name]_model.dart
│   │       │   └── repositories/
│   │       │       └── [feature-name]_repository_impl.dart
│   │       ├── domain/
│   │       │   ├── entities/
│   │       │   │   └── [feature-name]_entity.dart
│   │       │   ├── repositories/
│   │       │   │   └── [feature-name]_repository.dart
│   │       │   └── usecases/
│   │       │       └── get_[feature-name]_data.dart
│   │       ├── presentation/
│   │       │   ├── blocs/
│   │       │   │   ├── [feature-name]_state.dart
│   │       │   │   ├── [feature-name]_event.dart
│   │       │   │   └── [feature-name]_bloc.dart
│   │       │   ├── views/
│   │       │   │   └── [feature-name]_page.dart
│   │       │   └── widgets/
│   │       │       └── [feature-name]_widget.dart

```
