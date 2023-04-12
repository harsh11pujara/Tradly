import 'package:flutter/material.dart';
import 'package:tradly/utilities/themes.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: CustomColor.backgroundColor,
      child: Stack(
        children: [
          Container(
            height: 230,
            color: CustomColor.mainColor,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      height: 64,
                      width: 64,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: CustomColor.secondaryColor, width: 1),
                          color: CustomColor.mainColor),
                      child: const Center(
                          child: Text(
                        "T",
                        style: TextStyle(color: CustomColor.secondaryColor, fontSize: 34, fontWeight: FontWeight.w600),
                      )),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Column(
                      children: [
                        Text(
                          "Tradly Team",
                          style: CustomTheme.lightTheme().textTheme.titleLarge!.copyWith(fontSize: 14),
                        ),
                        Text(
                          "+1 9998887776",
                          style: CustomTheme.lightTheme()
                              .textTheme
                              .titleSmall!
                              .copyWith(fontSize: 12, color: CustomColor.secondaryColor.withOpacity(0.8)),
                        ),
                        Text("info@tradly.co",
                            style: CustomTheme.lightTheme()
                                .textTheme
                                .titleSmall!
                                .copyWith(fontSize: 12, color: CustomColor.secondaryColor.withOpacity(0.8)))
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 28,
                ),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
                  decoration: BoxDecoration(
                    color: CustomColor.secondaryColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          margin: const EdgeInsets.symmetric(vertical: 12),
                          child: Text("Edit Profile", style: CustomTheme.lightTheme().textTheme.labelSmall)),
                      const Divider(
                        color: CustomColor.dividerColor,
                        height: 1,
                        thickness: 0.5,
                      ),
                      Container(
                          margin: const EdgeInsets.symmetric(vertical: 12),
                          child: Text("Language & Currency", style: CustomTheme.lightTheme().textTheme.labelSmall)),
                      const Divider(
                        color: CustomColor.dividerColor,
                        height: 1,
                        thickness: 0.5,
                      ),
                      Container(
                          margin: const EdgeInsets.symmetric(vertical: 12),
                          child: Text("Feedback", style: CustomTheme.lightTheme().textTheme.labelSmall)),
                      const Divider(
                        color: CustomColor.dividerColor,
                        height: 1,
                        thickness: 0.5,
                      ),
                      Container(
                          margin: const EdgeInsets.symmetric(vertical: 12),
                          child: Text("Refer a Friend", style: CustomTheme.lightTheme().textTheme.labelSmall)),
                      const Divider(
                        color: CustomColor.dividerColor,
                        height: 1,
                        thickness: 0.5,
                      ),
                      Container(
                          margin: const EdgeInsets.symmetric(vertical: 12),
                          child: Text("Terms & Conditions", style: CustomTheme.lightTheme().textTheme.labelSmall)),
                      const Divider(
                        color: CustomColor.dividerColor,
                        height: 1,
                        thickness: 0.5,
                      ),
                      Container(
                          margin: const EdgeInsets.symmetric(vertical: 12),
                          child: Text("Logout",
                              style: CustomTheme.lightTheme().textTheme.labelSmall!.copyWith(color: CustomColor.mainColor))),
                      const SizedBox(
                        height: 10,
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
