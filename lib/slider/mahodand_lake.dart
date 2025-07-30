import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Mahodand extends StatelessWidget {
  const Mahodand({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CarouselSlider(
              options: CarouselOptions(
                height: 200,
                autoPlay: true,
                enlargeCenterPage: true,
                viewportFraction: 1.0,
              ),
              items: [
                _buildImage('assets/images/2.8.jpeg'),
                _buildImage('assets/images/2.44.jpeg'),
                _buildImage('assets/images/2.6.jpeg'),
                _buildImage('assets/images/2.4.jpeg'),
                _buildImage('assets/images/2.3.jpeg'),
                _buildImage('assets/images/2.2.jpeg'),
                _buildImage('assets/images/2.1.jpeg'),
              ],
            ),
            Padding(
              padding:const EdgeInsets.all(18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Its famous for its surreal natural beauty. In the center of this land there is a lake like no other called, Mahodand Lake. It is one of the most beautiful lakes in the world. The lake is located 40kms from Kalam, in the Ushu Valley, which is a part of the infamous Hindu-Kush mountain Range.',
                    style: TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(


                    onPressed: () {
                      // Handle button press
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.white,
                    ),
                    child: const Text('Go to Map'),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'How would you rate your experence?',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  RatingBar.builder(
                    initialRating: 0,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: false,
                    itemCount: 5,
                    itemPadding:const EdgeInsets.symmetric(horizontal: 4.0),
                    itemBuilder: (context, _) => const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) {
                      // Handle star rating
                    },
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 70, // Adjust the height as needed
                    child: TextFormField(
                      decoration:const InputDecoration(
                        hintText: 'Write your review here...',
                        border: OutlineInputBorder(),
                      ),
                      maxLines: 3,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        // Handle submit button press
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.white,
                      ),
                      child: const Text('Submit'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImage(String imagePath) {
    return Container(
      margin:const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: Colors.black,
          width: 2,
        ),
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
