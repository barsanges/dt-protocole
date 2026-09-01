# Tests de validation

## Saut

### Valides

| Identifiant | Description |
|-------------|-------------|
| saut-01 | Schéma 6 du livret de règles de la boîte de base |
| saut-02 | Schéma 6 du livret de règles de la boîte de base : un personnage peut sauter "en diagonale" |
| saut-03 | Schéma 6 du livret de règles de la boîte de base : un personnage peut sauter sur une case contenant un objet |
| saut-04 | Un personnage peut sauter en abandonnant un objet derrière lui |
| saut-05 | Un personnage peut sauter en emportant un objet si la case d'arrivée est libre |
| saut-06 | Un personnage peut sauter en emportant un blessé si la case d'arrivée est libre |
| saut-07 | Un personnage peut sauter en abandonnant un objet pour atterrir sur une case contenant un autre objet |
| saut-08 | Le Paladin peut sauter en abandonnant un blessé et un objet |
| saut-09 | Le Paladin peut sauter en emportant un blessé et un objet si la case d'arrivée est libre |
| saut-10 | Le Paladin peut sauter en abandonnant un élément et en en emportant un autre pour atterrir sur une case contenant un autre objet  |
| saut-11 | Un personnage peut sauter par une fosse d'une salle dans une autre |

### Invalides

| Identifiant | Description |
|-------------|-------------|
| saut-01 | Schéma 6 du livret de règles de la boîte de base : un personnage ne peut pas sauter par-dessus un personnage adverse |
| saut-02 | Schéma 6 du livret de règles de la boîte de base : un personnage ne peut pas atterir sur une case occupée |
| saut-03 | Un personnage ne peut sauter que si le joueur dispose encore d'une carte saut |
| saut-04 | Un personnage ne peut pas sauter au-dessus d'une case de sol |
| saut-05 | Un personnage ne peut sauter en emportant un objet que si la case d'arrivée est libre |
| saut-06 | Un personnage ne peut sauter en emportant un objet que si l'objet est présent sur la case de départ |
| saut-07 | Le Paladin ne peut sauter en emportant deux éléments que si la case d'arrivée est libre |
| saut-08 | Le Paladin ne peut pas sauter en laissant deux objets derrière lui |
| saut-09 | Un personnage ne peut pas traverser un mur en sautant |
| saut-10 | Un personnage ne peut pas sauter plus d'une case |

## Rotation

### Valides

| Identifiant | Description |
|-------------|-------------|
| rotation-01 | Un personnage peut faire tourner une salle d'un quart de tour dans son sens de rotation |
| rotation-02 | Un personnage peut faire tourner l'autre salle de la paire d'un quart de tour dans son sens de rotation |
| rotation-03 | Un personnage peut faire tourner n'importe quelle salle ayant le même numéro (i.e. la paire de salle est présente deux fois) d'un quart de tour dans son sens de rotation |
| rotation-04 | Le Méchanork peut faire tourner une salle d'un quart de tour dans son sens de rotation |
| rotation-05 | Le Méchanork peut faire tourner une salle d'un quart de tour à l'inverse de son sens de rotation |
| rotation-06 | Le Méchanork peut faire tourner l'autre salle de la paire d'un quart de tour à l'inverse de son sens de rotation |

### Invalides

| Identifiant | Description |
|-------------|-------------|
| rotation-01 | Un personnage ne peut pas faire tourner une salle à l'inverse de son sens de rotation |
| rotation-02 | Un personnage ne peut pas faire tourner une salle qui n'a pas le même numéro |
| rotation-03 | Un personnage ne peut pas faire tourner une salle s'il n'est pas sur le mécanisme de rotation |

## Passer

### Valides

| Identifiant | Description |
|-------------|-------------|
| passer-01 | Passer termine le tour du joueur courant et initie le tour du joueur adverse |

### Invalides

| Identifiant | Description |
|-------------|-------------|
| passer-01 | Il est interdit de passer son tour pendant la mise en place |
