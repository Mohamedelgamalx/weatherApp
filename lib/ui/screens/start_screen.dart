import 'package:flutter/material.dart';
import 'package:weather/ui/screens/home.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.loose,
        children: [
          Positioned.fill(
            child: Image.asset('assets/images/stars.jpg',
              fit: BoxFit.fill,),
          ),
          Padding(
            padding: const EdgeInsets.all(0.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: 350,),
                  const Text('Weather', style: TextStyle(
                    color: Colors.white,
                    fontSize: 70,
                    fontWeight: FontWeight.bold
                  ),),
                  const Text('ForCasts', style: TextStyle(
                      color: Colors.orangeAccent,
                      fontSize: 70,
                      fontWeight: FontWeight.normal
                  ),),
                  const SizedBox(height: 200,),
                  SizedBox(
                    height: 70, width: 250,
                    child: ElevatedButton(onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const Home()));
                    },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black38,
                            side: const BorderSide(color: Colors.blueGrey)
                        ),
                        child: const Text("Get Start", style: TextStyle(
                            color: Colors.orangeAccent,
                            fontSize: 20,
                            fontWeight: FontWeight.bold))
                    ),
                  )],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
