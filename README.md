# Lulu Stylist App

Lulu, is an AI-driven personal styling assistant that provides outfit recommendations based on your wardrobe and personal style preferences. It includes features like AI chat for fashion advice, wardrobe management, and user profile customization for a highly personalized fashion experience.

---
## Demo

<div align="center">
  <table>
    <tr>
      <td><img src="https://github.com/harshsingh-io/lulu_stylist_app/blob/main/screenshots/1.jpg" alt="Screenshot 1" width="200"/></td>
      <td><img src="https://github.com/harshsingh-io/lulu_stylist_app/blob/main/screenshots/2.jpg" alt="Screenshot 2" width="200"/></td>
      <td><img src="https://github.com/harshsingh-io/lulu_stylist_app/blob/main/screenshots/3.jpg" alt="Screenshot 3" width="200"/></td>
      <td><img src="https://github.com/harshsingh-io/lulu_stylist_app/blob/main/screenshots/4.jpg" alt="Screenshot 4" width="200"/></td>
    </tr>
    <tr>
      <td><img src="https://github.com/harshsingh-io/lulu_stylist_app/blob/main/screenshots/5.jpg" alt="Screenshot 5" width="200"/></td>
      <td><img src="https://github.com/harshsingh-io/lulu_stylist_app/blob/main/screenshots/6.jpg" alt="Screenshot 6" width="200"/></td>
      <td><img src="https://github.com/harshsingh-io/lulu_stylist_app/blob/main/screenshots/7.jpg" alt="Screenshot 7" width="200"/></td>
      <td><img src="https://github.com/harshsingh-io/lulu_stylist_app/blob/main/screenshots/8.jpg" alt="Screenshot 8" width="200"/></td>
    </tr>
    <tr>
      <td><img src="https://github.com/harshsingh-io/lulu_stylist_app/blob/main/screenshots/9.jpg" alt="Screenshot 9" width="200"/></td>
    </tr>
  </table>
</div>

## Getting Started 🚀

Project Structure 

```sh
lib/
├── app/
│   ├── ai_chat_assistent/
│   │   └── widgets/
│   │       ├── ai_chat_screen.dart
│   │       └── chaat_ui.dart
│   ├── bottom_navigation/
│   │   └── user_home_screen.dart
│   ├── login_and_signup/
│   │   ├── login_number_screen.dart
│   │   ├── login_success.dart
│   │   └── sign_up_screen.dart
│   ├── onboarding/
│   │   └── onboarding_screen.dart
│   ├── settings/
│   ├── update_profile/
│   │   ├── profile_update_success.dart
│   │   └── update_profile_form.dart
│   ├── user_profile/
│   │   └── user_profile_screen.dart
│   ├── view/
│   │   └── app.dart
│   └── wardrobe_management/
│       ├── add_item_wardrobe_screen.dart
│       ├── wardrobe_items.dart
│       ├── wardrobe_management_screen.dart
│       └── app.dart
├── lulu_design_system/
│   ├── core/
│   │   ├── theme/
│   │   └── widgets/
│   │       ├── lulu_design_system.dart
│   │       └── sa_bloc_observer.dart
│   ├── notification/
│   │   └── toast/
├── logic/
│   ├── api/
│   │   ├── common/
│   │   ├── devices/
│   │   │   ├── models/
│   │   │   │   ├── devices_api.dart
│   │   │   │   └── devices_api.g.dart
│   │   ├── users/
│   │   │   ├── models/
│   │   │   │   ├── user_api.dart
│   │   │   │   └── user_api.g.dart
│   │   └── wardrobe/
│   │       ├── models/
│   │       │   └── wardrobe_api.dart
│   ├── bloc/
│   │   ├── accounts/
│   │   │   ├── auth/
│   │   │   └── login/
│   │   ├── mqtt/
│   │   ├── networks/
│   │   └── users/
│   ├── local/
│   │   ├── api_base.dart
│   │   ├── dio_factory.dart
│   │   └── sa_bloc_observer.dart
├── routes/
│   ├── constants.dart
│   ├── material_route.dart
│   └── routes.dart
└── utils/
    ├── bootstrap.dart
    ├── constraint.dart
    ├── main_development.dart
    ├── main_production.dart
    └── main_staging.dart
```

This project contains 3 flavors:

- development
- staging
- production

To run the desired flavor either use the launch configuration in VSCode/Android Studio or use the following commands:

```sh
# Development
$ flutter run --flavor development --target lib/main_development.dart

# Staging
$ flutter run --flavor staging --target lib/main_staging.dart

# Production
$ flutter run --flavor production --target lib/main_production.dart
```

_\*Lulu Stylist App works on iOS, Android, Web, and Windows._

---

## Running Tests 🧪

To run all unit and widget tests use the following command:

```sh
$ flutter test --coverage --test-randomize-ordering-seed random
```

To view the generated coverage report you can use [lcov](https://github.com/linux-test-project/lcov).

```sh
# Generate Coverage Report
$ genhtml coverage/lcov.info -o coverage/

# Open Coverage Report
$ open coverage/index.html
```

---

## Working with Translations 🌐

This project relies on [flutter_localizations][flutter_localizations_link] and follows the [official internationalization guide for Flutter][internationalization_link].

### Adding Strings

1. To add a new localizable string, open the `app_en.arb` file at `lib/l10n/arb/app_en.arb`.

```arb
{
    "@@locale": "en",
    "counterAppBarTitle": "Counter",
    "@counterAppBarTitle": {
        "description": "Text shown in the AppBar of the Counter Page"
    }
}
```

2. Then add a new key/value and description

```arb
{
    "@@locale": "en",
    "counterAppBarTitle": "Counter",
    "@counterAppBarTitle": {
        "description": "Text shown in the AppBar of the Counter Page"
    },
    "helloWorld": "Hello World",
    "@helloWorld": {
        "description": "Hello World Text"
    }
}
```

3. Use the new string

```dart
import 'package:lulu_stylist_app/l10n/l10n.dart';

@override
Widget build(BuildContext context) {
  final l10n = context.l10n;
  return Text(l10n.helloWorld);
}
```

### Adding Supported Locales

Update the `CFBundleLocalizations` array in the `Info.plist` at `ios/Runner/Info.plist` to include the new locale.

```xml
    ...

    <key>CFBundleLocalizations</key>
	<array>
		<string>en</string>
		<string>es</string>
	</array>

    ...
```

### Adding Translations

1. For each supported locale, add a new ARB file in `lib/l10n/arb`.

```
├── l10n
│   ├── arb
│   │   ├── app_en.arb
│   │   └── app_es.arb
```

2. Add the translated strings to each `.arb` file:

`app_en.arb`

```arb
{
    "@@locale": "en",
    "counterAppBarTitle": "Counter",
    "@counterAppBarTitle": {
        "description": "Text shown in the AppBar of the Counter Page"
    }
}
```

`app_es.arb`

```arb
{
    "@@locale": "es",
    "counterAppBarTitle": "Contador",
    "@counterAppBarTitle": {
        "description": "Texto mostrado en la AppBar de la página del contador"
    }
}
```

### Generating Translations

To use the latest translations changes, you will need to generate them:

1. Generate localizations for the current project:

```sh
flutter gen-l10n --arb-dir="lib/l10n/arb"
```

Alternatively, run `flutter run` and code generation will take place automatically.

[coverage_badge]: coverage_badge.svg
[flutter_localizations_link]: https://api.flutter.dev/flutter/flutter_localizations/flutter_localizations-library.html
[internationalization_link]: https://flutter.dev/docs/development/accessibility-and-localization/internationalization
[license_badge]: https://img.shields.io/badge/license-MIT-blue.svg
[license_link]: https://opensource.org/licenses/MIT
[very_good_analysis_badge]: https://img.shields.io/badge/style-very_good_analysis-B22C89.svg
[very_good_analysis_link]: https://pub.dev/packages/very_good_analysis
[very_good_cli_link]: https://github.com/VeryGoodOpenSource/very_good_cli
