class User {
  String uid;
  String name;
  String email;
  String username;
  String status;
  int state;
  String portfolioPhoto;

  User({
    this.uid,
    this.name,
    this.email,
    this.username,
    this.status,
    this.state,
    this.portfolioPhoto,
  });

  Map<String, dynamic> toMap(User user) {
    var data = Map<String, dynamic>();
    data["uid"] = user.uid;
    data["name"] = user.name;
    data["email"] = user.email;
    data["username"] = user.username;
    data["status"] = user.status;
    data["state"] = user.state;
    data["portfolioPhoto"] = user.portfolioPhoto;
    return data;
  }
}
