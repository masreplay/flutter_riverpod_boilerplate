# flutter_application_example

A new Flutter project.

## Getting Started

### install
```bash
dart pub global activate l10n_lint
```

### run init one time
```bash
l10n --**init**
```



### riverpod
generate files
```bash
flutter pub run build_runner build --delete-conflicting-outputs && flutter pub get
```


use `HookConsumerWidget` for all pages


### format code
format code
```bash
dart fix --apply && dart format -o write ./lib
```