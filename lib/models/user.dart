class User {
  int? id;
  String firstName;
  String lastName;
  String birthdate;
  String phoneNumber;
  String email;
  String password;
  String businessName;
  String launchDate;
  double actualBalance;
  String typeOfSelling; // Goods or Services
  String logo;

  User({
    this.id,
    required this.firstName,
    required this.lastName,
    required this.birthdate,
    required this.phoneNumber,
    required this.email,
    required this.password,
    required this.businessName,
    required this.launchDate,
    required this.actualBalance,
    required this.typeOfSelling,
    required this.logo,
  });

  // Convert a User object to a Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'first_name': firstName,
      'last_name': lastName,
      'birthdate': birthdate,
      'phone_number': phoneNumber,
      'email': email,
      'password': password,
      'business_name': businessName,
      'launch_date': launchDate,
      'actual_balance': actualBalance,
      'type_of_selling': typeOfSelling,
      'logo': logo,
    };
  }

  // Convert a Map to a User object
  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'],
      firstName: map['first_name'],
      lastName: map['last_name'],
      birthdate: map['birthdate'],
      phoneNumber: map['phone_number'],
      email: map['email'],
      password: map['password'],
      businessName: map['business_name'],
      launchDate: map['launch_date'],
      actualBalance: map['actual_balance'],
      typeOfSelling: map['type_of_selling'],
      logo: map['logo'],
    );
  }
}
