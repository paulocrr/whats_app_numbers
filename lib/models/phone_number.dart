import 'dart:convert';

class PhoneNumber {
  final String id;
  final String number;
  final String description;

  PhoneNumber({
    required this.id,
    required this.number,
    required this.description,
  });

  factory PhoneNumber.fromJson(Map<String, dynamic> jsonData) {
    return PhoneNumber(
      id: jsonData['id'],
      number: jsonData['number'],
      description: jsonData['description'],
    );
  }

  static Map<String, dynamic> toMap(PhoneNumber phoneNumber) => {
        'id': phoneNumber.id,
        'number': phoneNumber.number,
        'description': phoneNumber.description,
      };

  static String listToString(List<PhoneNumber> phoneNumbers) {
    final phoneNumbersMapList = phoneNumbers
        .map<Map<String, dynamic>>((e) => PhoneNumber.toMap(e))
        .toList();

    return json.encode(phoneNumbersMapList);
  }

  static List<PhoneNumber> stringToList(String phoneNumbers) {
    return (json.decode(phoneNumbers) as List<dynamic>)
        .map<PhoneNumber>((item) => PhoneNumber.fromJson(item))
        .toList();
  }
}
