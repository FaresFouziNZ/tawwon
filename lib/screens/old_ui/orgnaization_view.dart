// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:tawwon/cloud_functions/Auth.dart';
// import 'package:tawwon/cloud_functions/database.dart';
// import 'package:tawwon/models/local_user.dart';
// import 'package:tawwon/screens/old_ui/homePage.dart';
// import 'package:tawwon/screens/old_ui/welcome.dart';
// import 'package:tawwon/widgets/old_ui/type_square.dart';

// import 'requests_view.dart';

// class OrganizationPage extends StatelessWidget {
//   const OrganizationPage({
//     super.key,
//   });
//   // final OrganizationPageDetails organizationPageDetails;

//   @override
//   Widget build(BuildContext context) {
//     final user = Provider.of<LocalUser?>(context);
//     Auth auth = Auth();
//     return Scaffold(
//       backgroundColor: const Color(0xFFDAE5EA),
//       appBar: AppBar(
//         title: const Text('صفحة المنظمة'),
//         centerTitle: true,
//         elevation: 0,
//         shape: const RoundedRectangleBorder(
//           borderRadius: BorderRadius.vertical(
//             bottom: Radius.circular(20),
//           ),
//         ),
//         actions: [
//           IconButton(
//               onPressed: () {
//                 auth.signOut();
//                 Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const WelcomeView()));
//               },
//               icon: const Icon(Icons.logout)),
//         ],
//       ),
//       body: FutureBuilder(
//           future: DatabaseService.instance!.getOrganizationDetails(uid: user?.uid),
//           builder: (context, snapshot) {
//             if (snapshot.connectionState == ConnectionState.waiting) {
//               return const Center(child: CircularProgressIndicator());
//             } else {
//               return Center(
//                 child: Column(
//                   // mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.only(top: 15, right: 15),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.end,
//                         children: [
//                           Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
//                             Text(snapshot.data!.name as String,
//                                 style: const TextStyle(fontSize: 30, fontFamily: 'ReadexPro')),
//                             Padding(
//                               padding: const EdgeInsets.symmetric(vertical: 6),
//                               child: Container(
//                                   width: MediaQuery.of(context).size.width * 0.5,
//                                   height: MediaQuery.of(context).size.height * 0.075,
//                                   decoration: const BoxDecoration(
//                                     color: Color(0xFFEFF0F3),
//                                     borderRadius: BorderRadius.all(
//                                       Radius.circular(10),
//                                     ),
//                                   ),
//                                   child: Row(
//                                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                                     children: [
//                                       const Icon(Icons.watch_later_outlined),
//                                       Text(
//                                         snapshot.data!.time as String,
//                                         style: const TextStyle(
//                                           fontSize: 16,
//                                           fontFamily: 'ReadexPro',
//                                         ),
//                                       ),
//                                     ],
//                                   )),
//                             ),
//                             Row(
//                               children: const [TypeSquare()],
//                             ),
//                           ]),
//                           Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: Column(
//                               children: [
//                                 Container(
//                                   width: 135,
//                                   height: 135,
//                                   decoration: const BoxDecoration(
//                                     color: Colors.white,
//                                     borderRadius: BorderRadius.all(
//                                       Radius.circular(20),
//                                     ),
//                                   ),
//                                   child: Image(
//                                       image: NetworkImage(snapshot.data!.logoUrl as String == ''
//                                           ? 'https://cdn.shopify.com/s/files/1/0525/9585/1443/products/mUSSLcWigyy8MTX_800x.jpg?v=1679405599'
//                                           : snapshot.data!.logoUrl as String)),
//                                 ),
//                                 Visibility(
//                                     visible: false,
//                                     child: ElevatedButton(onPressed: () {}, child: const Text('رفع طلب')))
//                               ],
//                             ),
//                           )
//                         ],
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(top: 20),
//                       child: Row(children: const [
//                         Expanded(
//                             child: Divider(
//                           color: Colors.black,
//                           thickness: 1,
//                           indent: 10,
//                           endIndent: 5,
//                         )),
//                         Text("وصف"),
//                         Expanded(
//                             child: Divider(
//                           color: Colors.black,
//                           thickness: 1,
//                           indent: 5,
//                           endIndent: 10,
//                         )),
//                       ]),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Container(
//                         width: MediaQuery.of(context).size.width * 0.9,
//                         height: MediaQuery.of(context).size.height * 0.2,
//                         decoration: const BoxDecoration(
//                           color: Color(0xFFEFF0F3),
//                           borderRadius: BorderRadius.all(
//                             Radius.circular(10),
//                           ),
//                         ),
//                         child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
//                           Directionality(
//                             textDirection: TextDirection.rtl,
//                             child: Padding(
//                               padding: const EdgeInsets.all(8.0),
//                               child: Text(
//                                 snapshot.data!.description as String,
//                                 style: const TextStyle(fontSize: 14, fontFamily: 'ReadexPro'),
//                               ),
//                             ),
//                           ),
//                         ]),
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(top: 20),
//                       child: Row(children: const <Widget>[
//                         Expanded(
//                             child: Divider(
//                           color: Colors.black,
//                           thickness: 1,
//                           indent: 10,
//                           endIndent: 5,
//                         )),
//                         Text("الحملات"),
//                         Expanded(
//                             child: Divider(
//                           color: Colors.black,
//                           thickness: 1,
//                           indent: 5,
//                           endIndent: 10,
//                         )),
//                       ]),
//                     ),
//                   ],
//                 ),
//               );
//             }
//           }),
//       bottomNavigationBar: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Container(
//           width: double.infinity,
//           height: MediaQuery.of(context).size.height * 0.1,
//           decoration: const BoxDecoration(
//             color: Color(0xFF1B2430),
//             borderRadius: BorderRadius.all(
//               Radius.circular(15),
//             ),
//           ),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               IconButton(
//                   onPressed: () {
//                     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomePage()));
//                   },
//                   icon: const Icon(
//                     Icons.home,
//                     color: Colors.white,
//                     size: 35,
//                   )),
//               IconButton(
//                   onPressed: () {
//                     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const RequestsView()));
//                   },
//                   icon: const Icon(
//                     Icons.message,
//                     color: Colors.white,
//                     size: 35,
//                   )),
//               const Icon(
//                 Icons.search,
//                 color: Colors.white,
//                 size: 35,
//               ),
//               const Icon(
//                 Icons.person,
//                 color: Colors.white,
//                 size: 35,
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
