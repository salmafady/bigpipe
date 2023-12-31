import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState  createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List containers = [
    Future.delayed(Duration(seconds: 2), () {return Container(height: 200,
      width: 200,
      margin:EdgeInsetsDirectional.symmetric(horizontal: 100),
      decoration: BoxDecoration(
        color: Colors.orange,
      ),

      child: Center(
        child: Text('Orange',style: TextStyle(
          fontSize: 25,

        )),
      ),
    );}),
    Future.delayed(Duration(seconds: 4), (){return Container(
      height: 200,
      width: 200,
      decoration: BoxDecoration(
        color: Colors.green,
      ),
      margin:EdgeInsetsDirectional.symmetric(horizontal: 100),

      child: Center(
        child: Text('Green',style: TextStyle(
          fontSize: 25,

        )),
      ),
    );}),
    Future.delayed(Duration(seconds: 6), () { return  Container(
        height: 200,
        width: 200,
        decoration: BoxDecoration(
          color: Colors.red,
        ),
        margin:EdgeInsetsDirectional.symmetric(horizontal: 100),

        child: Center(
          child: Text('red',style: TextStyle(
            fontSize: 25,

          )),
        ));}),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        title: Text('Pagelets ',style: TextStyle(
            fontSize: 30,
            color: Colors.orange ,
            fontWeight: FontWeight.bold),),
        backgroundColor: Colors.white,


      ),
      body: ListView.separated(
        itemCount:containers.length,

        itemBuilder: (context, index) {
          return FutureBuilder(
            future: containers[index],
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return snapshot.data as Widget;
              } else {
                return Center(child: SizedBox(height: 20,width: 20,child: CircularProgressIndicator()));
              }
            },
          );
        }, separatorBuilder: (BuildContext context, int index) {
        return SizedBox(height: 20,);
      },
      ),
    );
  }
}