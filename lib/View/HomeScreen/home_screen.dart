import 'package:creativelabs/Model/get_user_details.dart';
import 'package:creativelabs/Repository/Bloc/User/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScreenHome extends StatefulWidget {
  const ScreenHome({Key? key}) : super(key: key);

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  @override
  void initState() {
    BlocProvider.of<UserBloc>(context).add(GetAllUserDetailsEvent());
    super.initState();
  }

  late GetUserDetailsModel getUserDetailsModel;

  @override
  Widget build(BuildContext context) {
    final mHeight = MediaQuery.of(context).size.height;
    final mWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            if (state is UserLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is UserError) {
              return Center(
                child: Text('Error'),
              );
            }
            if (state is UserLoaded) {
              getUserDetailsModel =
                  BlocProvider.of<UserBloc>(context).getUserDetailsModel;
              return Container(
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
                          itemCount: getUserDetailsModel.data!.length,
                          itemBuilder: (BuildContext context, int index) =>
                              Container(
                            height: mHeight * .1,
                            color: Colors.green,
                            margin: EdgeInsets.only(
                              top: index == 0 ? 0 : mHeight * .01,
                            ),
                            child: ListTile(
                              leading: CircleAvatar(
                                backgroundColor: Colors.blue,
                                radius: 25,
                                backgroundImage: NetworkImage(
                                    getUserDetailsModel
                                        .data![index].profilePic!),
                              ),
                              title:
                                  Text(getUserDetailsModel.data![index].name!),
                              subtitle:
                                  Text(getUserDetailsModel.data![index].about!),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
