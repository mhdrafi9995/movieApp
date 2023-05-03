import 'package:flutter/material.dart';

import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:movieui/image_class/json_img.dart';
import 'package:movieui/pages/details_page.dart';
import 'package:movieui/pages/profile_page.dart';
import 'package:movieui/pages/see_all.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: GNav(
          hoverColor: Colors.white54,
          backgroundColor: Colors.black,
          activeColor: Colors.white,
          tabs: [
            GButton(
              icon: Icons.home,
              iconSize: 32,
              iconColor: Colors.grey[400],
            ),
            GButton(
              icon: Icons.api_rounded,
              iconSize: 32,
              iconColor: Colors.grey[400],
            ),
            GButton(
              icon: Icons.downloading_rounded,
              // iconColor: Colors.white54
              iconSize: 32,
              iconColor: Colors.grey[400],
            ),
            GButton(
              icon: Icons.movie,
              // iconColor: Colors.white54,
              iconSize: 32,
              iconColor: Colors.grey[400],
            ),
          ]),
      body: Stack(children: [
        Image.asset("lib/img/john-poster.jpg"),
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.4, 0.58],
              colors: [
                Colors.transparent,
                Colors.black,
              ],
            ),
          ),
        ),
        Positioned(
          top: 30,
          left: 22,
          right: 22,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Profile(),
                  ));
                },
                child: CircleAvatar(
                  backgroundImage: AssetImage("lib/img/posterd.jpg"),
                  backgroundColor: Colors.white54,
                ),
              ),
              CircleAvatar(
                child: Icon(
                  Icons.search,
                  color: Colors.white,
                  size: 32,
                ),
                backgroundColor: Colors.white54,
              ),
            ],
          ),
        ),
        Positioned(
          top: 510,
          left: 100,
          child: Row(
            children: [
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.play_arrow,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      "Play",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.w500),
                    )
                  ],
                ),
                width: 120,
                height: 40,
                decoration: BoxDecoration(
                    color: Colors.grey.shade500,
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(20)),
              ),
              SizedBox(
                width: 14,
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => DetailsPage(),
                  ));
                },
                child: Container(
                  child: Center(
                    child: Text(
                      "Details",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  width: 120,
                  height: 40,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(20)),
                ),
              )
            ],
          ),
        ),
        Positioned(
          top: 577,
          left: 24,
          right: 24,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Trending",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 26,
                    fontWeight: FontWeight.w500),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => SeeAllPages(),
                    ));
                  },
                  child: Text(
                    "See All",
                    style: TextStyle(
                        color: Colors.white54,
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                  ))
            ],
          ),
        ),
        Positioned(
          top: 630,
          left: 24,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(images.length, (index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: GestureDetector(
                    onTap: () {},
                    child: Column(
                      children: [
                        Container(
                          width: 180,
                          height: 200,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                  image: AssetImage(images[index]),
                                  fit: BoxFit.cover)),
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ),
          ),
        )
      ]),
    );
  }
}
