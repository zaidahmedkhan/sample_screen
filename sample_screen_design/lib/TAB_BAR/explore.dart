import 'package:flutter/material.dart';

class Explore extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.only(top: 10),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Color(0xff282829), // Left color
                Color(0xff3A363E), // Right color
              ],
            ),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
          child: Column(
            children: [
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 16.0),
                    child: Text(
                      'Countries & Regions',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(right: 15.0),
                        child: Text(
                          'More',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 20.0),
                        child: Image.asset('assets/icons/iconarrow.png'),
                      )
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Image.asset('assets/icons/sweden.png',
                          width: 50, height: 30),
                      const SizedBox(height: 10),
                      const Text('Sweden',
                          style: TextStyle(color: Colors.white)),
                    ],
                  ),
                  Column(
                    children: [
                      Image.asset('assets/icons/bangladesh.png',
                          width: 50, height: 30),
                      const SizedBox(height: 10),
                      const Text('Bangladesh',
                          style: TextStyle(color: Colors.white)),
                    ],
                  ),
                  Column(
                    children: [
                      Image.asset('assets/icons/united-kingdom.png',
                          width: 50, height: 30),
                      const SizedBox(height: 10),
                      const Text('UK', style: TextStyle(color: Colors.white)),
                    ],
                  ),
                  Column(
                    children: [
                      Image.asset('assets/icons/saudi-arabia.png',
                          width: 50, height: 30),
                      const SizedBox(height: 10),
                      const Text('Saudi Arabia',
                          style: TextStyle(color: Colors.white)),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Image.asset('assets/icons/canada.png',
                          width: 50, height: 30),
                      const SizedBox(height: 10),
                      const Text('Canada',
                          style: TextStyle(color: Colors.white)),
                    ],
                  ),
                  Column(
                    children: [
                      Image.asset('assets/icons/pakistan.png',
                          width: 50, height: 30),
                      const SizedBox(height: 10),
                      const Text(' Pakistan ',
                          style: TextStyle(
                            color: Colors.white,
                          )),
                    ],
                  ),
                  Column(
                    children: [
                      Image.asset('assets/icons/ukraine.png',
                          width: 50, height: 30),
                      const SizedBox(height: 10),
                      const Text(' Ukraine ',
                          style: TextStyle(color: Colors.white)),
                    ],
                  ),
                  Column(
                    children: [
                      Image.asset('assets/icons/france.png',
                          width: 50, height: 30),
                      const SizedBox(height: 10),
                      const Text('    France    ',
                          style: TextStyle(color: Colors.white)),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            width: MediaQuery.of(context).size.width,
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
              ),
              itemCount: 6,
              itemBuilder: (context, index) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(25.0),
                  child: Container(
                    margin: const EdgeInsets.all(5),
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Image.asset(
                            'assets/icons/post-placeholder.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          top: 5,
                          left: 10,
                          child: Image.asset(
                            'assets/icons/ranking.png',
                            width: 80,
                            height: 30,
                          ),
                        ),
                        Positioned(
                          bottom: 10,
                          left: 10,
                          child: Image.asset(
                            'assets/icons/Frame.png',
                            width: 150,
                            height: 40,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        )
      ],
    );
  }
}
