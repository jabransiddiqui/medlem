extension AppString on String {
  String get png => 'lib/assets/images/$this.png';
  String get jpg => 'lib/assets/images/$this.jpg';
  String get svg => 'lib/assets/icons/$this.svg';
  String get lotties => 'lib/assets/lotties/$this.json';
  String get capitalize => "${this[0].toUpperCase()}${substring(1)}";
}
