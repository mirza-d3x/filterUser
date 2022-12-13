import 'package:flutter/material.dart';

class ScreenHome extends StatefulWidget {
  const ScreenHome({Key? key}) : super(key: key);

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  @override
  Widget build(BuildContext context) {
    final mHeight = MediaQuery.of(context).size.height;
    final mWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: mHeight,
          width: mWidth,
          child: Column(
            children: [
              Container(
                height: mHeight * .1,
                padding: EdgeInsets.symmetric(
                  vertical: mHeight * .01,
                  horizontal: mWidth * .03,
                ),
                child: TextField(
                  decoration: InputDecoration(
                    fillColor: Colors.grey.withOpacity(.5),
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.grey.withOpacity(.5),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.grey.withOpacity(.5),
                      ),
                    ),
                    hintText: "Search...",
                    hintStyle: const TextStyle(color: Colors.grey),
                    prefixIcon: const Icon(Icons.search),
                    contentPadding: EdgeInsets.only(top: mHeight * .025),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  color: Colors.amber,
                  child: ListView.builder(
                    itemCount: 5,
                    itemBuilder: (BuildContext context, int index) => Container(
                      height: mHeight * .1,
                      color: Colors.green,
                      margin: EdgeInsets.only(
                        top: index == 0 ? 0 : mHeight * .01,
                      ),
                      child: const ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.blue,
                          radius: 25,
                        ),
                        title: Text('Name'),
                        subtitle: Text('message'),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
