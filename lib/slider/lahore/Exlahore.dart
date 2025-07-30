import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Exlahore extends StatelessWidget {
  const Exlahore({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CarouselSlider(
              options: CarouselOptions(
                height: 250,
                autoPlay: true,
                enlargeCenterPage: true,
                viewportFraction: 1.0,
              ),
              items: [
                _buildImage('assets/images/8A31698D-6DAE-415B-9D9A-E93E0585E5B2.jpeg'),
                _buildImage('assets/images/5-2.jpg'),
                _buildImage('assets/images/27.jpg'),
              ],
            ),
            Padding(
              padding:const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                 Container(
                   child: Text(
                     'Haveli Restaurant',
                     style: TextStyle(
                       fontSize: 20,
                       fontWeight: FontWeight.bold,
                     ),
                   ),
                 ),
                  Container(
                    child: Text(
                      'Punjab',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Container(
                    child: Text(
                      'Accessbility Via',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold
                      ),
                    ),

                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text(
                            'Car',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ),
                        color: Colors.grey,
                      ),
                      SizedBox(width: 8), // Adjust the width of the space between containers
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text(
                            'Bus',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ),
                        color: Colors.grey,
                      ),
                      SizedBox(width: 8), // Adjust the width of the space between containers
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text(
                            'Bike',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ),
                        color: Colors.grey,
                      ),
                      SizedBox(width: 8), // Adjust the width of the space between containers
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text(
                            'Rikshaw',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ),
                        color: Colors.grey,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Container(
                    child: Text(
                      'About',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  Container(
                    child: Text(
                      'Haveli Restaurant is located in the heart of Lahore Old City, near the historic Badshahi Mosque and Lahore Fort. The restaurant is housed in a beautifully restored Haveli, a traditional mansion that dates back to the Mughal era. The interior is richly decorated with traditional furnishings, giving a royal feel. The rooftop seating is particularly popular, offering panoramic views of the old city.',
                      style: TextStyle(
                          fontSize: 15,

                      ),
                    ),
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
                    height: 60, // Adjust the height as needed
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
