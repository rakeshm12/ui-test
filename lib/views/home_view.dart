import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_test/controller/data_controller.dart';
import 'package:ui_test/controller/login_controller.dart';
import 'package:ui_test/models/data_model.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);
  final loginController = Get.put(LoginController());
  final dataController = Get.put(DataController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            actions: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ActionChip(
                  avatar: const Icon(
                    Icons.logout,
                    color: Colors.black,
                  ),
                  label: Text('Logout', style: Get.textTheme.button),
                  onPressed: () => loginController.googleLogout(),
                ),
              ),
            ],
          ),
          body: FutureBuilder<DataModel>(
            future: dataController.fetchData(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data!.data.length,
                    itemBuilder: (context, index) {
                      final result = snapshot.data!.data[index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Name : ' + result.name,
                                    style: Get.textTheme.subtitle2),
                                const SizedBox(height: 10),
                                Text('Email : ' + result.email,
                                    style: Get.textTheme.subtitle2),
                                const SizedBox(height: 10),
                                Text('Phone Number : ' + result.phoneNumber,
                                    style: Get.textTheme.subtitle2),
                              ],
                            ),
                          ),
                        ),
                      );
                    });
              }
              return const Center(child: CircularProgressIndicator());
            },
          )),
    );
  }
}
