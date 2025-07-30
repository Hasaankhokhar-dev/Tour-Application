import 'package:flutter/material.dart';
import 'package:t_m/Authentication/signInScreen.dart';
import 'package:t_m/slider/Islamabad.dart';
import 'package:t_m/slider/Multan/Multan.dart';
import 'package:t_m/slider/lahore/lahore.dart';
import 'package:t_m/views/drawerScreens/CustomerSupportScreen.dart';
import 'package:t_m/views/drawerScreens/SelectedPlacesScreen.dart';
import 'package:t_m/views/drawerScreens/Settings.dart';
import 'package:t_m/views/drawerScreens/profile.dart';

class ImageInfo {
  final String path;
  final String name;
  final Widget destinationPage;

  ImageInfo({
    required this.path,
    required this.name,
    required this.destinationPage,
  });
}

class Explore extends StatefulWidget {
  const Explore({Key? key}) : super(key: key);

  @override
  State<Explore> createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  TextEditingController _searchController = TextEditingController();
  String _searchText = '';

  List<ImageInfo> _holidayImages = [
    ImageInfo(path: 'assets/images/lahore 1.jpg', name: 'Lahore', destinationPage: const Lahore()),
    ImageInfo(path: 'assets/images/Multan.jpeg', name: 'Multan', destinationPage: const Multan()),
    ImageInfo(path: 'assets/images/Peshawar.jpeg', name: 'Peshawar', destinationPage: const Lahore()),
    ImageInfo(path: 'assets/images/Karachi.jpeg', name: 'Karachi', destinationPage: const Islamabad()),
    ImageInfo(path: 'assets/images/Islamabad.jpeg', name: 'Quetta', destinationPage: const Islamabad()),
  ];

  List<ImageInfo> _hunzaImages = [
    ImageInfo(path: 'assets/images/taxila 1.jpeg', name: 'Taxila', destinationPage: const Islamabad()),
    ImageInfo(path: 'assets/images/Indus Valley Civilization.jpeg', name: 'Indus Valley Civilization', destinationPage: const Lahore()),
    ImageInfo(path: 'assets/images/Chakwal.jpeg', name: 'Chakwal', destinationPage: const Islamabad()),
    ImageInfo(path: 'assets/images/jhelum.jpeg', name: 'Jhelum', destinationPage: const Islamabad()),
    ImageInfo(path: 'assets/images/download.jpeg', name: 'Peshawar', destinationPage: const Islamabad()),
    ImageInfo(path: 'assets/images/Gondrani Cave.jpeg', name: 'Gondrani Cave', destinationPage: const Islamabad()),
    ImageInfo(path: 'assets/images/Kharan.jpeg', name: 'Kharan', destinationPage: const Islamabad()),

  ];
  List<ImageInfo> _skarduImages = [
    ImageInfo(path: 'assets/images/sawat.jpeg', name: 'Sawat', destinationPage: const Islamabad()),
    ImageInfo(path: 'assets/images/Hunza.jpeg', name: 'Hunza', destinationPage: const Lahore()),
    ImageInfo(path: 'assets/images/Sakradu.jpeg', name: 'Sakradu', destinationPage: const Lahore()),
    ImageInfo(path: 'assets/images/Neeslum Valley.jpeg', name: 'Neelum Valley', destinationPage: const Islamabad()),
    ImageInfo(path: 'assets/images/Chitral.jpeg', name: 'Chitral Valley', destinationPage: const Islamabad()),
    ImageInfo(path: 'assets/images/Kalash.jpg', name: 'Kalash Valley', destinationPage: const Islamabad()),
  ];

  List<ImageInfo> _murreeImages = [
    ImageInfo(path: 'assets/images/Naran Valley.jpeg', name: 'Naran Valley', destinationPage: const Islamabad()),
    ImageInfo(path: 'assets/images/Kagan Valley.jpeg', name: 'Kagan Valley', destinationPage: const Islamabad()),
    ImageInfo(path: 'assets/images/Naltar Valley.jpeg', name: 'Naltar Valley', destinationPage: const Lahore()),
    ImageInfo(path: 'assets/images/Azad Kahmir.jpeg', name: 'Azad Kashmir', destinationPage: const Lahore()),
    ImageInfo(path: 'assets/images/vFairy Meadows.jpeg', name: 'Fairy Meadows', destinationPage: const Islamabad()),
    ImageInfo(path: 'assets/images/Ghanche.jpeg', name: 'Ghanche', destinationPage: const Islamabad()),
  ];
  List<ImageInfo> _neelumValleyImages = [
    ImageInfo(path: 'assets/images/Islamabad.jpeg', name: 'Islamabad', destinationPage: const Lahore()),
    ImageInfo(path: 'assets/images/Abbottabad.jpeg', name: 'Murree', destinationPage: const Islamabad()),
    ImageInfo(path: 'assets/images/Kalar Kahar.jpeg', name: 'Kalar Kahar ', destinationPage: const Lahore()),
    ImageInfo(path: 'assets/images/Abbottabad.jpeg', name: 'Abbottabad', destinationPage: const Islamabad()),
  ];
  List<ImageInfo> _lakesImages = [
    ImageInfo(path: 'assets/images/upper-kachura-lake-gilgit.jpg', name: 'Upper Kachura Lake', destinationPage: const Lahore()),
    ImageInfo(path: 'assets/images/Satpara Lake.jpeg', name: 'Satpara Lake', destinationPage: const Islamabad()),
    ImageInfo(path: 'assets/images/Attabad Lake.jpeg', name: 'Attabad Lake', destinationPage: const Lahore()),
    ImageInfo(path: 'assets/images/Saif ul Malook Lake.jpeg', name: 'Rush Lake', destinationPage: const Islamabad()),
    ImageInfo(path: 'assets/images/Saif ul Malook Lake.jpeg', name: 'Saif-ul-Malook Lake', destinationPage: const Islamabad()),
  ];


  Widget _buildImageContainer(BuildContext context, String imagePath, String name, Widget destinationPage) {
    return

      InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => ImageViewPage(imagePath: imagePath, name: name, destinationPage: destinationPage)));
      },
      child: Container(
        margin: const EdgeInsets.all(9),
        height: 150,
        width: 150,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(imagePath),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Colors.black,
            width: 2,
          ),
        ),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            padding: const EdgeInsets.all(8),
            width: double.infinity,
            color: Colors.black.withOpacity(0.3),
            child: Text(
              name,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<ImageInfo> holidayImages = _holidayImages.where((image) => image.name.toLowerCase().contains(_searchText.toLowerCase())).toList();
    List<ImageInfo> hunzaImages = _hunzaImages.where((image) => image.name.toLowerCase().contains(_searchText.toLowerCase())).toList();
    List<ImageInfo> sakradu = _skarduImages.where((image) => image.name.toLowerCase().contains(_searchText.toLowerCase())).toList();
    List<ImageInfo> neelam = _neelumValleyImages.where((image) => image.name.toLowerCase().contains(_searchText.toLowerCase())).toList();
    List<ImageInfo> murree = _murreeImages.where((image) => image.name.toLowerCase().contains(_searchText.toLowerCase())).toList();
    List<ImageInfo> lakes = _lakesImages.where((image) => image.name.toLowerCase().contains(_searchText.toLowerCase())).toList();
    return Scaffold(
        backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size(60, 60),
        child: AppBar(
          backgroundColor: Colors.greenAccent,
          title: const Padding(
            padding: EdgeInsets.only(top: 10),
            child: Center(
              child: Text(
                "Tour Mentor",
                style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold,fontFamily: 'Arial Black' ),
              ),
            ),
          ),
        ),
      ),
      drawer: Drawer(
        backgroundColor: Color.fromARGB(255, 35, 56, 44),
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Container(
              width: 500.0, // Adjust the width as needed
              height: 50.0, // Adjust the height as needed
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0), // Adjust the radius as needed
                border: Border.all(color: Colors.grey), // Optional: border color and width
              ),
              child: TextField(
                controller: _searchController,
                onChanged: (value) {
                  setState(() {
                    _searchText = value;
                  });
                },
                decoration: const InputDecoration(
                  labelText: 'Search',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12.0)), // Same radius as the container
                  ),
                  prefixIcon: Icon(Icons.search, color: Colors.black),
                ),
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (_searchText.isNotEmpty) ...[
                    _buildImageColumn(context, holidayImages),
                    _buildImageColumn(context, hunzaImages),
                    _buildImageColumn(context, neelam),
                    _buildImageColumn(context, murree),
                    _buildImageColumn(context, sakradu),
                    _buildImageColumn(context, lakes),
                  ] else ...[
                    const Padding(
                      padding: EdgeInsets.only(left: 14, top: 10),
                      child: Text(
                        'Hoildays for food lovers',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 14),
                      child: Text(
                        'Check out top dining spots in country',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                          color: Colors.black,
                        ),
                      ),
                    ),

                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          for (var image in _holidayImages) ...[
                            _buildImageContainer(context, image.path, image.name, image.destinationPage),
                          ]
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 14, top: 20),
                      child: Text(
                        'Historical landmarks to visit',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 14),
                      child: Text(
                        'Unveiling Humanity Legacy',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          for (var image in _hunzaImages) ...[
                            _buildImageContainer(context, image.path, image.name, image.destinationPage),
                          ]
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 14 , top: 20),
                      child: Text(
                        'Northen Areas',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 14),
                      child: Text(
                        'Exploring Wonders',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          for (var image in _skarduImages) ...[
                            _buildImageContainer(context, image.path, image.name, image.destinationPage),
                          ]
                        ],
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          for (var image in _murreeImages) ...[
                            _buildImageContainer(context, image.path, image.name, image.destinationPage),
                          ]
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 14 , top: 20 ),
                      child: Text(
                        'Top destination that you also love',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 14),
                      child: Text(
                        'Unveiling Personal Delights',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          for (var image in _neelumValleyImages) ...[
                            _buildImageContainer(context, image.path, image.name, image.destinationPage),
                          ]
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 14 , top: 20),
                      child: Text(
                        'Lakes view',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 14),
                      child: Text(
                        'Finding Harmony in Lakeside Retreats',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          for (var image in _lakesImages) ...[
                            _buildImageContainer(context, image.path, image.name, image.destinationPage),
                          ]
                        ],
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImageColumn(BuildContext context, List<ImageInfo> images) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (var image in images) ...[
          _buildImageContainer(context, image.path, image.name, image.destinationPage),
        ]
      ],
    );
  }
}

class ImageViewPage extends StatelessWidget {
  final String imagePath;
  final String name;
  final Widget destinationPage;

  const ImageViewPage({Key? key, required this.imagePath, required this.name, required this.destinationPage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: destinationPage,
    );
  }
}
