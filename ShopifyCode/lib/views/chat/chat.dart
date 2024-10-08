// import 'package:flutter/material.dart';
// import 'package:shopify_code/language/language_manager.dart';
// import 'package:speech_to_text/speech_to_text.dart';

// class ChatApp extends StatefulWidget {
//   const ChatApp({super.key});

//   @override
//   State<ChatApp> createState() => _ChatAppState();
// }

// class _ChatAppState extends State<ChatApp> {
//  SpeechToText speechToText = SpeechToText();
 
// //  String text = " message...";
//   var isListening = false;
//   var micController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           LanguageManager.translations()['chatSupport']!,
//         ),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: Container(
//               // Add your chat messages here
//             ),
//           ),
//           _buildInputBar(),
//         ],
//       ),
//     );
//   }

//  Widget _buildInputBar() {
//     return Container(
//       padding: EdgeInsets.all(8.0),
//       // color: Colors.grey[200],
//       child: Row(
//         children: [
//           GestureDetector( 
//             onTapDown: (details) async {
//               if (!isListening) {
//                 var available = await speechToText.initialize();
//                 if (available) {
//                   setState(() {
//                     isListening = true;
//                     speechToText.listen(
//                       onResult: (result) {
//                         setState(() {
//                           micController.text = result.recognizedWords;
//                         });
//                       },
//                     );
//                   });
//                 }
//               }
//             },
//             onTapUp: (details) {
//               setState(() {
//                 isListening= false;
//               });
//               speechToText.stop();
//             },
//             child: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Icon(isListening ? Icons.mic_none : Icons.mic),
//             )),
//           Expanded(
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 8.0),
//               child: TextField(
//                 controller: micController,
//                 decoration: InputDecoration(
//                   // labelText: text,
//                   hintText: LanguageManager.translations()['chatHint']!,
//                   // border: InputBorder.none,
//                 ),
//               ),
//             ),
//           ),
//           IconButton(
//             icon: Icon(Icons.camera_alt),
//             onPressed: () {
//               // Handle camera button press
//             },
//           ),
//           IconButton(
//             icon: Icon(Icons.send),
//             onPressed: () {
//               // Handle send button press
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }