import 'package:camera/detected_page.dart';
import 'package:flutter/material.dart';


class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    // Simulate a 2-second loading delay
    Future.delayed(const Duration(seconds: 6), () {
      setState(() {
        isLoading = false;
      });
      // Navigate to the Welcome page after 2 seconds
      //Navigator.push(context, MaterialPageRoute(builder: (_) => const VehicleInfo()));
      Navigator.push(context, MaterialPageRoute(builder: (_) => DetectedImagePage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xff5966F3), Color(0xff5966F3)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [0.0, 1.0],
            tileMode: TileMode.clamp,
          ),
        ),
        child: Center(
          child: Stack(
            children: [
              Positioned(
                bottom: 250,
                left: 0,
                right: 0,
                child: Column(
                  children: [
                    Image.asset(
                      'assets/new.jpg',
                      width: 400,
                    ),
                  ],
                ),
              ),
              if (isLoading)
                const Positioned(
                  bottom: 75,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
