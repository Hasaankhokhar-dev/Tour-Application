// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:t_m/views/drawerScreens/CustomerSupportScreen.dart';
import 'package:t_m/views/drawerScreens/profile.dart';
import 'package:t_m/views/drawerScreens/Settings.dart';
import 'package:t_m/Authentication/signInScreen.dart';
import 'SelectedPlacesScreen.dart';

@override
class Navigation extends StatelessWidget {
  const Navigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        backgroundColor: const Color.fromARGB(255, 35, 36, 34),
        child: Column(
          children: [
            const DrawerHeader(
              child: Icon(
                Icons.favorite_outline,
                color: Colors.white,
                size: 20,
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home, color: Colors.white),
              title: const Text(
                "Profile",
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProfileScreen(),
                  ),
                );
              },
            ),

// slected places

            ListTile(
              leading: const Icon(Icons.place, color: Colors.white),
              title: const Text(
                "Selected Places",
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SelectedPlacesScreen(),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.settings,
                color: Colors.white,
              ),
              title: const Text(
                "Settings",
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SettingsScreen(),
                  ),
                );
              },
            ),

            ListTile(
              leading: const Icon(
                Icons.support_agent,
                color: Colors.white,
              ),
              title: const Text(
                'Customer Support',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CustomerSupportScreen(),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.logout,
                color: Colors.white,
              ),
              title: const Text(
                "Logout",
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                // Handle logout action
                // You may want to clear user credentials or perform any necessary logout logic
                // For simplicity, let's navigate to the login page
                Navigator.pop(context); // Close the drawer
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        const LoginScreen(), // Replace with your login page
                  ),
                );
              },
            ),
          ],
        ),
      ),
      // body: SingleChildScrollView(
      //   child: Padding(
      //     padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 10.0),
      //     child: Column(
      //       children: [
      //         Container(
      //           alignment: Alignment.center,
      //           child: const Text(
      //             "Lime Light areas of Pakistan",
      //             style: TextStyle(
      //               fontSize: 20,
      //               fontWeight: FontWeight.bold,
      //             ),
      //           ),
      //         ),
      //         // Horizontal Images using ListView
      //         const SizedBox(height: 10),
      //         // Container(
      //         //   height: 250.0, // Adjust height as needed
      //         //   child: ListView.builder(
      //         //     itemCount: 4,
      //         //     scrollDirection: Axis.horizontal,
      //         //     itemExtent: 250.0 +
      //         //         2.0, // Adjust the total space for each item (width + padding)
      //         //     itemBuilder: (context, index) {
      //         //       List<Tour> horizontalTours = [
      //         //         Tour(
      //         //           name: "Kunhar River Naran",
      //         //           imagepath: "assets/images/Naranbridge.jpg",
      //         //           description: "",
      //         //         ),
      //
      //         Container(
      //           height: 250.0, // Adjust height as needed
      //           child: ListView.builder(
      //             itemCount: 4,
      //             scrollDirection: Axis.horizontal,
      //             itemExtent:
      //                 180.0, // Adjust the total space for each item (width + padding)
      //             itemBuilder: (context, index) {
      //               List<Tour> horizontalTours = [
      //                 Tour(
      //                   name: "Kunhar River Naran",
      //                   imagepath: "assets/images/Naranbridge.jpg",
      //                   description: "",
      //                 ),
      //
      //                 // Tour(
      //                 //   name: "Kachura Lake Skardu",
      //                 //   imagepath: "assets/images/Kachura Lake Skardu.jpg",
      //                 //   description: "",
      //                 // ),
      //                 // Tour(
      //                 //   name: "Malam Jabba Ski Resort",
      //                 //   imagepath: "assets/images/Malam Jabba Ski Resort.jpg",
      //                 //   description: "",
      //                 // ),
      //                 // Tour(
      //                 //   name: "Monument Islambad",
      //                 //   imagepath: "assets/images/Monument.jpg",
      //                 //   description: "",
      //                 // ),
      //                 Tour(
      //                   name: "Kachura Lake Skardu",
      //                   imagepath: "assets/images/Kachura Lake Skardu.jpg",
      //                   description: "",
      //                 ),
      //                 Tour(
      //                   name: "Malam Jabba Ski Resort",
      //                   imagepath: "assets/images/Malam Jabba Ski Resort.jpg",
      //                   description: "",
      //                 ),
      //                 Tour(
      //                   name: "Monument Islambad",
      //                   imagepath: "assets/images/Monument.jpg",
      //                   description: "",
      //                 ),
      //               ];
      //
      //               return imagess(
      //                 tour: horizontalTours[index],
      //                 width: 250.0,
      //                 height: 250.0,
      //               );
      //             },
      //           ),
      //         ),
      //
      //         const SizedBox(
      //             height:
      //                 10), // Add some spacing between horizontal and vertical images
      //         Container(
      //           alignment: Alignment.centerLeft,
      //           margin: const EdgeInsets.symmetric(horizontal: 35.0),
      //           padding: EdgeInsets.only(left: 10),
      //           child: const Text(
      //             "Karachi",
      //             style: TextStyle(
      //               fontSize: 20,
      //               fontWeight: FontWeight.bold,
      //             ),
      //           ),
      //         ),
      //         const SizedBox(height: 10),
      //         SingleChildScrollView(
      //           scrollDirection: Axis.horizontal,
      //           child: Row(
      //             mainAxisAlignment: MainAxisAlignment.start,
      //             // crossAxisAlignment: CrossAxisAlignment.start,
      //             // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //             children: [
      //               GestureDetector(
      //                 onTap: () {
      //                   Navigator.push(
      //                     context,
      //                     MaterialPageRoute(
      //                       builder: (context) => Quaiddeatils(
      //                         tour: Tour(
      //                           name: "Mazar-e-Quaid Karachi ",
      //                           imagepath: "assets/images/mazareQuid.jpg",
      //                           description:
      //                               "Mazar-e-Quaid (Urdu: مزارِ قائد), also known as Jinnah Mausoleum or the National Mausoleum  is the final resting place of Muhammad Ali Jinnah the founder of Pakistan. Designed in a 1960s modernist style it was completed in 1971, and is an iconic symbol of Karachi as well as one of the most popular tourist sites in the city. The mausoleum complex also contains the tomb of Jinnah's sister, Māder-e Millat(Mother of the Nation) Fatima Jinnah, as well as those of Liaquat Ali Khan and Nurul Amin, the first and eighth Prime Ministers of Pakistan respectively.",
      //                         ),
      //                       ),
      //                     ),
      //                   );
      //                 },
      //                 child: imagess(
      //                   tour: Tour(
      //                     name: "Mazar-e-Quaid",
      //                     imagepath: "assets/images/mazareQuid.jpg",
      //                     description: "",
      //                   ),
      //                   width: 180.0, // Adjust the width as needed
      //                   height: 200.0,
      //                 ),
      //               ),
      //               GestureDetector(
      //                 onTap: () {
      //                   Navigator.push(
      //                     context,
      //                     MaterialPageRoute(
      //                       builder: (context) => Quaiddeatils(
      //                         tour: Tour(
      //                           name: "Clifton Beach",
      //                           imagepath:
      //                               "assets/images/cliftonBeachKarachi.jpg",
      //                           description:
      //                               "Clifton Beach, also known as Sea View, is a beach in Karachi, Sindh, Pakistan and is located on the Arabian Sea. It stretches from Karachi to Ormara (Balochistan).The beach is very popular in Pakistan. It is open 24/7 for the general public.",
      //                         ),
      //                       ),
      //                     ),
      //                   );
      //                 },
      //                 child: imagess(
      //                   tour: Tour(
      //                     name: "Clifton Beach",
      //                     imagepath: "assets/images/cliftonBeachKarachi.jpg",
      //                     description: "",
      //                   ),
      //                   width: 180.0, // Adjust the width as needed
      //                   height: 200.0,
      //                 ),
      //               ),
      //             ],
      //           ),
      //         ),
      //         const SizedBox(height: 10),
      //
      //         Container(
      //           alignment: Alignment.centerLeft,
      //           margin: const EdgeInsets.symmetric(horizontal: 35.0),
      //           padding: EdgeInsets.only(left: 10),
      //           child: const Text(
      //             "Lahore",
      //             style: TextStyle(
      //               fontSize: 20,
      //               fontWeight: FontWeight.bold,
      //             ),
      //           ),
      //         ),
      //         const SizedBox(height: 10),
      //         SingleChildScrollView(
      //           scrollDirection: Axis.horizontal,
      //           child: Row(
      //             mainAxisAlignment: MainAxisAlignment.start,
      //             crossAxisAlignment: CrossAxisAlignment.start,
      //             children: [
      //               GestureDetector(
      //                 onTap: () {
      //                   Navigator.push(
      //                     context,
      //                     MaterialPageRoute(
      //                       builder: (context) => Quaiddeatils(
      //                         tour: Tour(
      //                           name: "Minar-e-Pakistan",
      //                           imagepath: "assets/images/Minar-e-Pakistan.jpg",
      //                           description:
      //                               "Minar-e-Pakistan (Urdu: مینارِ پاکستان, literally Tower of Pakistan) is a tower located in Lahore, Punjab, Pakistan. The tower was built between 1960 and 1968 on the site where the All-India Muslim League passed the Lahore Resolution (which was later called the Pakistan Resolution) on 23 March 1940 - the first official call for a separate and independent homeland for the Muslims of British India, as espoused by the two-nation theory. The resolution eventually helped lead to the creation of Pakistan in 1947.The tower is located in the middle of an urban park, called the Greater Iqbal Park.",
      //                         ),
      //                       ),
      //                     ),
      //                   );
      //                 },
      //                 child: imagess(
      //                   tour: Tour(
      //                     name: "Mazar-e-Pakistan",
      //                     imagepath: "assets/images/Minar-e-Pakistan.jpg",
      //                     description: "",
      //                   ),
      //                   width: 180.0, // Adjust the width as needed
      //                   height: 200.0,
      //                 ),
      //               ),
      //               SizedBox(width: 10),
      //               GestureDetector(
      //                 onTap: () {
      //                   Navigator.push(
      //                     context,
      //                     MaterialPageRoute(
      //                       builder: (context) => Quaiddeatils(
      //                         tour: Tour(
      //                           name: "Badshahi Mosque",
      //                           imagepath: "assets/images/Badshahi Mosque.jpg",
      //                           description:
      //                               "The Badshahi Mosque (Urdu: بادشاہی مسجد) is an iconic Mughal-era congregational mosque in Lahore, Punjab, Pakistan. The mosque is located opposite of Lahore Fort in the outskirts of the Walled City and is widely considered to be one of Lahore's most iconic landmarks.The Badshahi Mosque was built between 1671 and 1673 and by the Mughal emperor Aurangzeb. The mosque is an important example of Mughal architecture, with an exterior that is decorated with carved red sandstone with marble inlay. It remains the largest mosque of the Mughal-era, and is the third-largest mosque in Pakistan",
      //                         ),
      //                       ),
      //                     ),
      //                   );
      //                 },
      //                 child: imagess(
      //                   tour: Tour(
      //                     name: "Badshahi Mosque",
      //                     imagepath: "assets/images/Badshahi Mosque.jpg",
      //                     description: "",
      //                   ),
      //                   width: 180.0, // Adjust the width as needed
      //                   height: 200.0,
      //                 ),
      //               ),
      //             ],
      //           ),
      //         ),
      //         const SizedBox(height: 10),
      //
      //         // Vertical Images - Islamabad
      //         Container(
      //           alignment: Alignment.centerLeft,
      //           margin: const EdgeInsets.symmetric(horizontal: 35.0),
      //           padding: EdgeInsets.only(left: 10),
      //           child: const Text(
      //             "Islamabad",
      //             style: TextStyle(
      //               fontSize: 20,
      //               fontWeight: FontWeight.bold,
      //             ),
      //           ),
      //         ),
      //         const SizedBox(height: 10),
      //         SingleChildScrollView(
      //           scrollDirection: Axis.horizontal,
      //           child: Row(
      //             children: [
      //               GestureDetector(
      //                 onTap: () {
      //                   Navigator.push(
      //                     context,
      //                     MaterialPageRoute(
      //                       builder: (context) => Quaiddeatils(
      //                         tour: Tour(
      //                           name: "Faisal Mosque",
      //                           imagepath: "assets/images/Faisal Mosque.jpg",
      //                           description:
      //                               "The Faisal Mosque (Urdu: فیصل مسجد, romanized: faisal masjid) is the national mosque of Pakistan, located in the capital city, Islamabad. It is the fifth-largest mosque in the world, the largest mosque outside the Middle East, and the largest within South Asia, located on the foothills of Margalla Hills in Islamabad. It is named after the late King Faisal of Saudi Arabia. The mosque features a contemporary design consisting of eight sides of concrete shell and is inspired by the design of a typical Bedouin tent.A major tourist attraction in Pakistan, the mosque is a contemporary and influential piece of Islamic architecture.Construction of the mosque began in 1976 after a 28 million grant from Saudi King Faisal, whose name the mosque bears. The unconventional design by Turkish architect Vedat Dalokay was selected after an international competition.[7][4] Without a typical dome, the mosque is shaped like a Bedouin tent, surrounded by four 260 feet (79 m) tall minarets. The design features eight-sided shell shaped sloping roofs forming a triangular worship hall which can hold 10,000 worshippers.",
      //                         ),
      //                       ),
      //                     ),
      //                   );
      //                 },
      //                 child: imagess(
      //                   tour: Tour(
      //                     name: "Faisal Mosque",
      //                     imagepath: "assets/images/Faisal Mosque.jpg",
      //                     description: "",
      //                   ),
      //                   width: 180.0, // Adjust the width as needed
      //                   height: 200.0,
      //                 ),
      //               ),
      //               SizedBox(width: 10),
      //               GestureDetector(
      //                 onTap: () {
      //                   Navigator.push(
      //                     context,
      //                     MaterialPageRoute(
      //                       builder: (context) => Quaiddeatils(
      //                         tour: Tour(
      //                           name: "Margala Hills",
      //                           imagepath: "assets/images/Margala Hills.jpg",
      //                           description:
      //                               "The Margalla Hills (Urdu: مارگلہ پہاڑیاں) are a hill range within the Margalla Hills National Park on the northern edge of Islamabad Capital Territory, Pakistan, just south of Haripur District, Khyber Pakhtunkhwa. They are part of the Himalayan foothills. The Margalla range has an area of 12,605 hectares. It is a range with many valleys as well as high mountains.",
      //                         ),
      //                       ),
      //                     ),
      //                   );
      //                 },
      //                 child: imagess(
      //                   tour: Tour(
      //                     name: "Margala Hills",
      //                     imagepath: "assets/images/Margala Hills.jpg",
      //                     description: "",
      //                   ),
      //                   width: 180.0, // Adjust the width as needed
      //                   height: 200.0,
      //                 ),
      //               ),
      //             ],
      //           ),
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}
