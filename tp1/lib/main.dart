import 'package:flutter/material.dart';

class Media {
  String imageURL;
  String title;
  String description;

  //Constructor
  Media({this.imageURL = "", this.title = "", this.description = ""});

  Widget getListTile(context) {
    return ListTile(
        title: Text(title),
        subtitle: Text(description),
        isThreeLine: true,
        leading: Image(
          image: NetworkImage(imageURL),
          //fit: BoxFit.cover,
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => InfoPage(
                      imageURL: imageURL,
                      title: title,
                      description: description,
                    )),
          );
        });
  }
}

final mediaList = [
  Media(
      imageURL:
          "https://m.media-amazon.com/images/I/61oEUPa5g0L._AC_SX425_.jpg",
      title: "Tintin au Congo",
      description:
          "Tintin au Congo (initialement intitulé Les Aventures de Tintin, reporter du « Petit Vingtième », au Congo) est le deuxième album de la série de bande dessinée Les Aventures de Tintin, créée par le dessinateur belge Hergé."),
  Media(
      imageURL:
          "https://images-na.ssl-images-amazon.com/images/I/81ZAmKN2yBL.jpg",
      title: "Tintin au tibet",
      description:
          "Tintin au Tibet est le vingtième album de la série de bande dessinée Les Aventures de Tintin, créée par le dessinateur belge Hergé.")
];

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'TP Flutter 1';

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

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    //Liste des trois pages
    final List<Widget> _widgetOptions = <Widget>[
      Column(
        children: [
          const Text(
            'Bienvenue',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          const Text("\nAMSE - TP Flutter 1\nListe de médias\n"),
          ElevatedButton(
            onPressed: () {
              _onItemTapped(1);
            },
            child: const Text('Voir les médias'),
          ),
        ],
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
      ),
      const MediaPage(),
      Column(
        children: const [
          Text(
            'Maxime Bohrer',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          Text('https://github.com/maximebohrer/amse')
        ],
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('TP Flutter 1'),
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
            icon: Icon(Icons.play_arrow),
            label: 'Media',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.question_mark),
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
      itemCount: mediaList.length,
      itemBuilder: (BuildContext context, int index) {
        return mediaList[index].getListTile(context);
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(),
    );
  }
}

class InfoPage extends StatelessWidget {
  const InfoPage(
      {Key? key, this.title = "", this.description = "", this.imageURL = ""})
      : super(key: key);
  final String title;
  final String description;
  final String imageURL;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Image(
                image: NetworkImage(imageURL),
              ),
              Text(
                title,
                style: const TextStyle(fontSize: 18),
              ),
              Text(description)
            ],
          ),
          padding: const EdgeInsets.all(16.0),
        ));
  }
}
