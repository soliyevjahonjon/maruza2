import 'package:flutter/material.dart';
import 'dart:math';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double a = 0, b = 0, c = 0, discr = 0, root1 = 0, root2 = 0, real = 0, imag = 0;
  bool rootsCalculated = false;
  final formKey = GlobalKey<FormState>();
  TextEditingController t1 = TextEditingController(text: '');
  TextEditingController t2 = TextEditingController(text: '');
  TextEditingController t3 = TextEditingController(text: '');

  doGeneralQuadraticFormula() {
    setState(() {
      if (t1.text.isEmpty || double.tryParse(t1.text) == null || double.parse(t1.text) == 0) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('"a" koeffitsiyent 0 farqli bo\'lishi kerak'),
          ),
        );
        rootsCalculated = false;
        return;
      }

      a = double.parse(t1.text);
      b = double.parse(t2.text);
      c = double.parse(t3.text);
      discr = b * b - 4 * a * c;
      real = -b / (2 * a);
      imag = sqrt(discr.abs()) / (2 * a);

      if (discr > 0) {
        root1 = real + imag;
        root2 = real - imag;
      } else if (discr == 0) {
        root1 = root2 = real;
      } else {
        root1 = real;
        root2 = imag;
      }
      rootsCalculated = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Kvadrat tenglama yechuvchi dastur',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Card(
                color: Colors.teal[600],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: <Widget>[
                      Text(
                        'Kvadrat tenglama ildizlari:',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 10),
                      Text(
                        rootsCalculated
                            ? (discr >= 0 ? '$root1 va $root2' : '$real ± ${imag.abs()}i')
                            : '',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'a: ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.teal,
                    ),
                  ),
                  SizedBox(
                    width: 250,
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'x² ning koeffitsiyenti (m.n: 1)',
                        labelStyle: TextStyle(color: Colors.teal),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.teal),
                        ),
                      ),
                      controller: t1,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'b: ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.teal,
                    ),
                  ),
                  SizedBox(
                    width: 250,
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'x ning koeffitsiyenti (m.n: -9)',
                        labelStyle: TextStyle(color: Colors.teal),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.teal),
                        ),
                      ),
                      controller: t2,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'c: ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.teal,
                    ),
                  ),
                  SizedBox(
                    width: 250,
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: "KONSTAnta (m.n: 20)",
                        labelStyle: TextStyle(color: Colors.teal),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.teal),
                        ),
                      ),
                      controller: t3,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () {
                      doGeneralQuadraticFormula();
                    },
                    child: Text(
                      'HISOBLASH',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Divider(height: 30, color: Colors.teal),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Kvadrat tenglamaning umumiy ko'rinishi",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.teal,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  Text(
                    'ax² + bx + c = 0',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 32,
                      color: Colors.teal,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    'bu yerda a, b, va c haqiqiy sonlar va  a != 0.',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.teal,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      primarySwatch: Colors.teal,
      visualDensity: VisualDensity.adaptivePlatformDensity,
    ),
    home: HomePage(),
  ));
}
