printf "Fetching... \n"

dart run l10n_fetcher.dart
fvm dart run l10n_fetcher.dart
flutter gen-l10n 
fvm flutter gen-l10n 

printf "Done... \n"
