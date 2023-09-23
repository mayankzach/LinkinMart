import 'dart:math';

import 'package:codesprint/vendors.dart';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController =
        PageController(initialPage: _currentPage, viewportFraction: 0.8);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        shadowColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 1),
        child: Column(
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.only(top: 40.0, left: 40, right: 40),
              child: Center(
                child: Text("Vendors Near You",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(2, 8, 38, 1),
                        fontSize: 30)),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            AspectRatio(
              aspectRatio: 0.85,
              child: PageView.builder(
                  itemCount: dataList.length,
                  physics: const ClampingScrollPhysics(),
                  controller: _pageController,
                  itemBuilder: (context, index) {
                    return carouselView(index);
                  }),
            )
          ],
        ),
      ),
    );
  }

  Widget carouselView(int index) {
    return AnimatedBuilder(
      animation: _pageController,
      builder: (context, child) {
        double value = 0.0;
        if (_pageController.position.haveDimensions) {
          value = index.toDouble() - (_pageController.page ?? 0);
          value = (value * 0.038).clamp(-1, 1);
          print("value $value index $index");
        }
        return Transform.rotate(
          angle: pi * value,
          child: carouselCard(dataList[index]),
        );
      },
    );
  }

  Widget carouselCard(DataModel data) {
    return Column(
      children: <Widget>[
        Text(
          data.title,
          style: const TextStyle(
              color: Color.fromRGBO(2, 8, 38, 1),
              fontSize: 25,
              fontWeight: FontWeight.bold),
        ),
        Expanded(
          child: Padding(
            padding:
                const EdgeInsets.only(top: 20, left: 40, right: 40, bottom: 90),
            child: Hero(
              tag: data.imageName,
              child: GestureDetector(
                onTap: () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => DetailsScreen(data: data)));
                },
                child: Container(
                  // height: 10,
                  // width:
                  padding: const EdgeInsets.only(top: 0),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      image: DecorationImage(
                          image: AssetImage(
                            data.imageName,
                          ),
                          fit: BoxFit.cover),
                      boxShadow: const [
                        BoxShadow(
                            offset: Offset(0, 4),
                            blurRadius: 4,
                            color: Colors.black26)
                      ]),
                ),
              ),
            ),
          ),
        ),
        ElevatedButton(
          onPressed: () {},
          // onPressed IconButton(
          //    onPressed: (){},
          //    icon:Icon( Icons.search,
          //        color: Colors.white),
          //
          //  ),
          style: ElevatedButton.styleFrom(primary: Colors.black),
          child: const Text(
            'Explore',
          ),
        ),
        // ),
        // Container(
        //   padding: const EdgeInsets.all(4.0),
        //   child: Text(
        //     "${data.price}",
        //     style: const TextStyle(
        //         color: Colors.pink,
        //         fontSize: 16,
        //         fontWeight: FontWeight.bold),
        //   ),
        // )
      ],
    );
  }
}
