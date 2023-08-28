## Connecteurs

- Les connecteurs sont bien plus puissants que les markdown
- Ils peuvent potentiellement remplacer le html
- C'est une excellente ressource pour l'éducation, on montrant qu'on peut faire de belles choses avec des concepts simples
- Ils représentent la voir du String vers le Array : tout devrait être en Array (config, données, verbose, css, paramètres des fonctions, etc). Les connecteurs permettent d'écrire des arrays à partir des strings.
- Le coût d'exécution des connecteurs est un hashage de string, aussi rapide que la lecture d'un array.
- Les connecteurs représentent du XXLHtml, c'est à dire un langage extensible à l'infini. N'importe quelle balise peut être implémentée facilement. Une balise devient de facto une application à part entière.
- Les Connecteurs peuvent injecter des variables ou en créer à la volée.
- On peut écrire des applications au format Connecteurs.

## Html

Le framework Html permet de déléguer l'écriture du html à des fonctions simples.
- Les paramètres sont dans un tableau.
- Les usages classiques sont condensés en fonctions à usage rapide.
- Il est impropre d'écrire en dur du html dans du code.
- Le framework peut contrôler l'usage des balises. Par exemple quand il s'est agit de convertir les "b" en "strong".

## Views

- Views est un système de template basé sur Json.
- Au lieu d'utiliser du html, on utilise des données exploitables.
- L'application possède une conscience des variables attendues.
- Les Views peuvent s'emboiter comme des poupées russes (au lieu de placer une boucle php dans un template html).
- Le paramétrage d'une View peut être orchestré par une application de surface.
- Une View produit forcément du code html propre.
- On peut injecter des templates à la volée au format Connecteurs.

## Css

Le framework Css permet de produire des css propres.
Les données sont stockées dans un tableau Json.
Les données peuvent être administrées par une application de surface.
Le principe des variables de couleurs peut être étendu à des séries de paramètres.
Css construit une nouvelle feuille de style dès que Json est modifié.
De nombreux appendices techniques sont rendus possibles grâce au framework html.

## Head

Head construit les headers.
- L'ensemble des balises du header sont des paramètres enregistrés en Json.
- On peut facilement ajouter des éléments au headers en cours d'exécution du code.
- Les js et css peuvent recevoir un paramètre anti-cache.
- Les headers peuvent être modifiés a posteriori par javascript.
