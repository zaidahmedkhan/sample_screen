import 'package:flutter/material.dart';
import 'package:sample_screen_design/HOME/dashboard_screen.dart';
import 'package:sample_screen_design/HOME/fire_screen.dart';
import 'package:sample_screen_design/HOME/notifications_screen.dart';
import 'package:sample_screen_design/HOME/profile_screen.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    DashboardView(),
    const FireView(),
    const NotificationView(),
    const ProfileView(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Color _getIconColor(int index) {
    return _selectedIndex == index ? Color(0xffF9c034) : Colors.grey;
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xff252526),
      body: Stack(
        children: [
          _screens[_selectedIndex],
          Positioned(
              bottom: 0,
              left: 0,
              child: Container(
                width: size.width,
                height: 72,
                child: Stack(
                  children: [
                    CustomPaint(
                      size: Size(size.width, 80),
                      painter: BNBCustomPainter(),
                    ),
                    Center(
                      heightFactor: 0.6,
                      child: FloatingActionButton(
                        onPressed: () {},
                        backgroundColor: Color(0xffF9c034),
                        child: Image.asset(
                          'assets/icons/camera.png',
                          width: 24,
                          height: 24,
                        ),
                        elevation: 0.1,
                        shape: const CircleBorder(),
                      ),
                    ),
                    Container(
                      width: size.width,
                      height: 80,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton(
                            onPressed: () => _onItemTapped(0),
                            icon: SizedBox(
                              width: 24,
                              height: 24,
                              child: Image.asset(
                                'assets/icons/Home.png',
                                color: _getIconColor(0),
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: () => _onItemTapped(1),
                            icon: SizedBox(
                              width: 24,
                              height: 24,
                              child: Image.asset(
                                'assets/icons/fire.png',
                                color: _getIconColor(1),
                              ),
                            ),
                          ),
                          Container(
                            width: size.width * 0.20,
                          ),
                          IconButton(
                            onPressed: () => _onItemTapped(2),
                            icon: SizedBox(
                              width: 24,
                              height: 24,
                              child: Image.asset(
                                'assets/icons/chat.png',
                                color: _getIconColor(2),
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: () => _onItemTapped(3),
                            icon: Container(
                              width: 24,
                              height: 24,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color: _getIconColor(3),
                                  width: 2,
                                ),
                              ),
                              child: Image.asset(
                                'assets/icons/Ellipse.png',
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ))
        ],
      ),
    );
  }
}

class BNBCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Color(0xff252626)
      ..style = PaintingStyle.fill;
    Path path = Path()..moveTo(0, 20);
    path.quadraticBezierTo(size.width * 0.20, 0, size.width * 0.35, 0);
    path.quadraticBezierTo(size.width * 0.40, 0, size.width * 0.40, 20);
    path.arcToPoint(Offset(size.width * 0.60, 20),
        radius: Radius.circular(10.0), clockwise: false);

    path.quadraticBezierTo(size.width * 0.60, 0, size.width * 0.65, 0);
    path.quadraticBezierTo(size.width * 0.80, 0, size.width, 20);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    canvas.drawShadow(path, Colors.black, 5, true);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
