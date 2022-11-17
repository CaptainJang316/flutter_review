import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './counter_provider.dart';
import 'testPage1.dart';
import 'testPage2.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _HomeState();
}

class _HomeState extends State<MyHomePage> {
  int _selectedIndex = 0; // 선택된 페이지의 인덱스 넘버 초기화

  final List<Widget> _widgetOptions = <Widget>[
    Home(),
    TestPage1(),
    TestPage2(),
  ]; // 3개의 페이지를 연결할 예정이므로 3개의 페이지를 여기서 지정해준다. 탭 레이아웃은 3개.

  void _onItemTapped(int index) {
    // 탭을 클릭했을떄 지정한 페이지로 이동
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      // bottom navigation 선언
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.text_snippet),
            label: '나의 판매글',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: '마이페이지',
          ),
        ],
        currentIndex: _selectedIndex, // 지정 인덱스로 이동
        selectedItemColor: Colors.lightGreen,
        onTap: _onItemTapped, // 선언했던 onItemTapped
      ),
    );
  }
}

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  late CountProvider _countProvider;

  @override
  Widget build(BuildContext context) {
    _countProvider = Provider.of<CountProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: CountHome(),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          IconButton(
            onPressed: () => _countProvider.increase(),
            icon: Icon(Icons.add),
          ),
          IconButton(
            onPressed: () => _countProvider.decrease(),
            icon: Icon(Icons.remove),
          )
        ],
      ),
    );
  }
}

class CountHome extends StatelessWidget {
  const CountHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext) {
    return Center(
      child: Consumer<CountProvider>(
        builder: (context, countProvider, child) => Text(
          Provider.of<CountProvider>(context).count.toString(),
          style: TextStyle(fontSize: 60),
        ),
      ),
    );
  }
}
