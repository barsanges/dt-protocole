# Protocole de communication pour _Dungeon Twister_

Ce dépôt propose des schémas JSON pour communiquer l'état et
l'évolution d'une partie de [Dungeon
Twister](https://boardgamegeek.com/boardgame/12995/dungeon-twister).

## À faire

- [ ] Réécrire complétement le README.

	- [ ] Présenter le dossier `validation` dans le README.

	- [ ] Déplacer les éléments du manuel dans `docs`.

- [ ] Expliquer quelque part (dans le README ou dans le manuel ?) les
      notions d'état et de transition, et la distinction action /
      transition.

- [ ] Réorganiser le dossier `validation`.

- [ ] Rajouter un scénario "initiation" (jeu de base, en 6 salles, 5
      PV, sans le Méchanork, la Passe-muraille, la potion de vitesse
      ni l'armure).

- [ ] Rajouter dans `etat.schema.json` la cible de points de victoire
      utilisée pour la partie.

- [ ] Harmoniser les termes dans les schémas, notamment `couleur` et
      `appartenance`, et `nature` et `personnage`.

## Contenu

Plus précisément, ces schémas couvrent :

  * le référencement des éléments du jeu :

	* les types de personnages connus, via
      [`characters.schema.json`](schemas/referencing/characters.schema.json)
      ;

    * les types d'objets connus, via
      [`objects.schema.json`](schemas/referencing/objects.schema.json)
      ;

    * les références des salles connues, via
      [`rooms.schema.json`](schemas/referencing/rooms.schema.json) ;

    * les joueurs, via
      [`players.schema.json`](schemas/referencing/players.schema.json)
      ;

    * les appartenances possibles, via
      [`memberships.schema.json`](schemas/referencing/memberships.schema.json)
      ;

  * les positions :

    * la position d'une case au sein d'une salle, via
      [`cell_position.schema.json`](schemas/position/cell_position.schema.json)
      ;

    * la position d'une salle au sein du labyrinthe, via
      [`room_position.schema.json`](schemas/position/room_position.schema.json)
      ;

  * les cartes :

    * les cartes action
      [`action_cards.schema.json`](schemas/cards/action_cards.schema.json) ;

    * les cartes combat
      [`combat_cards.schema.json`](schemas/cards/combat_cards.schema.json)
      ;

    * l'ensemble des cartes d'un joueur (main et défausse), via
      [`deck.schema.json`](schemas/cards/deck.schema.json) ;

  * l'état d'une partie, via
    [`state.schema.json`](schemas/state.schema.json) ;

  * une transition d'un état à un autre (i.e. : une décision
    élémentaire de jeu), via
    [`transition.schema.json`](schemas/transitions/transition.schema.json).

Le dossier `test` contient notamment des exemples de JSON conformes
aux différents schémas.

## Périmètre

Ces schémas ont vocation à couvrir le jeu de base et les 6 extensions
officielles pour 2 joueurs, à savoir :

  * [Paladins &
    dragons](https://boardgamegeek.com/boardgameexpansion/13809/dungeon-twister-paladins-and-dragons)
    ;

  * [L'eau & le
    feu](https://boardgamegeek.com/boardgameexpansion/17565/dungeon-twister-fire-and-water)
    ;

  * [Puissances des
    ténèbres](https://boardgamegeek.com/boardgameexpansion/20435/dungeon-twister-forces-of-darkness)
    ;

  * [Mercenaires](https://boardgamegeek.com/boardgameexpansion/21795/dungeon-twister-mercenaries)
    ;

  * [Créatures
    sylvestres](https://boardgamegeek.com/boardgameexpansion/27099/dungeon-twister-creatures-sylvestres)
    ;

  * [Terres de
    glace](https://boardgamegeek.com/boardgameexpansion/31736/dungeon-twister-terres-de-glace).

Ils couvrent aussi l'utilisation des salles de [3-4
joueurs](https://boardgamegeek.com/boardgameexpansion/14533/dungeon-twister-34-players-expansion)
et [À feu et à
sang](https://boardgamegeek.com/boardgameexpansion/25724/dungeon-twister-a-feu-et-a-sang). En
d'autres termes, les schémas permettent de manipuler les paires de
salles de 1 à 36.

En revanche, ils ne couvrent ni les versions à plus de 2 joueurs, ni la version
solo. Ils ne couvrent pas non plus [Dungeon Twister 2:
Prison](https://boardgamegeek.com/boardgame/42124/dungeon-twister-2-prison)
ni [Dungeon Twister: The Card
Game](https://boardgamegeek.com/boardgame/144525/dungeon-twister-the-card-game).

## Référencement et identification des salles

Les salles de _Dungeon Twister_ sont organisées par paires. Chaque
paire est numérotée. En outre, les salles d'une même paire ont des
sens de rotation opposés : l'une tourne dans le sens horaire, et
l'autre dans le sens anti-horaire.

Par conséquent, les schémas référencent chaque salle de manière unique
par le numéro de sa paire et son sens de rotation (e.g. `[1, "horaire"]`).

Il faut en revanche noter qu'une même référence peut être présente
plusieurs fois dans le labyrinthe, par exemple si les deux joueurs ont
choisi l'un et l'autre la même paire de salles dans une partie de type
"Choix libre (forces secrètes)". En plus de sa référence, on associe
donc un identifiant unique à chaque salle du labyrinthe, afin de
pouvoir distinguer sans ambiguïté deux instances différentes d'une
même référence.

## Identification des positions

Les schémas prévoient un système de coordonnées à deux niveaux : d'une
part, chaque salle est dotée de son propre système de coordonnées,
indépendant de son orientation ; d'autre part, un repère orthonormé au
niveau du labyrinthe permet de placer les salles et de gérer leur
orientation.

Par convention, les zones de départ bleue et jaune sont chacunes
considérées comme une salle à part entière dans ce système de
coordonnées.

### Position au sein d'une salle

Chaque salle est dotée d'un repère orthonormé, dont l'unité vaut une
case. L'origine de ce repère est située dans le coin inférieur gauche
lorsque la salle est orientée de manière à ce que son numéro puisse
être lu. Par exemple, le repère de la salle `[1, "horaire"]` est :

![Coordonnées au sein d'une salle](docs/room_coordinates_example.png)

Ce repère ne change pas, quelles que soient l'orientation et la
position de la salle dans le labyrinthe. Si, par exemple, on faisait
pivoter de 90° la salle ci-dessus (dans un sens ou dans l'autre), la
position de la fosse resterait (0, 4), et la herse continuerait de se
trouver entre les cases (1, 0) et (1, 1).

Pour les zones de départ, la convention est de considérer qu'un des
bouts a les coordonnées (0, 0) et l'autre (0, 9).

### Position des salles dans le labyrinthe

Le labyrinthe est lui-même représenté dans un repère orthonormé, dont
l'unité vaut une case.

Dans ce contexte, la position d'une salle dans le labyrinthe est
décrite par la combinaison d'une rotation et d'une translation qui
permettent de passer du repère propre à la salle au repère du
labyrinthe. Plus précisèment, on note :

* $u$ les coordonnées d'une case dans le repère de la salle ;

* $x$ les coordonnées de cette case dans le repère du labyrinthe ;

* $A$ la matrice de rotation associée à la position de la salle ;

* $b$ le vecteur de translation associé à $A$ ;

* $c$ un second vecteur de translation.

On a alors :

$$x = A \cdot u + b + c.$$

$A$ et $b$ permettent de décrire la rotation de la salle par rapport à
son centre, et donc son orientation ; $c$ décrit la position de la
salle dans le labyrinthe. De la sorte, lorsque la salle pivote, il
suffit de changer $A$ et $b$, sans modifier $c$.

La même logique s'applique pour les zones de départ bleue et jaune, à
la différence près que, les zones de départ n'ayant pas de centre,
leur rotation s'effectue par rapport à leur point de coordonnées (0,
0) ; $b$ est donc toujours le vecteur nul. Par ailleurs, il n'y a que
deux matrices $A$ possibles (au lieu de quatre pour les autres
salles) : la matrice identité, et la matrice antidiagonale dont tous
les éléments non-nuls valent 1.
