// import 'dart:js_util';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:new_ui/view/componed/globes.dart';

class Home_Page extends StatefulWidget {
  const Home_Page({Key? key}) : super(key: key);

  @override
  State<Home_Page> createState() => _Home_PageState();
}

class _Home_PageState extends State<Home_Page> {
  bool istoggl = false;
  int k = 0;
  String kom = "boat";
  CarouselController? carouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CarouselSlider"),
        actions: [
          InkWell(
            onTap: () {
              setState(() {
                if (istoggl == false) {
                  istoggl = true;
                } else {
                  istoggl = false;
                }
              });
            },
            child: Icon(Icons.legend_toggle),
          ),
          SizedBox(
            width: 30,
          )
        ],
      ),
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            CarouselSlider(
              carouselController: carouselController,
              options: CarouselOptions(
                initialPage: k,
                onPageChanged: (val, _) {
                  setState(() {
                    k = val;
                  });
                },
                // scrollDirection: Axis.vertical,
                height: 200,
                scrollDirection: (istoggl) ? Axis.vertical : Axis.horizontal,
                viewportFraction: 0.8,
                enlargeCenterPage: true,
                // animateToClosest: true
              ),
              items: [
                ...DataOfInf.o.map(
                  (e) => Container(
                    // width: double.infinity,
                    child: Image.network(
                      "${e['i']}",
                    ),
                  ),
                ),
              ],
            ),
            Align(
              alignment: (istoggl) ? Alignment(1, 0) : Alignment(0, 0.35),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: (istoggl) ? 120 : 25,
                  width: (istoggl) ? 25 : 120,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: (istoggl)
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ...DataOfInf.o.map((e) {
                              int? i = DataOfInf.o.indexOf(e);
                              return InkWell(
                                onTap: () {
                                  carouselController?.animateToPage(i);
                                },
                                child: CircleAvatar(
                                  radius: (k == i) ? 7 : 5,
                                  backgroundColor:
                                      (k == i) ? Colors.blue : Colors.white,
                                ),
                              );
                            }),
                          ],
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ...DataOfInf.o.map((e) {
                              int? i = DataOfInf.o.indexOf(e);
                              return InkWell(
                                onTap: () {
                                  carouselController?.animateToPage(i);
                                },
                                child: CircleAvatar(
                                  radius: (k == i) ? 7 : 5,
                                  backgroundColor:
                                      (k == i) ? Colors.blue : Colors.white,
                                ),
                              );
                            }),
                          ],
                        ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Row(
                    children: [
                      ...DataOfInf.cpi.map(
                        (e) => Row(
                          children: [
                            ActionChip(
                              autofocus: true,
                              avatar: Container(
                                alignment: Alignment.center,
                                child: CircleAvatar(
                                  backgroundImage: NetworkImage(
                                    "${e['i']}",
                                  ),
                                ),
                              ),
                              label: Text(
                                "${e['n']}",
                              ),
                              onPressed: () {
                                setState(() {
                                  DataOfInf.o = DataOfInf.fluu[DataOfInf.cpi.indexOf(e)];
                                });
                              },
                            ),
                            SizedBox(
                              width: 10,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
