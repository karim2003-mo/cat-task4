import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task3/stdpixels/stdpixel.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  late double _screenwidth;
  late double _screenheight;
  @override
  Widget build(BuildContext context) {
    _screenwidth = MediaQuery.of(context).size.width;
    _screenheight = MediaQuery.of(context).size.height;
    print("width is : $_screenwidth , height is : $_screenheight");
    Pixel _pixel =
        Pixel(screenheight: _screenheight, screenwidth: _screenwidth);
    print(
        "horizontal is : ${_pixel.horizontalpixel()} vertical is : ${_pixel.verticalpixel()}");
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.person,
          size: 22.83 * _pixel.verticalpixel(),
          color: Theme.of(context).iconTheme.color,
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        title: Text(
          'Home Page',
          style: GoogleFonts.poppins(
              color: Theme.of(context).textTheme.bodyLarge!.color,
              fontWeight: FontWeight.w700,
              fontSize: 14.5 * _pixel.horizontalpixel()),
        ),
        actions: [
          Icon(Icons.settings_outlined,
              size: 22 * _pixel.horizontalpixel(),
              color: Theme.of(context).iconTheme.color)
        ],
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).pushNamed("form");
          },
          style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).primaryColor,
              fixedSize: Size(
                124.27 * _pixel.horizontalpixel(),
                22.05 * _pixel.verticalpixel(),
              )),
          child: Text(
            'Go To Form',
            style: GoogleFonts.poppins(
                color: Theme.of(context).textTheme.bodyLarge!.color,
                fontWeight: FontWeight.w700,
                fontSize: 14.5 * _pixel.horizontalpixel()),
          ),
        ),
      ),
    );
  }
}
