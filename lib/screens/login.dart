// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//
// import '../constants.dart';
// import 'input_page.dart';
//
// class LoginPage extends StatefulWidget {
//   @override
//   _LoginPageState createState() => _LoginPageState();
// }
//
// class _LoginPageState extends State<LoginPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text(''),
//         ),
//         body: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: <Widget>[
//             CircleAvatar(
//               radius: 70.0,
//               backgroundImage: AssetImage('images/bmi.png'),
//             ),
//             SizedBox(
//               height: 20.0,
//               width: 150.0,
//             ),
//             Text(
//               'Login To Your Account',
//               style: TextStyle(
//                 fontFamily: 'SourceSansPro',
//                 color: Colors.teal.shade100,
//                 fontSize: 20.0,
//                 letterSpacing: 2.5,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             SizedBox(
//               height: 20.0,
//               width: 150.0,
//               child: Divider(
//                 color: Colors.teal.shade100,
//               ),
//             ),
//             Card(
//                 margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
//                 child: ListTile(
//                   leading: Icon(
//                     Icons.email,
//                     color: Colors.teal.shade100,
//                   ),
//                   title: TextField(
//                     style: TextStyle(
//                         color: Colors.teal.shade100,
//                         fontSize: 20.0,
//                         decoration: TextDecoration.none),
//                     decoration: getDecoration("Enter Email"),
//                     onChanged: (value) {
//                       print(value);
//                     },
//                   ),
//                 )),
//             Card(
//                 margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
//                 child: ListTile(
//                     leading: Icon(
//                       Icons.lock,
//                       color: Colors.teal.shade100,
//                     ),
//                     title: TextField(
//                       style: TextStyle(
//                           color: Colors.teal.shade100,
//                           fontSize: 20.0,
//                           decoration: TextDecoration.none),
//                       decoration: getDecoration("Enter Password"),
//                       onChanged: (value) {
//                         print(value);
//                       },
//                     ))),
//             RoundActionButton(
//                 icon: FontAwesomeIcons.signInAlt,
//                 onPress: () {
//                   Navigator.pushReplacement(context,
//                       MaterialPageRoute(builder: (context) {
//                     return InputPage();
//                   }));
//                 }),
//           ],
//         ));
//   }
// }
//
// // class RoundActionButton extends StatelessWidget {
// //   final IconData icon;
// //   final Function onPress;
// //
// //   RoundActionButton({this.icon, this.onPress});
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return RawMaterialButton(
// //       child: Icon(icon),
// //       onPressed: onPress,
// //       constraints: BoxConstraints.tightFor(width: 56.0, height: 56.0),
// //       //elevation: 6.0,
// //       elevation: 0.0,
// //       // shape: CircleBorder(),
// //       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
// //       fillColor: Color(0xFF4C4F5E),
// //     );
// //   }
// // }
