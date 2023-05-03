import 'package:flutter/material.dart';
import 'package:tawwon/cloud_functions/database.dart';
import 'package:tawwon/widgets/organization_card.dart';

class SelectOrganizationView extends StatelessWidget {
  const SelectOrganizationView({super.key, required this.type});
  final String type;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 218, 229, 234),
      appBar: AppBar(
        title: const Text('اختيار منظمة'),
      ),
      body: Center(
        child: FutureBuilder(
            future: DatabaseService().getOrganizations(),
            builder: (context, snapshot) {
              if (snapshot.connectionState != ConnectionState.done) {
                return const CircularProgressIndicator();
              } else if (snapshot.data == null) {
                return const Center(child: Text('لا يوجد منظمات'));
              } else {
                return Column(
                  children: snapshot.data!.map((e) => OrganizationCard(organization: e)).toList(),
                );
              }
            }),
      ),
    );
  }

  Future getOrganizations() async {
    Future.delayed(const Duration(seconds: 2), () {}).then((value) => null);
  }
}
