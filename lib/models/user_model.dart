class UserModel {
  String? name = "";
  String? email = "";
  String? nation = "";
  String? phone = "";
  String? avatar = "";
  DateTime? birthDate = DateTime.now();
  String? level = "";

  UserModel(
      {this.name,
      this.email,
      this.nation,
      this.phone,
      this.avatar,
      this.birthDate,
      this.level});
}