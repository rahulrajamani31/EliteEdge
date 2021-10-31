import 'dart:async';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:glassmorphism/glassmorphism.dart';

void main() {
  runApp(homescreen());
}

class homescreen extends StatelessWidget {
  const homescreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch().copyWith(
              primary: Colors.pinkAccent,
              secondary: Colors.grey,
              brightness: Brightness.light),
        ),
        home: mainpage());
  }
}

class mainpage extends StatefulWidget {
  const mainpage({Key? key}) : super(key: key);

  @override
  _mainpageState createState() => _mainpageState();
}

class _mainpageState extends State<mainpage> {
  int activeIndex = 0;
  int currentIndex = 0;
  final _advancedDrawerController = AdvancedDrawerController();
  Icon customicon = const Icon(Icons.search);
  Widget customsearch = Text(
    '       Elite Edge',
    style: GoogleFonts.yellowtail(
      textStyle: TextStyle(
          color: Colors.black, fontSize: 40, fontWeight: FontWeight.bold),
    ),
  );

  @override
  void initState() {
    Timer.periodic(Duration(seconds: 5), (timer) {
      setState(() {
        activeIndex++;

        if (activeIndex == 4) activeIndex = 0;
      });
    });

    super.initState();
  }

  final List<String> imageList = [
    'assest/main6.jpg',
    'assest/main5.jpg',
    'assest/main4.jpg',
    'assest/main3.jpg',
    'assest/main2.jpg',
    'assest/main1.jpg',
    'assest/main0.jpg',
  ];
  @override
  Widget build(BuildContext context) {
    return AdvancedDrawer(
      backdropColor: Colors.grey,
      controller: _advancedDrawerController,
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 300),
      animateChildDecoration: true,
      rtlOpening: false,
      disabledGestures: false,
      childDecoration: const BoxDecoration(
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black12,
            blurRadius: 0.0,
          ),
        ],
        borderRadius: const BorderRadius.all(Radius.circular(16)),
      ),
      drawer: SafeArea(
        child: Container(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: 128.0,
                height: 128.0,
                margin: const EdgeInsets.only(
                  top: 24.0,
                  left: 20,
                  bottom: 64.0,
                ),
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  color: Colors.black26,
                  shape: BoxShape.circle,
                ),
                child: Image.asset(
                  'assest/logo_s.png',
                ),
              ),
              // SizedBox(
              //   height: 5,
              // ),
              GlassmorphicContainer(
                // padding: EdgeInsets.only(left: 50),
                width: 280,
                height: 450,
                borderRadius: 20,
                blur: 500,
                alignment: Alignment.bottomCenter,
                border: 2,
                linearGradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xFFffffff).withOpacity(0.1),
                      Color(0xFFFFFFFF).withOpacity(0.05),
                    ],
                    stops: [
                      0.1,
                      1,
                    ]),
                borderGradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xFFffffff).withOpacity(0.5),
                    Color((0xFFFFFFFF)).withOpacity(0.5),
                  ],
                ),
                child: Center(),
              ),
            ],
          ),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.grey.shade200,
        appBar: AppBar(
          actions: [
            IconButton(
              iconSize: 30,
              color: Colors.black,
              onPressed: () {
                setState(() {
                  if (customicon.icon == Icons.search) {
                    customicon = const Icon(Icons.cancel);
                    customsearch = const ListTile(
                      leading: Icon(
                        Icons.search,
                        color: Colors.black,
                        size: 28,
                      ),
                      title: TextField(
                        // maxLength: 20,
                        decoration: InputDecoration(
                          hintText: 'Search your Item',
                          hintStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontStyle: FontStyle.italic,
                          ),
                          border: InputBorder.none,
                        ),
                        // onSubmitted: (){},
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    );
                  } else {
                    customicon = const Icon(Icons.search);
                    customsearch = Text(
                      '       Elite Edge',
                      style: GoogleFonts.yellowtail(
                        textStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 40,
                            fontWeight: FontWeight.bold),
                      ),
                    );
                    ;
                  }
                });
              },
              icon: customicon,
              // Icon(Icons.search),
            ),
          ],
          title: customsearch,
          // Text(
          //   '       Elite Edge',
          //   style: GoogleFonts.yellowtail(
          //     textStyle: TextStyle(
          //         color: Colors.black,
          //         fontSize: 40,
          //         fontWeight: FontWeight.bold),
          //   ),
          // ),
          backgroundColor: Colors.grey.shade200,
          elevation: 0,
          leading: IconButton(
            iconSize: 30,
            color: Colors.black,
            onPressed: _handleMenuButtonPressed,
            icon: ValueListenableBuilder<AdvancedDrawerValue>(
              valueListenable: _advancedDrawerController,
              builder: (_, value, __) {
                return AnimatedSwitcher(
                  duration: Duration(milliseconds: 250),
                  child: Icon(
                    value.visible
                        ? Icons.clear
                        : Icons.stacked_line_chart_outlined,
                    key: ValueKey<bool>(value.visible),
                  ),
                );
              },
            ),
          ),
        ),
        body: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Container(
              margin: EdgeInsets.all(15),
              child: CarouselSlider.builder(
                itemCount: imageList.length,
                options: CarouselOptions(
                  enlargeCenterPage: true,
                  height: 300,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 3),
                  reverse: false,
                  aspectRatio: 5.0,
                ),
                itemBuilder: (context, i, id) {
                  //for onTap to redirect to another screen
                  return GestureDetector(
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                            color: Colors.white,
                          )),
                      //ClipRRect for image border radius
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.asset(
                          imageList[i],
                          width: 500,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    onTap: () {
                      var url = imageList[i];
                      print(url.toString());
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Size get preferredSize => throw UnimplementedError();

  void _handleMenuButtonPressed() {
    _advancedDrawerController.showDrawer();
  }
}

class WaveClip extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = new Path();
    final lowPoint = size.height - 30;
    final highPoint = size.height - 60;
    path.lineTo(0, size.height);
    path.quadraticBezierTo(size.width / 4, highPoint, size.width / 2, lowPoint);
    path.quadraticBezierTo(
        3 / 4 * size.width, size.height, size.width, lowPoint);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
