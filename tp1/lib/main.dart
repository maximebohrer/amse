import 'package:flutter/material.dart';

class Media {
  String imageURL;
  String title;
  String description;

  //Constructor
  Media({this.imageURL = "", this.title = "", this.description = ""});

  Widget getListTile() {
    return ListTile(
        title: Text(title),
        subtitle: Text(description),
        isThreeLine: true,
        leading: Image(
          image: NetworkImage(imageURL),
          //fit: BoxFit.cover,
        ));
  }
}

final bds = [
  Media(
      imageURL:
          "https://m.media-amazon.com/images/I/61oEUPa5g0L._AC_SX425_.jpg",
      title: "Tintin au Congo",
      description:
          "Tintin au Congo (initialement intitulé Les Aventures de Tintin, reporter du « Petit Vingtième », au Congo) est le deuxième album de la série de bande dessinée Les Aventures de Tintin, créée par le dessinateur belge Hergé."),
  Media(imageURL: "https://images-na.ssl-images-amazon.com/images/I/81ZAmKN2yBL.jpg",
  title: "Tintin au tibet",
  description: "Tintin au Tibet est le vingtième album de la série de bande dessinée Les Aventures de Tintin, créée par le dessinateur belge Hergé.")
];

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0000: Home',
      style: optionStyle,
    ),
    MediaPage(),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BottomNavigationBar Sample'),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Media',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'About',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}

class MediaPage extends StatefulWidget {
  const MediaPage({Key? key}) : super(key: key);

  @override
  _MediaPageState createState() => _MediaPageState();
}

class _MediaPageState extends State<MediaPage> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(8),
      itemCount: bds.length,
      itemBuilder: (BuildContext context, int index) {
        return bds[index].getListTile();
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(),
    );
  }
}

class InfoPage extends StatelessWidget {
  const InfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Route'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Go back!'),
        ),
      ),
    );
  }
}
