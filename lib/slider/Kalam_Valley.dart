import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Kalam extends StatelessWidget {
  const Kalam({Key? key}) : super(key: key);

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
              ),
              items: [
                _buildImage('assets/images/download 1.1.jpeg'),
                _buildImage('assets/images/download 1.6.jpeg'),
                _buildImage('assets/images/images 1.7.jpeg'),
                _buildImage('assets/images/images 1.8.jpeg'),
                _buildImage('assets/images/download 1.2.jpeg'),
                _buildImage('assets/images/download 1.3.jpeg'),
                _buildImage('assets/images/download 1.4.jpeg'),
              ],
            ),
            Padding(
              padding:const EdgeInsets.all(18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                 const Text(
                    'Kalam is a valley located at a distance of 99 kilometers from Mingora in the northern upper reaches of Swat valley along the bank of Swat River in Khyber Pakhtunkhwa province of Pakistan. The area has become a popular tourist attraction, known for its mountains, forests, and lakes.',
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
