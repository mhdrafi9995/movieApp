import 'package:flutter/material.dart';
import 'package:movieui/image_class/json_img.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: true,
            title: buildTop(),
            expandedHeight: MediaQuery.of(context).size.height * .45,
            flexibleSpace: FlexibleSpaceBar(
              background: ShaderMask(
                shaderCallback: (Rect bounds) {
                  return LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [0.6, 1],
                    colors: [
                      Colors.transparent,
                      Colors.black,
                    ],
                  ).createShader(bounds);
                },
                blendMode: BlendMode.srcATop,
                child: Image.asset(
                  "lib/img/john-poster.jpg",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            bottom: PreferredSize(
              child: buildBottom(),
              preferredSize: Size.fromHeight(100),
            ),
          ),
          SliverToBoxAdapter(
            child: buildBody(),
          ),
        ],
      ),
    );
  }

  Row buildTop() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: () {},
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
    );
  }

  Row buildBottom() {
    return Row(
      children: [
        Image.asset(
          "lib/img/wick.png",
          width: 100,
        ),
        SizedBox(
          width: 180,
        ),
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.add,
              color: Colors.white,
              size: 32,
            )),
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.cloud_download_rounded,
              color: Colors.white,
              size: 32,
            ))
      ],
    );
  }

  Padding buildBody() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                "95% match",
                style: TextStyle(
                    color: Colors.green,
                    fontSize: 18,
                    fontWeight: FontWeight.w700),
              ),
              SizedBox(
                width: 16,
              ),
              Text(
                "2023",
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 18,
                    fontWeight: FontWeight.w700),
              ),
              SizedBox(
                width: 16,
              ),
              Text(
                "24h  49m",
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 18,
                    fontWeight: FontWeight.w700),
              ),
              SizedBox(
                width: 16,
              ),
              Text(
                "R",
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 18,
                    fontWeight: FontWeight.w700),
              ),
              SizedBox(
                width: 16,
              ),
              Text(
                "HD",
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 18,
                    fontWeight: FontWeight.w700),
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            children: [
              Icon(
                Icons.radio_button_off,
                color: Colors.red,
              ),
              SizedBox(
                width: 16,
              ),
              Text(
                "Most Liked",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
              )
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Container(
              margin: EdgeInsets.symmetric(horizontal: 67),
              width: 490,
              height: 46,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey[800]),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.play_arrow,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 6,
                  ),
                  Text(
                    "Play",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                  )
                ],
              )),
          SizedBox(
            height: 20,
          ),
          Text(
            "Prolog",
            style: TextStyle(
                color: Colors.white, fontSize: 28, fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "In publishing and graphic design, Lorem ipsum is a placeholdertext commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content.Lorem ipsum may be used as a placeholder before final copy is available",
            textAlign: TextAlign.justify,
            style: TextStyle(color: Colors.grey, fontSize: 16),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "Top Chat",
            style: TextStyle(
                color: Colors.white, fontSize: 22, fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 200,
            child: ListView.separated(
              shrinkWrap: true,
              itemCount: topChat.length,
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.all(10),
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    CircleAvatar(
                      backgroundImage: AssetImage(topChat[index]["img"]!),
                      radius: 30,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      topChat[index]["title"]!,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      topChat[index]["subtitle"]!,
                      style: TextStyle(
                          color: Colors.white54,
                          fontSize: 12,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                );
              },
              separatorBuilder: (context, index) => SizedBox(
                width: 30,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
