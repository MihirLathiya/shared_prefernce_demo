import 'package:flutter/material.dart';
import 'package:shared_prefernce_demo/api_services/AllUserService.dart';
import 'package:shared_prefernce_demo/api_services/SignUp_services.dart';
import 'package:shared_prefernce_demo/api_services/delete_user_repo.dart';
import 'package:shared_prefernce_demo/model/res/AllUserData.dart';

class UserData extends StatefulWidget {
  const UserData({Key? key}) : super(key: key);

  @override
  State<UserData> createState() => _UserDataState();
}

class _UserDataState extends State<UserData> {
  @override
  void initState() {
    //DeleteUserRepo.deleteUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
          future: AllUserService.info(),
          builder:
              (BuildContext context, AsyncSnapshot<AllUserModel?> snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return ListView.builder(
                itemCount: snapshot.data!.users!.length,
                itemBuilder: (context, index) {
                  final userList = snapshot.data!.users![index];
                  return Dismissible(
                    key: ValueKey(userList.username),
                    onDismissed: (direction) {
                      var reqBody = {"username": userList.username};

                      DeleteUserRepo.deleteUser(reqBody: reqBody);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        height: size.height * 0.2,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: const Color(0xffffffff),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0x29000000),
                              offset: Offset(0, 3),
                              blurRadius: 6,
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 20, right: 10),
                              child: Container(
                                height: size.height * 0.12,
                                width: size.width * 0.25,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(7.0),
                                    color: const Color(0xffffffff),
                                    border: Border.all(
                                        width: 1.0,
                                        color: const Color(0xff707070)),
                                    image: DecorationImage(
                                        image: userList.avatar == null ||
                                                userList.avatar == ""
                                            ? NetworkImage(
                                                'https://cambodiaict.net/wp-content/uploads/2019/12/computer-icons-user-profile-google-account-photos-icon-account.jpg')
                                            : NetworkImage(
                                                '${userList.avatar}'),
                                        fit: BoxFit.fill)),
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  userList.firstName != null
                                      ? "${userList.firstName}"
                                      : "",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 16),
                                ),
                                Text(
                                  userList.username != null
                                      ? "${userList.username}"
                                      : "",
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 12),
                                )
                              ],
                            ),
                            Spacer(),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
