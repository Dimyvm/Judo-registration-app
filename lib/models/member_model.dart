class Member {

final String surName;
final String name;
final DateTime birthDate;
final String group;

const Member({required this.surName, required this.name, required this.birthDate, required this.group});

  factory Member.fromJson(Map<String, dynamic> json) {
    return Member(
      surName: json['Voornaam'] as String,
      name: json['Achternaam'] as String,
      birthDate: DateTime.parse(json['Geboortedatum']),
      group: json['Groep'] as String,
    );
  }

   Map toJson() => {
      
        'surName': surName,
        'name': name,
        'birthDate': birthDate.toString(),
        'group': group,
  };

}