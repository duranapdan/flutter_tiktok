import 'dart:io';
import 'dart:math';

import 'package:deneme/Pages/edit_profile_page.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class KisiPage extends StatefulWidget {
  final String userImg;
  final String userName;

  const KisiPage({Key key, this.userImg, this.userName}) : super(key: key);

  @override
  _KisiPageState createState() => _KisiPageState();
}

class _KisiPageState extends State<KisiPage> {
  double get randHeight => Random().nextInt(100).toDouble();

  List<Widget> _randomChildren;

  List<Widget> _randomHeightWidgets(
      BuildContext context, String userImg, String userName) {
    _randomChildren ??= List.generate(1, (index) {
      final height = randHeight.clamp(
        MediaQuery.of(context).size.height / 2.5,
        MediaQuery.of(context).size.width,
      );
      return Container(
        color: Colors.white,
        height: height,
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(userImg),
                backgroundColor: Colors.transparent,
              ),
            ),
            Text(
              userName,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Text(
                        "0",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.normal),
                      ),
                      Text("Takip Ediyor")
                    ],
                  ),
                  Container(
                    height: 30.0,
                    width: 1.0,
                    color: Colors.black45,
                    margin: const EdgeInsets.only(left: 10.0, right: 10.0),
                  ),
                  Column(
                    children: <Widget>[
                      Text(
                        "0",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.normal),
                      ),
                      Text("Takipçiler")
                    ],
                  ),
                  Container(
                    height: 30.0,
                    width: 1.0,
                    color: Colors.black45,
                    margin: const EdgeInsets.only(left: 10.0, right: 10.0),
                  ),
                  Column(
                    children: <Widget>[
                      Text(
                        "0",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.normal),
                      ),
                      Text("Beğeni")
                    ],
                  ),
                ],
              ),
            ),
            buildFollowButton(
              text: "Edit Profile",
              backgroundcolor: Colors.pinkAccent,
              textColor: Colors.white,
              borderColor: Colors.grey,
            ),
          ],
        ),
      );
    });

    return _randomChildren;
  }

  @override
  Widget build(BuildContext context) {
    String userImg = widget.userImg;
    String userName = widget.userName;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          userName,
          style: TextStyle(color: Colors.black),
        ),
        actions: <Widget>[],
      ),
      body: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          // allows you to build a list of elements that would be scrolled away till the body reached the top
          headerSliverBuilder: (context, _) {
            return [
              SliverList(
                delegate: SliverChildListDelegate(
                  _randomHeightWidgets(context, userImg, userName),
                ),
              ),
            ];
          },
          // You tab view goes here
          body: Column(
            children: <Widget>[
              TabBar(
                tabs: [
                  Tab(
                    icon: Icon(
                      Icons.video_library,
                      size: 25.0,
                    ),
                  ),
                  Tab(
                    icon: Icon(
                      Icons.favorite,
                      size: 25.0,
                    ),
                  ),
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    GridView.count(
                      padding: EdgeInsets.zero,
                      crossAxisCount: 3,
                      children: Colors.primaries.map((color) {
                        return Container(color: color, height: 150.0);
                      }).toList(),
                    ),
                    ListView(
                      padding: EdgeInsets.zero,
                      children: Colors.primaries.map((color) {
                        return Container(color: color, height: 150.0);
                      }).toList(),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container buildFollowButton({
    String text,
    Color backgroundcolor,
    Color textColor,
    Color borderColor,
  }) {
    return Container(
      padding: EdgeInsets.only(top: 2.0),
      child: FlatButton(
          onPressed: () => {},
          child: Container(
            decoration: BoxDecoration(
                color: backgroundcolor,
                border: Border.all(color: borderColor),
                borderRadius: BorderRadius.circular(5.0)),
            alignment: Alignment.center,
            child: Text(text,
                style:
                    TextStyle(color: textColor, fontWeight: FontWeight.bold)),
            width: 150,
            height: 50,
          )),
    );
  }
}
