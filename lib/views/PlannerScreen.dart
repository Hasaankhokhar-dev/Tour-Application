// import 'package:flutter/material.dart';

// class Favorites extends StatelessWidget {
//   const Favorites({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Text("Explore Page Content"),
//     );
//   }
// }
import 'package:flutter/material.dart';

class PlannerScreen extends StatefulWidget {
  @override
  _PlannerScreenState createState() => _PlannerScreenState();
}

class _PlannerScreenState extends State<PlannerScreen> {
  final TextEditingController _budgetController = TextEditingController();
  List<Map<String, dynamic>> _tours = []; // List to store tours within budget

  // Sample data for tours (replace with actual data fetching logic)
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
        _tours = _allTours.where((tour) => tour['price'] <= budget).toList();
      });
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Enter your budget:',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _budgetController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter budget',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _searchTours,
              child: Text('Search Tours'),
            ),
            SizedBox(height: 20),
            Expanded(
              child: _tours.isEmpty
                  ? Center(
                      child: Text('No tours available for the given budget.'))
                  : ListView.builder(
                      itemCount: _tours.length,
                      itemBuilder: (context, index) {
                        return Card(
                          child: ListTile(
                            title: Text(_tours[index]['name']),
                            subtitle:
                                Text('Price: \$${_tours[index]['price']}'),
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
