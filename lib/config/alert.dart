import 'package:flutter/material.dart';
class alert extends StatelessWidget {
  const alert({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
  AlertDialog setAlert (String title,String content,String Nafclass,BuildContext context){
    return AlertDialog(
      title: Text(title),
      content: Text(content),
      icon: ElevatedButton(
        child: Text('موافق'),
         onPressed: () {
           Navigator.of(context).pushNamed( Nafclass);
         },
      ),
      iconColor: Colors.brown,
      shape: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25)
      ),
    );
  }
}

