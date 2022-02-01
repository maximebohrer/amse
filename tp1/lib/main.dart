import 'package:flutter/material.dart';

class Media {
  String imageURL;
  String title;
  String description;
  String type;

  //Constructor
  Media(
      {this.imageURL = "",
      this.title = "",
      this.description = "",
      this.type = ""});

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
                      type: type,
                    )),
          );
        });
  }
}

final mediaList = [
  Media(
    imageURL: "https://m.media-amazon.com/images/I/61oEUPa5g0L._AC_SX425_.jpg",
    title: "Tintin au Congo",
    description:
        "Tintin au Congo (initialement intitulé Les Aventures de Tintin, reporter du « Petit Vingtième », au Congo) est le deuxième album de la série de bande dessinée Les Aventures de Tintin, créée par le dessinateur belge Hergé.",
    type: "BD",
  ),
  Media(
    imageURL:
        "https://images-na.ssl-images-amazon.com/images/I/81ZAmKN2yBL.jpg",
    title: "Tintin au tibet",
    description:
        "Tintin au Tibet est le vingtième album de la série de bande dessinée Les Aventures de Tintin, créée par le dessinateur belge Hergé.",
    type: "BD",
  ),
  Media(
    imageURL:
        "https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcQyO8trmFbGTJIY6MaIFqzfPB6hW8UFCAYxTqtdKWGz7EJ6Jt-d",
    title: "Le Parrain",
    description:
        "En 1945, à New York, les Corleone sont une des 5 familles de la mafia. Don Vito Corleone, `parrain' de cette famille, marie sa fille à un bookmaker. Sollozzo, `parrain' de la famille Tattaglia, propose à Don Vito une association dans le trafic de drogue, mais celui-ci refuse. Sonny, un de ses fils, y est quant à lui favorable. Afin de traiter avec Sonny, Sollozzo tente de faire tuer Don Vito, mais celui-ci en réchappe.",
    type: "Film",
  ),
  Media(
    imageURL:
        "https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcQC2wb62zpLcnjeN15rRM0z_7AM6uBiwVaz-ANtcuyotBFpXa_v",
    title: "Star Wars, épisode V: L'Empire contre-attaque",
    description:
        "Malgré la destruction de l'Étoile noire, l'Empire maintient son emprise sur la galaxie, et poursuit sans relâche sa lutte contre l'Alliance rebelle. Basés sur la planète glacée de Hoth, les rebelles essuient un assaut des troupes impériales.",
    type: "Film",
  ),
  Media(
    imageURL:
        "https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcQfQgYaGGkXDt_8WRcMPkaWGEF6KPKa2Sw53V5sksHO5V2XB7rl",
    title: "The Dark Knight (2008)",
    description:
        "Batman est plus que jamais déterminé à éradiquer le crime organisé qui sème la terreur en ville. Epaulé par le lieutenant Jim Gordon et par le procureur de Gotham City, Harvey Dent, Batman voit son champ d'action s'élargir. La collaboration des trois hommes s'avère très efficace et ne tarde pas à porter ses fruits jusqu'à ce qu'un criminel redoutable vienne plonger la ville de Gotham City dans le chaos.",
    type: "Film",
  ),
  Media(
    imageURL:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSACSHN7zTwny8ffk7LU3wsju2OdC-MK85JW8_9sqPkGJC-5Dxf",
    title: "Les Dents de la mer",
    description:
        "À quelques jours du début de la saison estivale, les habitants de la petite station balnéaire d'Amity sont en émoi face à la découverte, sur le littoral, du corps atrocement mutilé d'une jeune vacancière. Pour Martin Brody, le chef de la police, il ne fait aucun doute que la jeune fille a été victime d'un requin. Il décide alors d'interdire l'accès des plages mais se heurte à l'hostilité du maire, uniquement intéressé par l'afflux des touristes.",
    type: "Film",
  ),
  Media(
    imageURL:
        "https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcQ-tLgIt3dwgSlbWGnWFdzCiNuxifSvpJCCTk8dsODbSHuiRsu5",
    title: "Game of Thrones",
    description:
        "Neuf familles nobles rivalisent pour le contrôle du Trône de Fer dans les sept royaumes de Westeros. Pendant ce temps, des anciennes créatures mythiques oubliées reviennent pour faire des ravages.",
    type: "Série",
  ),
  Media(
    imageURL:
        "https://upload.wikimedia.org/wikipedia/commons/thumb/d/db/Black_Mirror_logo.svg/640px-Black_Mirror_logo.svg.png",
    title: "Black mirror",
    description:
        "Chaque épisode a un casting différent, un décor différent et une réalité différente, mais ils traitent tous de la façon dont nous vivons maintenant, et de la façon dont nous pourrions vivre dans dix minutes si nous sommes maladroits.",
    type: "Série",
  ),
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
      {Key? key,
      this.title = "",
      this.description = "",
      this.imageURL = "",
      this.type = ""})
      : super(key: key);
  final String title;
  final String description;
  final String imageURL;
  final String type;

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
                "\n" + title + " (" + type + ")\n",
                style: const TextStyle(fontSize: 18),
              ),
              Text(description)
            ],
          ),
          padding: const EdgeInsets.all(16.0),
        ));
  }
}
