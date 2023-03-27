class Fund_detail{
  final String fun_id;
  final String? email_user;
  final String nameuser;
  final String provFile;
  final double price_Fun;
  final String describe;
  Fund_detail({ required this.fun_id,required this.email_user,required this.nameuser, required this.provFile, required this.price_Fun, required this.describe,});
  Map<String, dynamic> toMap() {
    return {
      'fun_id':this.fun_id,
      'email_user':this.email_user,
      'nameuser':this.nameuser,
      'provFile':this.provFile,
      'price_Fun':this.price_Fun,
      'describe':this.describe

    };
  }
}