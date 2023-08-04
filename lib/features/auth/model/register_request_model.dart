class RegisterRequestModel{
  RegisterRequestModel({
    required this.email,
    required this.phonenumber,
    required this.password,
    required this.firstName_ar,
    required this.firstName_en,
    required this.lastName_ar,
    required this.lastName_en,
    required this.country_id,
    required this.gender_id,
    required this.featured
});
  String phonenumber;
  String password;
  String country_id;
  String email;
  String gender_id;
  String featured;
  String firstName_ar;
  String firstName_en;
  String lastName_ar;
  String lastName_en;
}