import 'package:final_work/classes/Address.dart';
import 'Company.dart';

class Users {
  final int id;
  final String name;
  final String username;
  final String email;
  final String phone;
  final String website;
  final Company company;
  final Address address;

  const Users({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.phone,
    required this.website,
    required this.company,
    required this.address
  });

  factory Users.fromJson(Map<String, dynamic> json) {
    return Users(
        id: json['id'],
        name: json['name'],
        username: json['username'],
        email: json['email'],
        phone: json['phone'],
        website: json['website'],
        company: Company.fromJson(json['company']),
        address: Address.fromJson(json['address'])
    );
  }



}
