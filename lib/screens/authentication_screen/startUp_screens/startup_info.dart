import 'package:flutter/material.dart';
import 'package:tradly/utilities/themes.dart';

class StartUpInfo extends StatefulWidget {
  const StartUpInfo({Key? key}) : super(key: key);

  @override
  State<StartUpInfo> createState() => _StartUpInfoState();
}

class _StartUpInfoState extends State<StartUpInfo> {
  int index = 0;
  List<String> infoImages = ["assets/images/infoScreen1.svg","assets/images/infoScreen2.svg","assets/images/infoScreen3.svg"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.mainColor,
      body: Stack(children: [
        Positioned(bottom: 0,child: Container(color: Colors.white,height: 200,width: double.infinity,)),
        Column(
          children: [
            const SizedBox(height: 180,),
            Image.asset(infoImages[index], width: 307,height: 334,),
            SizedBox(height: 15,),
            Container(margin: EdgeInsets.symmetric(vertical: 15,horizontal: 33),child: Text(" Donate, Invest & Support infrastructure projects",softWrap: true,style: TextStyle(color: CustomColor.mainColor),)),
            Row(children: [
              CircleAvatar(radius: 15,backgroundColor: CustomColor.mainColor.withOpacity(1),),
              CircleAvatar(radius: 15,backgroundColor: CustomColor.mainColor.withOpacity(0.6),),
              CircleAvatar(radius: 15,backgroundColor: CustomColor.mainColor.withOpacity(0.6),),
              SizedBox(height: 50,),
              ElevatedButton(onPressed: (){}, child: Text("Finish"),style: ElevatedButton.styleFrom(backgroundColor: CustomColor.mainColor),)

            ],)
          ],
        )
      ],),
    );
  }
}

