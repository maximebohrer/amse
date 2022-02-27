UV AMSE
=======

Ce repository contient mes applications mobiles réalisées en Flutter dans le cadre de l'UV Applications Mobiles et Systèmes Embarqués.

TP 1
----

Le TP 1 est un premier exemple d'une application basique contenant 3 pages, et qui permet de parcourir une liste de médias. Les médias sont cliquables pour afficher l'image en grand ainsi que plus d'informations.

Lancement :
```bash
cd tp1
flutter run
```

TP 2
----

Binome : DEVA Nilavan - BOHRER Maxime

Lancement :
```bash
cd tp2
flutter run
```

### Informations

Le code est découpé en plusieurs fichiers. Chaque exercice a son fichier. Le fichier `main.dart` lance l'exercice 3 (le menu).

### common.dart

Nous avons placé les fonctions et classes que nous devions utiliser dans plusieurs exercices dans le fichier common.dart, qui est importé dans chaque autre fichier. Il y a notamment :

- La classe `ColorTile`, qui décrit une tuile de couleur. On lui passe une couleur et un indice. L'indice est affiché sur la tuile avec la couleur en fond.

- La classe `ImageTile`, qui décrit une tuile d'image. On lui passe une image, un notre de tuiles total (n) et in indice (i) et elle calcule elle-même l'alignement.

Ces classes héritent d'une classe commune `Tile` afin qu'elles soient facilement interchangeables. Elles disposent d'une fonction `getWidget` qui construit le widget associé. Une variable `isEmpty` indique si la case est vide. Il y aura une seule case marquée `isEmpty` dans le jeu de taquin.

### Exercice 3

Tous les fichiers sont importés dans le fichier `ex3.dart`. La classe `MenuTile` décrit les items du menu. Elle prend en paramètres un titre, une description, et une fonction expliquant comment instancier un exercice. Nous utilisons une fonction car il n'est pas possible de passer un type générique et de créer une instance de ce type.

### Exercice 4

(Fichier `ex4.dart`)

L'exercice 4 a été modifié pour utiliser la nouvelle classe `ImageTile`.

### Exercice 5

(Fichiers `ex5a.dart`, `ex5b.dart`, `ex5c.dart`) Ces exercices utilisent aussi les classes `ColorTile` et `ImageTile`.

### Exercice 6

(Fichiers `ex6a.dart`, `ex6b.dart`)

- L'exercice 6a a été modifié pour utiliser la noucelle classe `ColorTile`.

- L'exercice 6b utilise une méthode `reset` qui crée la liste de tuiles en fonction de la taille séléctionnée. Une tuile au hasard est ensuite marquée `isEmpty` pour créer une case vide. Une variable `mustReset`, initialisée à true, indique si il faut détruire et reconstruire la liste des tuiles. Elle est mise à true lors d'un changement de taille.

- La fonction `moveToBlank` prend en paramètre l'indice de la case sur laquelle l'utilisateur a cliqué, cherche dans toutes les directions si une case vide est présente, et inverse la case vide et la case cliquée si c'est le cas.

### Exercice 7

(Fichier `ex7.dart`)
Tous les principes introduits à l'exercice 6b sont repris.

- En plus d'avant, la fonction `moveToBlank` ajoute a une liste les déplacements effectués. Un déplacement est simplement la liste des deux indices des cases qui ont été échangées. Pour annuler un déplacement, il suffit d'effectuer à nouveau l'échange, et de supprimer le dernier mouvement de la liste. On a aussi immédiatement accès au nombre de déplacement par la taille de la liste.

- Le choix de la difficulté a été ajouté il contrôle le nombre de déplacements faits lors du mélange.

- Le jeu possède 3 états : `stopped` avant de commencer une partie. Les tuiles sont affichées dans l'ordre et les réglages peuvent être faits. Le bouton Commencer a pour effet de mélanger les tuiles (voir fonction `start`) et passe l'état en `running`. A chaque déplacement, on vérifie si le joueur a gagné. Ceci est fait en comparant l'incide des tuiles avec leur place dans la liste des tuiles. En fait, les indices servent à la fois à l'affichage (l'alignement de l'image pour les `ImageTile` et l'affichage du numéro pour les `ColorTile`) et à la logique du jeu (pour déterminer si toutes les tuiles sont à leur place). Si c'est le cas, l'état passe en `finished`, et la case vide s'affiche pour réléler l'image complète. Les contrôles affichés sont conditionnés par l'état du jeu. Par exemple, le choix de l'image et de la difficulté n'est affiché qu'à l'état `stopped`.

- Le widget `ImageSelector` est la page de sélection d'image. Un clique sur Choisir une image pousse la page dans le navigateur. Cette page prend un paramètre une fonction de callback utilisée pour renvoyer l'image lorsqu'elle est sélectionnée. Sur cette page, la première case sert à passer en mode tuiles colorées. La deuxième case sert à choisir une image de sa galerie, la troisième à prendre une image avec l'appareil photo. (ces fonctions sont réalisées avec le package `image_picker`. Elles ne fonctionnent que sur téléphone, pas dans chrome.) La quatrière est une [image aléatoire d'internet](https://picsum.photos/512). Les autres sont directement des assets du projet.