import 'package:flutter/material.dart';
import 'dart:async';

class PlannerScreen extends StatefulWidget {
  @override
  _PlannerScreenState createState() => _PlannerScreenState();
}

class _PlannerScreenState extends State<PlannerScreen> {
  final TextEditingController _budgetController = TextEditingController();
  List<Map<String, dynamic>> _tours = [];
  bool _isLoading = false;

  final List<Map<String, dynamic>> _allTours = [
    {'name': 'Tour 1', 'price': 100},
    {'name': 'Tour 2', 'price': 200},
    {'name': 'Tour 3', 'price': 300},
    {'name': 'Tour 4', 'price': 400},
  ];

  void _searchTours() {
    final budget = double.tryParse(_budgetController.text);
    if (budget != null) {
      setState(() {
        _isLoading = true;
      });

      Timer(Duration(seconds: 2), () {
        setState(() {
          _tours = _allTours.where((tour) => tour['price'] <= budget).toList();
          _isLoading = false;
        });
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please enter a valid budget.'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Planner'),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Enter your ',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Center(
              child: Container(
                width: 300,
                child: TextField(
                  controller: _budgetController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter budget',
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: _searchTours,
                child: Text('Search Tours'),
              ),
            ),
            SizedBox(height: 20),
            if (_isLoading)
              CircularProgressIndicator()
            else if (_tours.isEmpty)
              Text('No tours available for the given budget.')
            else
              Expanded(
                child: ListView.builder(
                  itemCount: _tours.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        title: Text(_tours[index]['name']),
                        subtitle: Text('Price: \$${_tours[index]['price']}'),
                      ),
                    );
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}
