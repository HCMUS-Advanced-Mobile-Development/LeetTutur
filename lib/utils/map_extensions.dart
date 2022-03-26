import 'dart:convert';

extension MapExtensions on Map {
  String beautifyJson() {
    return const JsonEncoder.withIndent("  ").convert(this);
  }
}
