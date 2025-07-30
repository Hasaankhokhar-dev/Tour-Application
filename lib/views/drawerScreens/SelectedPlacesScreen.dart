import 'package:flutter/material.dart';
import 'package:t_m/NavigationFile/Explorepk.dart';

class SelectedPlacesScreen extends StatefulWidget {
  @override
  _SelectedPlacesScreenState createState() => _SelectedPlacesScreenState();
}

class _SelectedPlacesScreenState extends State<SelectedPlacesScreen> {
  List<String> selectedPlaces = [
    'Place 1',
    'Place 2'
  ]; // Example list of selected places

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(190, 159, 212, 0.976),
        title: Text('Selected Tours'),
        titleTextStyle: TextStyle(fontWeight: FontWeight.bold),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Text(
            //   'Your Selected Places',
            //   style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            // ),
            // SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Explore()),);
                  },
                  child: Text('Add New Place'),
                ),
              ],
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: selectedPlaces.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(selectedPlaces[index]),
                    subtitle: Text('Description of ${selectedPlaces[index]}'),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [

                        IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {
                            _showDeleteConfirmationDialog(index);
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  // Function to show delete confirmation dialog
  Future<void> _showDeleteConfirmationDialog(int index) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Delete Place'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                    'Are you sure you want to delete ${selectedPlaces[index]}?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Delete'),
              onPressed: () {
                setState(() {
                  selectedPlaces.removeAt(index);
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
