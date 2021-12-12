class User{
  final int id;
  final String name;
  final String email;
  final String adresse;
  final int age;
  final String phoneNumber;

  User({
    required  this.id,
    required this.name,
  required  this.email
  ,required  this.adresse,
  required  this.age,
  required  this.phoneNumber});

  Map<String,dynamic> toMap() {
    return {
      'id':id,
      'name':name,
      'email':email,
      'adresse':adresse,
      'age':age,
      'phoneNumber':phoneNumber

    };
  }

  @override
  String toString() {
    return 'User(id:$id,name:$name, email:$email, adresse:$adresse, age:$age)';
  }

  
}