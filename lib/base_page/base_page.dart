import 'package:diary/my_page/my_page.dart';
import 'package:diary/time_line/time_line_page.dart';
import 'package:flutter/material.dart';

class BasePage extends StatefulWidget {
  const BasePage({super.key});

  @override
  State<BasePage> createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
  int selectedIndex = 0;
  List<Widget> display = [const TimeLinePage(), const MyPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: display[selectedIndex],
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: Color(0xFFe9e6d7),
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.transparent,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'タイムライン'),
            BottomNavigationBarItem(icon: Icon(Icons.people), label: 'マイページ'),
          ],
          currentIndex: selectedIndex,
          elevation: 0,
          onTap: (int index) {
            selectedIndex = index;
            setState(() {});
          },
        ),
      ),
    );
  }
}
