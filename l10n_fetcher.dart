import 'package:gsheets/gsheets.dart';
import 'dart:io';
import 'dart:convert';

final file = File('google_creds.json');
final _credentials = file.readAsStringSync();

void main() async {
  final gsheets = GSheets(_credentials);
  const spreadsheetId = '1syERPZC_f89vpBexacoNwROSSOcmDtMTIw0eGNe3Hu0';
  final ss = await gsheets.spreadsheet(spreadsheetId);

  var sheet = ss.worksheetByTitle('translations');
  var keys = await sheet?.values.column(1, fromRow: 2);
  var keysCount = keys?.length ?? 0;
  var locales = await sheet?.values.row(1, fromColumn: 3);
  var localesCount = locales?.length ?? 0;

  for (var i = 0; i < localesCount; i++) {
    var values = await sheet?.values.column(i + 3, fromRow: 2);
    var locale = locales?[i];
    var map = {};

    for (var j = 0; j < keysCount; j++) {
      map[keys?[j]] = values?[j];
    }

    File file = File('lib/l10n/app_$locale.arb');

    file.writeAsStringSync(
      json.encode(map),
    );
  }
}
