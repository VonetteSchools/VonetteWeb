import 'package:vonette_web/constants.dart';
import 'package:vonette_web/models/header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  TextEditingController oldPassword = TextEditingController();
  TextEditingController newPassword = TextEditingController();
  bool status = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Header(
              headerName: 'Settings',
            ),
            SizedBox(
              height: defaultPadding,
            ),
            Row(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.transparent,
                  child: Image.asset(
                    '../assets/images/profile_pic1.png',
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: defaultPadding,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Rushil Arumugam',
                          style: Theme.of(context).textTheme.headline5,
                        ),
                        Text(
                          '3452675@apps.nsd.org',
                          style: TextStyle(fontSize: 16),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: defaultPadding / 2),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                            onPressed: () {},
                            child: Text('Edit Profile'),
                          ),
                        ),
                      ],
                    )),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: defaultPadding),
              child: Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: defaultPadding),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        width: MediaQuery.of(context).size.width / 3,
                        color: Colors.transparent,
                        child: ListTile(
                          //tileColor: secondaryColor,
                          onTap: () {},
                          leading: Icon(Icons.add_outlined),
                          title: Text('Add a Club'),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: defaultPadding / 4, bottom: defaultPadding),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        width: MediaQuery.of(context).size.width / 3,
                        color: Colors.transparent,
                        child: ListTile(
                          //tileColor: secondaryColor,
                          onTap: () {},
                          leading: Icon(Icons.add_outlined),
                          title: Text('Report a Bug'),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: defaultPadding),
              child: Text(
                'Password',
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
            // TODO: I think you have to add a Form() here
            Container(
              width: MediaQuery.of(context).size.width / 3,
              child: TextFormField(
                controller: oldPassword,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 1.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        //color: borderColor,
                        width: 1.0,
                      ),
                    ),
                    labelText: 'Old Password',
                    //labelStyle: TextStyle(color: textColor),
                    floatingLabelStyle: TextStyle(color: Colors.blue)),
                obscureText: true,
                validator: (val) => val!.isEmpty ? 'Enter Password' : null,
                onChanged: (val) {
                  // setState(() =>
                  //     //password = val
                  // );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: defaultPadding),
              child: Container(
                width: MediaQuery.of(context).size.width / 3,
                child: TextFormField(
                  controller: newPassword,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 1.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          //color: borderColor,
                          width: 1.0,
                        ),
                      ),
                      labelText: 'New Password',
                      //labelStyle: TextStyle(color: textColor),
                      floatingLabelStyle: TextStyle(color: Colors.blue)),
                  obscureText: true,
                  validator: (val) => val!.isEmpty ? 'Enter Password' : null,
                  onChanged: (val) {
                    // setState(() =>
                    //     //password = val
                    // );
                  },
                ),
              ),
            ),
            // Container(
            //   child: FlutterSwitch(
            //     width: 150.0,
            //     height: 65.0,
            //     valueFontSize: 25.0,
            //     toggleSize: 45.0,
            //     switchBorder: Border.all(color: Colors.grey, width: 1.25),
            //     value: status,
            //     borderRadius: 30.0,
            //     padding: defaultPadding,
            //     showOnOff: true,
            //     toggleColor: status ? Colors.white : Colors.black,
            //     activeColor: Colors.transparent,
            //     inactiveColor: Colors.transparent,
            //     activeText: 'Dark',
            //     // activeTextColor: textColor,
            //     // inactiveTextColor: textColor,
            //     inactiveText: 'Light',
            //     inactiveIcon: Icon(
            //       Icons.sunny,
            //       color: Colors.yellow,
            //     ),
            //     activeIcon: Icon(
            //       Icons.nightlight,
            //       color: Colors.purple,
            //     ),
            //     onToggle: (val) {
            //       setState(() {
            //         status = val;
            //       });
            //       // if (status) {
            //       //   primaryColor = Color(0xFF2697FF);
            //       //   secondaryColor = Color(0xFF2A2D3E);
            //       //   bgColor = Color(0xFF212332);
            //       //   textColor = Colors.white;
            //       //   iconColor = textColor;
            //       //   borderColor = Colors.white24;
            //       // } else {
            //       //   primaryColor = Colors.black;
            //       //   secondaryColor = Colors.white;
            //       //   bgColor = Color(0xFFf7f7f7);
            //       //   textColor = Colors.black;
            //       //   iconColor = Colors.grey;
            //       //   borderColor = Colors.black26;
            //       // }
            //     },
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
