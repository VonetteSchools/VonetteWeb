import 'dart:math';

import 'package:flutter/material.dart';
import 'package:vonette_web/constants/constants.dart';
import 'package:vonette_web/constants/header.dart';
import '../club_controls/components/search_box.dart';
import 'club_temp_values.dart';

class ClubControls extends StatefulWidget {
  const ClubControls({Key? key}) : super(key: key);

  @override
  State<ClubControls> createState() => _ClubControlsState();
}

class _ClubControlsState extends State<ClubControls> {
  var studentDataList = ValueNotifier([]);
  var view = ValueNotifier('Admins');
  //Color buttonColor = bgColor;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            Header(
              headerName: 'Club Controls Dashboard',
            ),
            SizedBox(
              height: defaultPadding,
            ),
            Row(
              children: [
                Expanded(
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
                              'Clubs',
                              style: Theme.of(context).textTheme.subtitle1,
                            ),
                            Spacer(),
                            Expanded(
                              child: SearchBox(
                                hintText: 'Search Clubs',
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: defaultPadding),
                          child: SizedBox(
                            width: double.infinity,
                            height: MediaQuery.of(context).size.height - 220,
                            // TODO: Lock column headings
                            child: SingleChildScrollView(
                              child: DataTable(
                                showCheckboxColumn: false,
                                columns: [
                                  DataColumn(label: Text('Name')),
                                  DataColumn(label: Text('Advisor Email')),
                                  DataColumn(label: Text('Student Lead')),
                                ],
                                rows: List.generate(
                                  tempClubVals.length,
                                  (index) {
                                    return studentRow(tempClubVals[index]);
                                  },
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
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
                                      'Club Information',
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
                                      'Select a club to view its data',
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
                                      'Club Information',
                                      style:
                                          Theme.of(context).textTheme.headline5,
                                    ),
                                    threeDotVertMenu(
                                      ['Edit', 'Email Advisor', 'Delete Club'],
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
                                                  value[2],
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
                                      viewButton('Admins'),
                                      SizedBox(width: defaultPadding),
                                      viewButton('Members'),
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
                                        List? dataList = value;
                                        return ValueListenableBuilder(
                                          valueListenable: view,
                                          builder: (context, value, child) {
                                            int idx;
                                            if (value == 'Admins') {
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
                                                return adminMemberTile(
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
            onTap: () {},
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

  Material adminMemberTile(String name) {
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
              if (value == 'Admins') {
                return threeDotVertMenu(['View Information', 'Remove Admin']);
              } else {
                return threeDotVertMenu(['View Information', 'Remove User']);
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
        DataCell(Text(studentData[2])),
      ],
    );
  }
}
