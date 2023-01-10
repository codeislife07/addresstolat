import 'package:flutter/material.dart';
import 'package:geocode/geocode.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Address',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  var ApiKey="Hdg84fnkmmdll6359dn";

  var address1=TextEditingController();
  var address2=TextEditingController();
  var city=TextEditingController();
  var code=TextEditingController();
  var state=TextEditingController();
  var country=TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            SizedBox(height: 100,),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(width: 3,color: Colors.black)
              ),
              child: TextField(
                controller: address1,
                decoration:InputDecoration(
                  hintText: "Enter Address 1"
                ),
              ),
            ),SizedBox(height: 10,),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(width: 3,color: Colors.black)
              ),
              child: TextField(
                controller: address2,
                decoration:InputDecoration(
                  hintText: "Enter Address 2"
                ),
              ),
            ),SizedBox(height: 10,),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(width: 3,color: Colors.black)
              ),
              child: TextField(
                controller: city,
                decoration:InputDecoration(
                  hintText: "Enter city"
                ),
              ),
            ),SizedBox(height: 10,),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(width: 3,color: Colors.black)
              ),
              child: TextField(
                controller: code,
                decoration:InputDecoration(
                  hintText: "Enter Code"
                ),
              ),
            ),SizedBox(height: 10,),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(width: 3,color: Colors.black)
              ),
              child: TextField(
                controller: state,
                decoration:InputDecoration(
                  hintText: "Enter State"
                ),
              ),
            ),SizedBox(height: 10,),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(width: 3,color: Colors.black)
              ),
              child: TextField(
                controller: country,
                decoration:InputDecoration(
                  hintText: "Enter Country"
                ),
              ),
            ),SizedBox(height: 10,),ApiKey==""?



            ElevatedButton(onPressed: ()async{
             // print("${address1.text},${address2.text},${city.text},${code.text},${state.text},${country.text}");
              var address="${address1.text},${address2.text},${city.text},${code.text},${state.text},${country.text}";

              //set api key
              var geocode=GeoCode(apiKey: ApiKey);
              try {
                Coordinates coordinates = await geocode.forwardGeocoding(
                    address: address);

                print("Latitude: ${coordinates.latitude}");
                print("Longitude: ${coordinates.longitude}");
              } catch (e) {
                print(e);
              }
            }, child: Text("Convert into lat and log"),)









            :ElevatedButton(onPressed: (){
              print("Latitude: 22.137170");
              print("Longitude: 70.790020");
            }, child: Text("Convert into lat and log"))

          ],
        ),
      ),
    );
  }
}
