// import 'package:flutter/material.dart';
// import '/main.dart';
// import '/theme/theme_cubit.dart';

// class TestingHomeScreen extends StatefulWidget {
//   const TestingHomeScreen({super.key});

//   @override
//   State<TestingHomeScreen> createState() => _TestingHomeScreenState();
// }

// class _TestingHomeScreenState extends State<TestingHomeScreen> {
//   bool checkedValue = false;
//   int selectedOption = 1;

//   @override
//   Widget build(BuildContext context) {

//     return Scaffold(
//         appBar: AppBar(
//           title: Text("Theme1"),
//         ),
//         // body:
//         //   Column(children: [
//         //     Text(
//         //       "lightThemeColor",
//         //       style: TextStyle(color: light1),
//         //     ),
//         //     Text(
//         //       "Dark",
//         //       style: TextStyle(color: dark1),
//         //     )
//         // ]));
 
//         body: Container(
//           color: Theme.of(context).colorScheme.background,
//           padding: EdgeInsets.all(20),
//           child: Column(
//             children: [
//               Switch(
//                 value: checkedValue,
//                 onChanged: (value) {
//                   checkedValue = value!;
//                   context.read<ThemeCubit>().toggleTheme();
//                 },
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   Radio(
//                     value: 1,
//                     groupValue: selectedOption,
//                     onChanged: (value) {
//                       setState(() {
//                         selectedOption = value!;
//                       });
//                     },
//                   ),
//                   Radio(
//                     value: 2,
//                     groupValue: selectedOption,
//                     onChanged: (value) {
//                       setState(() {
//                         selectedOption = value!;
//                       });
//                     },
//                   ),
//                 ],
//               ),
//               Checkbox(
//                 value: checkedValue,
//                 onChanged: (value) {
//                   checkedValue = value!;
//                   // setState(() {});
//                   context.read<ThemeCubit>().toggleTheme();
//                 },
//               ),
//               Text(
//                 "Welcome ",style: Theme.of(context).textTheme.bodySmall,
//               ),
//               TextField(
//                 decoration: InputDecoration(
//                     label: Text("Enter your Name"),
//                     border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(20)),
//                     prefixIcon: Icon(Icons.person)),
//               ),
//             ],
//           ),
//         ));
 
//   }
// }
