import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart'; // Import CarouselSlider package
import 'package:t_m/slider/lahore/Exlahore.dart';

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

class Lahore extends StatefulWidget {
  const Lahore({Key? key}) : super(key: key);
  @override
  State<Lahore> createState() => _LahoreState();
}

class _LahoreState extends State<Lahore> {
  List<ImageInfo> _holidayImages = [
    ImageInfo(
        path:
            'assets/images/desktop-wallpaper-view-of-badshahi-mosque-of-haveli-restaurant-lahore.jpg', name: '', destinationPage: const Exlahore()),
    ImageInfo(
        path: 'assets/images/5-2.jpg', name: '', destinationPage: const Exlahore()),
    ImageInfo(
        path: 'assets/images/27.jpg', name: '', destinationPage: const Exlahore()),
  ];

  List<ImageInfo> _hunzaImages = [
    ImageInfo(
        path: 'assets/images/exterior.jpg', name: '', destinationPage: const Exlahore()),
    ImageInfo(
        path: 'assets/images/Arcadian Cafe Packages Mall 124.jpg', name: '', destinationPage: const Exlahore()),
    ImageInfo(
        path: 'assets/images/BaiZeChicken Arcadian Cafe Packages Mall.jpg', name: '', destinationPage: const Exlahore()),
  ];
  List<ImageInfo> _vistImages = [
    ImageInfo(
        path: 'assets/images/we-make-the-best-beef  Pablos.jpg', name: '', destinationPage: const Exlahore()),
    ImageInfo(
        path: 'assets/images/Pablos.jpg', name: '', destinationPage: const Exlahore()),
    ImageInfo(
        path: 'assets/images/best-burgers-in-lahore  Pablos.jpg', name: '', destinationPage: const Exlahore()),
  ];
  List<ImageInfo> _exploreImages = [
    ImageInfo(
        path: 'assets/images/download qabali tribes.jpeg', name: '', destinationPage: const Exlahore()),
    ImageInfo(
        path: 'assets/images/love-the-place-love-mutton qabali tribes.jpg', name: '', destinationPage: const Exlahore()),
    ImageInfo(
        path: 'assets/images/img-2481-largejpgqabali tribes.jpg', name: '', destinationPage: const Exlahore()),
  ];
  List<ImageInfo> _lahoreImages = [
    ImageInfo(
        path: 'assets/images/caption Veera 5.jpg', name: '', destinationPage: const Exlahore()),
    ImageInfo(
        path: 'assets/images/garlic-pepper-prawns Veera 5.jpg', name: '', destinationPage: const Exlahore()),
    ImageInfo(
        path: 'assets/images/tom-yum-goong Veera 5.jpg', name: '', destinationPage: const Exlahore()),
  ];
  Widget _buildImageContainer(BuildContext context, String imagePath,
      String name, Widget destinationPage) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ImageViewPage(
                    imagePath: imagePath,
                    name: name,
                    destinationPage: destinationPage)));
      },
      child: Container(
        margin: const EdgeInsets.all(9),
        height: 250,
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
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CarouselSlider.builder(
                    itemCount: _lahoreImages.length,
                    options: CarouselOptions(
                      height: 250,
                      autoPlay: true,
                      aspectRatio: 16 / 9,
                      autoPlayInterval: const Duration(seconds: 3),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enableInfiniteScroll: true,
                      viewportFraction: 1, // Use full width
                      onPageChanged: (index, reason) {
                        setState(() {
                          // Handle page change
                        });
                      },
                    ),
                    itemBuilder:
                        (BuildContext context, int index, int realIndex) {
                      final imageInfo = _lahoreImages[index];
                      return _buildImageContainer(context, imageInfo.path,
                          imageInfo.name, imageInfo.destinationPage);
                    },
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 14),
                    child: Text(
                      'Veera 5',
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
                      'Price Range (pkr 1300--5000)',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 14),
                    child: Text(
                      'Popular For',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w900,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(3.0),
                          child: Text(
                            "Thai noodles--Green curry--Crispy chicken ",
                          ),
                        ),
                        SizedBox(
                          height:
                          18.0, // Add a fixed vertical space of 16.0 logical pixels
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    color: Colors.grey, // Specify the color of the divider line
                    height: 1.0, // Specify the height of the divider line
                  ),
                  CarouselSlider.builder(
                    itemCount: _holidayImages.length,
                    options: CarouselOptions(
                      height: 250,
                      // autoPlay: true,
                      aspectRatio: 16 / 9,
                      autoPlayInterval: const Duration(seconds: 3),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enableInfiniteScroll: true,
                      viewportFraction: 1, // Use full width
                      onPageChanged: (index, reason) {
                        setState(() {
                          // Handle page change
                        });
                      },
                    ),
                    itemBuilder:
                        (BuildContext context, int index, int realIndex) {
                      final imageInfo = _holidayImages[index];
                      return _buildImageContainer(context, imageInfo.path,
                          imageInfo.name, imageInfo.destinationPage);
                    },
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 14),
                    child: Text(
                      'Haveli Restaurant',
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
                      'Price Range (pkr 350--3000)',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 14),
                    child: Text(
                      'Popular For',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w900,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Column(
                      children: [
                        Container(
                            padding: const EdgeInsets.all(3.0),
                            child: Text(
                              "Biryani--Nihari--Seekh Kebabs--Karahi--Sajji",
                            ),
                        ),
                        SizedBox(
                          height:
                              18.0, // Add a fixed vertical space of 16.0 logical pixels
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    color: Colors.grey, // Specify the color of the divider line
                    height: 1.0, // Specify the height of the divider line
                  ),

                  CarouselSlider.builder(
                    itemCount: _vistImages.length,
                    options: CarouselOptions(
                      height: 250,
                      // autoPlay: true,
                      aspectRatio: 16 / 9,
                      autoPlayInterval: const Duration(seconds: 3),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enableInfiniteScroll: true,
                      viewportFraction: 1, // Use full width
                      onPageChanged: (index, reason) {
                        setState(() {
                          // Handle page change
                        });
                      },
                    ),
                    itemBuilder:
                        (BuildContext context, int index, int realIndex) {
                      final imageInfo = _vistImages[index];
                      return _buildImageContainer(context, imageInfo.path,
                          imageInfo.name, imageInfo.destinationPage);
                    },
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 14),
                    child: Text(
                      ' Pablos',
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
                      'Price Range (pkr 500--2000)',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 14),
                    child: Text(
                      'Popular For',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w900,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(3.0),
                          child: Text(
                            "Daddy of All Burgers--Molten Lava Burger--Al Pablitos--Loaded Fries",
                          ),
                        ),
                        SizedBox(
                          height:
                          18.0, // Add a fixed vertical space of 16.0 logical pixels
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    color: Colors.grey, // Specify the color of the divider line
                    height: 1.0, // Specify the height of the divider line
                  ),

                  CarouselSlider.builder(
                    itemCount: _exploreImages.length,
                    options: CarouselOptions(
                      height: 250,
                      // autoPlay: true,
                      aspectRatio: 16 / 9,
                      autoPlayInterval: const Duration(seconds: 3),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enableInfiniteScroll: true,
                      viewportFraction: 1, // Use full width
                      onPageChanged: (index, reason) {
                        setState(() {
                          // Handle page change
                        });
                      },
                    ),
                    itemBuilder:
                        (BuildContext context, int index, int realIndex) {
                      final imageInfo = _exploreImages[index];
                      return _buildImageContainer(context, imageInfo.path,
                          imageInfo.name, imageInfo.destinationPage);
                    },
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 14),
                    child: Text(
                      'Qabail Tribes',
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
                      'Price Range (pkr 1000--5000)',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 14),
                    child: Text(
                      'Popular For',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w900,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(3.0),
                          child: Text(
                            "Dumba Karahi--Chapli Kabab--Mutton Rosh--Chicken Sajji",
                          ),
                        ),
                        SizedBox(
                          height:
                          18.0, // Add a fixed vertical space of 16.0 logical pixels
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    color: Colors.grey, // Specify the color of the divider line
                    height: 1.0, // Specify the height of the divider line
                  ),
                  CarouselSlider.builder(
                    itemCount: _hunzaImages.length,
                    options: CarouselOptions(
                      height: 250,
                      autoPlay: true,
                      aspectRatio: 16 / 9,
                      autoPlayInterval: const Duration(seconds: 3),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enableInfiniteScroll: true,
                      viewportFraction: 1, // Use full width
                      onPageChanged: (index, reason) {
                        setState(() {
                          // Handle page change
                        });
                      },
                    ),
                    itemBuilder:
                        (BuildContext context, int index, int realIndex) {
                      final imageInfo = _hunzaImages[index];
                      return _buildImageContainer(context, imageInfo.path,
                          imageInfo.name, imageInfo.destinationPage);
                    },
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 14),
                    child: Text(
                      'Arcadian Cafe ',
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
                      'Price Range (pkr 500-2500)',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 14),
                    child: Text(
                      'Popular For',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w900,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 14),
                    child: Column(
                      children: [
                      Container(
                            child: Text(
                              "Asian fusion--Continental--French-Italian",
                            ),
                        ),
                        SizedBox(
                          height:
                          18.0, // Add a fixed vertical space of 16.0 logical pixels
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    color: Colors.grey, // Specify the color of the divider line
                    height: 1.0, // Specify the height of the divider line
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ImageViewPage extends StatelessWidget {
  final String imagePath;
  final String name;
  final Widget destinationPage;

  const ImageViewPage(
      {Key? key,
      required this.imagePath,
      required this.name,
      required this.destinationPage})
      : super(key: key);

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
