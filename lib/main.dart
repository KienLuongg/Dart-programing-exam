import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Form Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Map<String, dynamic>> dataList = [];

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _itemController = TextEditingController();
  final TextEditingController _itemNameController = TextEditingController();
  final TextEditingController _quantityController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _currencyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _itemController,
                    decoration: InputDecoration(labelText: 'Item'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter an item';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _itemNameController,
                    decoration: InputDecoration(labelText: 'Item Name'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter an item name';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _quantityController,
                    decoration: InputDecoration(labelText: 'Quantity'),
                    keyboardType: TextInputType.number,
                  ),
                  TextFormField(
                    controller: _priceController,
                    decoration: InputDecoration(labelText: 'Price'),
                    keyboardType: TextInputType.number,
                  ),
                  TextFormField(
                    controller: _currencyController,
                    decoration: InputDecoration(labelText: 'Currency'),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        setState(() {
                          dataList.add({
                            'id': dataList.length + 1,
                            'item': _itemController.text,
                            'item_name': _itemNameController.text,
                            'quantity': _quantityController.text,
                            'price': _priceController.text,
                            'currency': _currencyController.text,
                          });
                          _itemController.clear();
                          _itemNameController.clear();
                          _quantityController.clear();
                          _priceController.clear();
                          _currencyController.clear();
                        });
                      }
                    },
                    child: Text('Add Item'),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: dataList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('ID: ${dataList[index]['id']}'),
                              Text('Item: ${dataList[index]['item']}'),
                              Text(
                                  'Item Name: ${dataList[index]['item_name']}'),
                            ],
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Quantity: ${dataList[index]['quantity']}'),
                            Text('Price: ${dataList[index]['price']}'),
                            Text('Currency: ${dataList[index]['currency']}'),
                          ],
                        ),
                        IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {
                            setState(() {
                              dataList.removeAt(index);
                            });
                          },
                        ),
                      ],
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
