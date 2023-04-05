import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tradly/screens/authentication_screen/login_screen.dart';
import 'package:tradly/utilities/themes.dart';
import 'package:tradly/utilities/widgets.dart';

class StartUpInfo extends StatefulWidget {
  const StartUpInfo({Key? key}) : super(key: key);

  @override
  State<StartUpInfo> createState() => _StartUpInfoState();
}

class _StartUpInfoState extends State<StartUpInfo> {
  int index = 0;
  bool updateIndex = true;
  List<String> infoImages = ["assets/images/infoScreen1.svg", "assets/images/infoScreen2.svg", "assets/images/infoScreen3.svg"];
  List<String> descriptionText = [
    "Empowering Artisans, Farmers & Micro Business",
    "Connecting NGOs, Social Enterprises with Communities",
    " Donate, Invest & Support infrastructure projects"
  ];

  @override
  Widget build(BuildContext context) {
    bool updateIndex = true;

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: CustomColor.mainColor,
      body: Stack(
        children: [
          Positioned(bottom: 0, child: Container(color: Colors.white, height: 400, width: width)),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 130,
              ),
              Container(
                width: 307,
                height: 334,
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(color: CustomColor.secondaryColor, borderRadius: BorderRadius.circular(10)),
                child: Dismissible(
                  key: UniqueKey(),
                  dismissThresholds: const {DismissDirection.horizontal : 0.6},

                  onUpdate: (details) {
                    if(details.reached == true && updateIndex == true){
                      setState(() {
                        if(details.direction == DismissDirection.endToStart&& index<2){
                          index = index + 1;
                          updateIndex = false;
                          print("plus $index");
                        }
                        if(details.direction == DismissDirection.startToEnd && index>0){
                          index = index - 1;
                          updateIndex = false;
                          print("minus $index");
                        }
                      });
                    }
                  },
                  child: SvgPicture.asset(
                    infoImages[index],
                    height: 243,
                    width: 285,
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                  margin: const EdgeInsets.symmetric(horizontal: 25),
                  child: Text(
                    descriptionText[index],
                    softWrap: true,
                    style: CustomTheme.lightTheme().textTheme.bodyMedium,
                    textAlign: TextAlign.center,
                  )),
              const SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 6,
                    backgroundColor: CustomColor.mainColor.withOpacity(index == 0 ? 1 : 0.4),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  CircleAvatar(
                    radius: 6,
                    backgroundColor: CustomColor.mainColor.withOpacity(index == 1 ? 1 : 0.4),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  CircleAvatar(
                    radius: 6,
                    backgroundColor: CustomColor.mainColor.withOpacity(index == 2 ? 1 : 0.4),
                  ),
                ],
              ),
              const SizedBox(
                height: 45,
              ),
              GestureDetector(
                onTap: () {

                  if (index == 2) {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginScreen(),));
                  }else{
                    setState(() {
                      index++;
                    });
                  }
                },
                child: CustomWidgets()
                    .customSubmitButton(text: index != 2 ? "Next" : "Finish", color: CustomColor.mainColor, textColor: CustomColor.secondaryColor),
              )
            ],
          )
        ],
      ),
    );
  }
}
