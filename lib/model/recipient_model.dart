class Recipient{
  String name;
  String phoneNumber;
  String relationship;

  Recipient({required this.name, required this.phoneNumber, required this.relationship});

  Recipient.fromJson(Map<String, dynamic> json)
      : name = json["name"],
        phoneNumber = json["phoneNumber"],
        relationship = json["relationship"];

  Map<String, dynamic> toJson() =>{
    "name" : name,
    "phoneNumber" : phoneNumber,
    "relationship" : relationship,
  };


}