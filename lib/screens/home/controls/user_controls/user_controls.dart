import 'dart:math';

import 'package:vonette_web/constants/constants.dart';
import 'package:vonette_web/constants/header.dart';
import 'package:flutter/material.dart';
import 'package:vonette_web/screens/home/controls/user_controls/temp_messages.dart';
import 'package:vonette_web/services/database.dart';
import '../counselor_controls/components/search_box.dart';
import 'user_temp_values.dart';

class UserControls extends StatefulWidget {
  const UserControls({Key? key}) : super(key: key);

  @override
  State<UserControls> createState() => _UserControlsState();
}

class _UserControlsState extends State<UserControls> {
  var studentDataList = ValueNotifier([]);
  var view = ValueNotifier('Messages');
  var viewMessages = ValueNotifier('Student List');
  //Color buttonColor = bgColor;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            Header(
              headerName: 'User Controls Dashboard',
            ),
            SizedBox(
              height: defaultPadding,
            ),
            Row(
              children: [
                ValueListenableBuilder(
                    valueListenable: viewMessages,
                    builder: (context, value, child) {
                      if (value == 'Student List') {
                        return Expanded(
                          flex: 4,
                          child: Container(
                            //height: 500,
                            padding: EdgeInsets.all(defaultPadding),
                            decoration: BoxDecoration(
                              color: fgColor,
                              borderRadius: const BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      'Users',
                                      style:
                                          Theme.of(context).textTheme.subtitle1,
                                    ),
                                    Spacer(),
                                    Expanded(
                                      child: SearchBox(
                                        hintText: 'Search Users',
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: defaultPadding),
                                  child: SizedBox(
                                    width: double.infinity,
                                    height: MediaQuery.of(context).size.height -
                                        220,
                                    // TODO: Lock column headings
                                    child: SingleChildScrollView(
                                      child: DataTable(
                                        showCheckboxColumn: false,
                                        columns: [
                                          DataColumn(label: Text('Name')),
                                          DataColumn(
                                              label: Text('Email Address')),
                                          DataColumn(label: Text('Grade')),
                                        ],
                                        rows: List.generate(
                                          tempUserVals.length,
                                          (index) {
                                            return studentRow(
                                                tempUserVals[index]);
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      } else {
                        return Expanded(
                          flex: 4,
                          child: Container(
                            padding: EdgeInsets.all(defaultPadding),
                            decoration: BoxDecoration(
                              color: fgColor,
                              borderRadius: const BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        viewMessages.value = 'Student List';
                                      },
                                      icon: Icon(Icons.arrow_back),
                                    ),
                                    Text(
                                      'Rushil Arumugam',
                                      style:
                                          Theme.of(context).textTheme.subtitle1,
                                    ),
                                    Spacer(),
                                    Expanded(
                                      child: SearchBox(
                                        hintText: 'Search Messages',
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 540,
                                  child: Padding(
                                    padding: EdgeInsets.all(defaultPadding),
                                    child: ListView.builder(
                                      reverse: true,
                                      itemCount: tempMessages.length,
                                      itemBuilder: (context, index) {
                                        return tempMessages[index];
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }
                    }),
                SizedBox(
                  width: defaultPadding,
                ),
                ValueListenableBuilder(
                  valueListenable: studentDataList,
                  builder: (context, List value, child) {
                    if (value.length == 0) {
                      //return Container();
                      return Expanded(
                        flex: 2,
                        child: Container(
                          decoration: BoxDecoration(
                            color: fgColor,
                            borderRadius: const BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(defaultPadding),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Student Information',
                                      style:
                                          Theme.of(context).textTheme.headline5,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height - 176,
                                  child: Center(
                                    child: Text(
                                      'Select a student to view their data',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineSmall,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    } else {
                      return Expanded(
                        flex: 2,
                        child: Container(
                          decoration: BoxDecoration(
                            color: fgColor,
                            borderRadius: const BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(defaultPadding),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Student Information',
                                      style:
                                          Theme.of(context).textTheme.headline5,
                                    ),
                                    threeDotVertMenu(
                                      ['Edit', 'Email', 'Disable', 'Kick'],
                                    )
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: defaultPadding / 2,
                                  ),
                                  child: Row(
                                    children: [
                                      CircleAvatar(
                                        radius: 50,
                                        backgroundColor: Colors.transparent,
                                        child: Image.asset(
                                          'assets/images/profile_pic1.png',
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: defaultPadding,
                                        ),
                                        child: ValueListenableBuilder(
                                          valueListenable: studentDataList,
                                          builder:
                                              (context, List value, child) {
                                            return Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  value[0],
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .headline5,
                                                ),
                                                Text(
                                                  value[1],
                                                  style:
                                                      TextStyle(fontSize: 16),
                                                ),
                                                Text(
                                                  'Grade ${value[2]}',
                                                  style:
                                                      TextStyle(fontSize: 16),
                                                ),
                                              ],
                                            );
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: defaultPadding / 2),
                                  child: Row(
                                    children: [
                                      // TODO: figure out why inksplash is not working
                                      viewButton('Messages'),
                                      SizedBox(width: defaultPadding),
                                      viewButton('Clubs'),
                                      SizedBox(width: defaultPadding),
                                      Expanded(
                                          child: SearchBox(hintText: 'Search'))
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height - 376,
                                  width: double.infinity,
                                  child: SingleChildScrollView(
                                    child: ValueListenableBuilder(
                                      valueListenable: studentDataList,
                                      builder: (context, List value, child) {
                                        List dataList = value;
                                        // if (dataList.length == 0) {
                                        //   return SizedBox(
                                        //     height: MediaQuery.of(context)
                                        //             .size
                                        //             .height -
                                        //         400,
                                        //     child: Center(
                                        //       child: Text(
                                        //         'Select a user to view their data',
                                        //         style: TextStyle(
                                        //             color: Colors.grey,
                                        //             fontSize: 20),
                                        //       ),
                                        //     ),
                                        //   );
                                        // }
                                        return ValueListenableBuilder(
                                          valueListenable: view,
                                          builder: (context, value, child) {
                                            int idx;
                                            if (value == 'Messages') {
                                              // 3 is for messages in the tempUservals
                                              idx = 3;
                                            } else {
                                              // 4 is for clubs in the tempUserVals
                                              idx = 4;
                                            }
                                            return ListView.builder(
                                              scrollDirection: Axis.vertical,
                                              shrinkWrap: true,
                                              itemCount: dataList[idx].length,
                                              itemBuilder: (context, index) {
                                                return messageClubTile(
                                                    dataList[idx][index]);
                                              },
                                            );
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    }
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  PopupMenuButton<String> threeDotVertMenu(List<String> actions) {
    return PopupMenuButton(
      icon: Icon(
        Icons.more_vert,
        //color: iconColor,
      ),
      shape: OutlineInputBorder(
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
        borderSide: BorderSide.none,
      ),
      tooltip: 'Actions',
      itemBuilder: (BuildContext context) {
        return actions.map((String choice) {
          return PopupMenuItem<String>(
            child: Text(choice),
            value: choice,
            onTap: () {
              viewMessages.value = 'View Messages';
            },
          );
        }).toList();
      },
    );
  }

  InkWell viewButton(String text) {
    return InkWell(
      onTap: () {
        setState(() {
          view.value = text;
        });
      },
      borderRadius: const BorderRadius.all(
        Radius.circular(10),
      ),
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: defaultPadding / 1.5, vertical: defaultPadding / 1.5),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
          color: view.value == text ? Colors.blueGrey[100] : Colors.transparent,
          border: view.value == text
              ? Border.all(color: Colors.blue, width: 2)
              : Border.all(color: Colors.grey),
        ),
        child: Text(text),
      ),
    );
  }

  Material messageClubTile(String name) {
    // To get the hover color and inksplash to show
    return Material(
      type: MaterialType.transparency,
      child: ListTile(
          onTap: () {},
          leading: Icon(
            Icons.person,
            //color: iconColor,
          ),
          title: Text(
            name,
            style: Theme.of(context).textTheme.headline6,
          ),
          trailing: ValueListenableBuilder(
            valueListenable: view,
            builder: (context, value, child) {
              if (value == 'Messages') {
                return threeDotVertMenu(
                    ['View Messages', 'Delete Conversation']);
              } else {
                return threeDotVertMenu(['View Messages', 'Remove from Club']);
              }
            },
          )),
    );
  }

  DataRow studentRow(List studentData) {
    //MaterialStateProperty<Color> color = Color(Colors.transparent)
    return DataRow(
      onSelectChanged: (bool? selected) {
        setState(() {
          studentDataList.value = studentData;
        });
      },
      cells: [
        DataCell(
          Row(
            children: [
              Image.asset(
                'assets/images/profile_pic.png',
                height: 30,
                width: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
                child: Text(studentData[0]),
              )
            ],
          ),
        ),
        DataCell(Text(studentData[1])),
        DataCell(Text('Grade ${studentData[2]}')),
      ],
    );
  }
}
