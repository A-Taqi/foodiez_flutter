class Time {
  final int value;
  final String type;

  Time({
    required this.value,
    required this.type,
  });

  factory Time.fromJson(Map<String, dynamic> json) {
    return Time(
      value: int.parse(json['value'] ?? '0'),
      type: json['type'] ?? 'minutes',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'value': value,
      'type': type,
    };
  }
}