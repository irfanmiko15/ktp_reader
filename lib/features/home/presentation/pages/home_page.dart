import 'package:flutter/material.dart';
import 'package:testocr/features/profile/presentation/pages/camera_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home Page")),
      body: Container(child: Center(child: InkWell(
        onTap: (){
          Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => CameraPage(
             
            ),
          ),
        );
        },
        child: Text("Camera")),)),
    );
  }
}