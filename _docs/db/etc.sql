-- phpMyAdmin SQL Dump
-- version 5.2.1deb1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : sam. 27 avr. 2024 à 09:35
-- Version du serveur : 10.11.3-MariaDB-1
-- Version de PHP : 8.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `etc`
--

-- --------------------------------------------------------

--
-- Structure de la table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `uid` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `json` mediumtext DEFAULT NULL,
  `up` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `cats`
--

CREATE TABLE `cats` (
  `id` int(11) NOT NULL,
  `category` varchar(255) NOT NULL DEFAULT '',
  `up` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `cats`
--

INSERT INTO `cats` (`id`, `category`, `up`) VALUES
(1, 'public', '2023-08-18 10:40:03'),
(2, 'trucs', '2023-08-18 10:40:03'),
(3, 'works', '2023-08-24 13:42:06'),
(4, 'prog', '2023-08-24 20:00:13'),
(5, 'lessons', '2023-08-25 13:40:22'),
(6, 'philo', '2023-08-26 12:45:42'),
(7, 'fun', '2023-08-26 12:46:28'),
(8, 'Pensée technique', '2023-10-05 12:06:14');

-- --------------------------------------------------------

--
-- Structure de la table `contact`
--

CREATE TABLE `contact` (
  `id` int(11) NOT NULL,
  `uid` int(11) DEFAULT NULL,
  `at` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `mail` varchar(255) NOT NULL DEFAULT '',
  `msg` mediumtext DEFAULT NULL,
  `pub` int(11) DEFAULT NULL,
  `up` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `contact`
--

INSERT INTO `contact` (`id`, `uid`, `at`, `name`, `mail`, `msg`, `pub`, `up`) VALUES
(1, 1, 1, 'dav', 'd', 'ddd', NULL, '2023-08-18 20:03:08'),
(2, 1, 1, 'dav', 'd', 'dddf', NULL, '2023-08-18 20:04:10'),
(3, 1, 1, 'dav', 'd', 'dddfg', NULL, '2023-08-18 20:04:59'),
(4, 1, 1, 'dav', 'd', 'dddfgg', NULL, '2023-08-18 20:06:04'),
(5, 1, 1, 'undefined', 'undefined', 'm', NULL, '2023-08-19 16:49:48'),
(6, 1, 1, '', '', '', NULL, '2023-08-19 18:54:38'),
(7, 0, 1, 'd', 'd', 'd', NULL, '2023-08-27 13:03:20'),
(8, 1, 1, 'name', 'mail', 'msg', NULL, '2023-08-29 09:15:00');

-- --------------------------------------------------------

--
-- Structure de la table `posts`
--

CREATE TABLE `posts` (
  `id` int(11) NOT NULL,
  `uid` int(11) DEFAULT NULL,
  `catid` int(11) DEFAULT NULL,
  `title` varchar(255) NOT NULL DEFAULT '',
  `excerpt` varchar(255) NOT NULL DEFAULT '',
  `content` mediumtext DEFAULT NULL,
  `pub` int(11) DEFAULT NULL,
  `lastup` datetime NOT NULL,
  `up` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `posts`
--

INSERT INTO `posts` (`id`, `uid`, `catid`, `title`, `excerpt`, `content`, `pub`, `lastup`, `up`) VALUES
(1, 1, 1, 'Hello World', 'Présentation du Framework', '[Et cetera:i] est un dispositif d\'édition applicative en Php.\n\n[Présentation:h2]\n\nIl est construit selon une mode qui n\'est pas admissible en prog moderne, et dont les avantages sont sa simplicité, sa rapidité, et l\'espace qu\'il laisse à de nouvelles idées. Les petites chaloupes prennent les virages plus vite que les grands paquebots.\n\nDe nombreux aphorismes viennent à l\'esprit en concevant ce genre de logiciel, qui est une synthèse de très gros travaux faits en amont. L\'idée principale est de faire le maximum avec le minimum de code.\n\nL\'économie maximale de nombre de calculs et de poids du code combinés permettent d\'avoir un « produit » dont les temps d\'exécution peuvent être dix-mille fois supérieurs à celui de logiciels ayant exactement les mêmes compétences. Et donc, il s\'agit aussi de dix-mille fois moins d\'énergie électrique dépensée - ou d\'électrons. Ce n\'est quand même pas rien, par rapport à ses « inconvénients ».\n\nPour obtenir une simplification extrême des processus, la règle est de déplacer le maximum d\'intelligence dans la conception au niveau des structures. Les structures ne pèsent rien et ne sont pas écrites sous forme de code. Habituellement elles sont dédiées à procéder à une sorte de classification typologique des événements qui constituent la moindre action sur le logiciel. Ici, en plus, elles renferment la logique du fonctionnement, un motif répétitif, et une grande somme de principes plus ou moins pris en compte selon les circonstances.\n\nCe n\'est pas possible d\'énumérer tout ce que renferment ces quelques lignes de code, bien qu\'on s\'y essaye dans nos moments philosophiques. Mais en terme général, dans les grandes lignes, l\'ensemble du logiciel fonctionne en Ajax (réaction sur la page sans avoir à la recharger), et il dispose d\'une librairie qui est le Kernel, sur laquelle repose le Core du logiciel (les parties communes), auquel s\'attachent le dossier des applications.\n\nLe Kernel est pensé pour n\'importe quel projet web en terme général et de façon intemporelle. Ce sont des choses qui ne peuvent actuellement exister que sous cette forme et qui doivent nécessairement exister. Les Kernel est très intriqué, n\'importe quelle compétence additionnelle irait s\'infiltrer dans celles existantes. On ne peut pas ajouter ou enlever ce qu\'on veut dans le Kernel.\n\nLe Core contient des compétences communes et classiques, la gestion des blocs (une spécificité du logiciel local), le boot, qui amène la clique de paramètres, construit les css, produit la structure html, et propose le système des connecteurs (mais t\'inquiète qu\'on va y revenir).\n\nLes Apps contiennent finalement les deux seules choses que font ce site, présenter des articles et des commentaires. À la fin, quand il s\'agit de faire un tel logiciel, en connaissant ce qui précède, il ne faut pas plus d\'une heure pour le faire.\n\n[Fonctionnement:h2]\n\nLes trucs notables dans Etc sont :\n\n- Son usage de Json\n\n- Sa façon de faire des requêtes Sql\n\n- Son moteur de templates\n\n- Son moteur Ajax (gestion en ligne, pas de bouton « save » etc)\n\n- Les connecteurs.\n\n[Json:h3]\n\nJson est partout !\n\nLes dispositifs qui reposent sur Json sont :\n\n- Les paramétrages globaux et locaux : chemins d\'accès, choix techniques et stratégiques\n\n- Les définitions de bases de données : les noms des tables, les colonnes et leurs types sont définis de façon logicielle. Ils sont modifiés si les définitions sont modifiées. Cela permet une plus grande sensation de liberté pendant qu\'on compose un logiciel, où les nouvelles idées s\'ajoutent aux nouvelles contraintes.\n\n- Les menus : on peut laisser à l\'utilisateur le soin de confectionner ses menus.\n\n- La verbosité : l\'ensemble des messages système et du vocabulaire employé par le logiciel en réponse aux actions, est paramétrable, et d\'office multilingue.\n\n- Les Css : ils sont entièrement régis en Json, et construits d\'après ces définitions. Cela va beaucoup plus vite, et on peut confier cette gestion à une interface.\n\n- Le Html : lui aussi est géré en Json. Eh oui !\n\n- Les connecteurs : c\'est le système de mise en forme laissé au public.\n\n[Sql:h3]\n\nLe système de requêtes Sql est fait de sorte qu\'on n\'ait qu\'à écrire une ligne de code pour obtenir les données souhaitées. Pour cela il y a peu de choses à savoir, 1) que les requêtes s\'écrivent sous forme de tableaux à protocoles (pour différencier les opérateurs), et 2) que les données retournées doivent prendre la forme d\'un type de tableau, parmi l\'énorme paquet de types de tableaux qui existent, et qui sont tous énumérés selon un autre protocole.\n\n[View:h3]\n\nIl est hors de question que vous mettiez le moindre Html dans le code. C\'est interdit, c\'est mal. On a des machines pour ça. Les définitions de construction des balises est certes un peu rude, mais hyper-généralisable. Les templates peuvent s\'imbriquer les uns aux autres grâce à un constructeur topologique (comme les connecteurs).\n\n[bj():h3]\n\nbj() est le nom de la fonction la plus utilisée partout dans le logiciel, autant qu\'elle soit courte à écrire, pour « bouton ajax ».\n\nElle relève d\'un protocole Ajax qui décide de la cible du résulte, de l\'opération sélectionnées, et des paramètres qui y sont envoyés, de façon statique ou dynamique (par l\'utilisateur). Un cinquième champ sert vaguement à créer des opérations secondaires « au rebond ».\n\nLe moteur Ajax peut laisser le soin à l\'application elle-même de décider de la cible des résultats, qui peuvent être en différents endroits de la page. Dans ce cas le résutat retourné est en Json et va s\'injecter dans le Dom de la page. Et tout cela sans la moindre dépendance logicielle mesdames messieurs ! Profitez-en tant que c\'est encore autorisé ! Lol\n\n[Connecteurs:h3]\n\nOn traduit le Html en Connecteurs en input (conv) et les connecteurs en Html en Output. Depuis les Connecteurs il est très aisé de faire du MarkDown (conversion dans les deux sens), si bien qu\'on peut aussi l\'utiliser dans la mise en forme du contenu. Les images sont absorbées immédiatement après être mises sur la zone d\'édition. Les vidéos et les liens sont interprétés et associés aux applications qui leur conviennent. Pour les Connecteurs chaque tag est une application, si bien qu\'on peut ajouter n\'importe quelle application et appeler un fichier qui en relève au sein d\'un contenu, ou de la page.\n\nAlors question : Pourquoi ne pas utiliser directement le système des Connecteurs pour en faire un système de Templates ? Réponse : On a fait ça pendant longtemps et ça marchait super bien, mais c\'est pénible à éditer. Tandis que le système View, lui, est de plus bas niveau, puisque les Arrays sont déjà construites. Cependant ce n\'est pas plus rapide à exécuter que le hashage de chaîne des Connecteurs. Mais c\'est beaucoup plus confortable d\'y intervenir rapidement sans (trop) se prendre la tête.\n\n[Logo:h2]\n\nLe logo de Etc ressemble à peu près à cela : (en parlant de la bonne époque où les choses étaient simples)\n\n[002968.png]', 1, '2023-08-17 21:09:57', '2023-10-05 12:22:09'),
(2, 2, 8, 'Législation logicielle ', 'La législation est l\'action libre qui consiste à choisir des procédures', 'La législation logicielle est une discipline inconnue et fuie par ceux qui croient que la simplicité existe. Ceux-là trouve bien ce qu\'ils comprennent, mal ce qu\'ils ne comprennent pas. Or plus on met d\'intelligence dans la législation, plus on soulage le code. Elle pèse zéro et prend zéro processeur, donc la plus grande partie du logiciel doit reposer sur elle. On se rend compte de sa pertinence le jour où une innovation ne nécessite aucune ligne de code.\n\nLa doc d\'un logiciel ne peut provenir que de deux sources, le logiciel, et ce qu\'il ne peut pas dire. Le logiciel cite ses propres actions, elles sont descriptives. L\'auteur explique la législation, pour donner les clefs de la compréhension générale.\n\nD\'une langue à l\'autre il arrive qu\'il y ait plusieurs manières de dire le même mot, ou au contraire un seul tesseract de significations. Les discernement servent la compréhension et évite les erreurs et les conflits. Plus un mot est « développé » plus il a de variations. Le développement est par essence le chemin évolutif vers la perfection.\n\nLe terme qui a le plus besoin d\'être développé, est celui de l\'être, que je viens d\'utiliser dans cette phrase. Ce « est » appartient au champ de la complétude. Il est démontrable, et objectif. L\'autre « est » appartient au champ de l\'incomplétude, il nécessite une construction psychologique pour être perçu, et reste subjectif, relatif. Les scientifiques ont fait beaucoup de confusions avec cette histoire de relativité qui leur échappe quand ils y pensent.', 1, '2023-08-16 21:14:58', '2023-10-05 12:18:12'),
(3, 1, 1, 'Choix techniques', 'kernel', '- Les connecteurs sont bien plus puissants que les markdown\n- Ils peuvent potentiellement remplacer le html\n- C\'est une excellente ressource pour l\'éducation, on montrant qu\'on peut faire de belles choses avec des concepts simples\n- Ils représentent la voir du String vers le Array : tout devrait être en Array (config, données, verbose, css, paramètres des fonctions, etc). Les connecteurs permettent d\'écrire des arrays à partir des strings.\n- Le coût d\'exécution des connecteurs est un hashage de string, aussi rapide que la lecture d\'un array.\n- Les connecteurs représentent du XXLHtml, c\'est à dire un langage extensible à l\'infini. N\'importe quelle balise peut être implémentée facilement. Une balise devient de facto une application à part entière.\n- Les Connecteurs peuvent injecter des variables ou en créer à la volée.\n- On peut écrire des applications au format Connecteurs.\n\n*\n\nLe framework Html permet de déléguer l\'écriture du html à des fonctions simples.\n- Les paramètres sont dans un tableau.\n- Les usages classiques sont condensés en fonctions à usage rapide.\n- Il est impropre d\'écrire en dur du html dans du code.\n- Le framework peut contrôler l\'usage des balises. Par exemple quand il s\'est agit de convertir les \"b\" en \"strong\".\n\n*\n\n- Views est un système de template basé sur Json.\n- Au lieu d\'utiliser du html, on utilise des données exploitables.\n- L\'application possède une conscience des variables attendues.\n- Les Views peuvent s\'emboiter comme des poupées russes (au lieu de placer une boucle php dans un template html).\n- Le paramétrage d\'une View peut être orchestré par une application de surface.\n- Une View produit forcément du code html propre.\n- On peut injecter des templates à la volée au format Connecteurs.\n\n*\n\nLe framework Css permet de produire des css propres.\nLes données sont stockées dans un tableau Json.\nLes données peuvent être administrées par une application de surface.\nLe principe des variables de couleurs peut être étendu à des séries de paramètres.\nCss construit une nouvelle feuille de style dès que Json est modifié.\nDe nombreux appendices techniques sont rendus possibles grâce au framework html.\n\n*\n\nHead construit les headers.\n- L\'ensemble des balises du header sont des paramètres enregistrés en Json.\n- On peut facilement ajouter des éléments au headers en cours d\'exécution du code.\n- Les js et css peuvent recevoir un paramètre anti-cache.\n- Les headers peuvent être modifiés a posteriori par javascript.\n\n*', 1, '2023-08-19 18:59:48', '2023-10-05 12:11:38'),
(4, 1, 1, 'La loi', 'Des lois régissent les lois', 'J\'en aurais bien fait un texte mais je n\'ai que quelques twits pour dire mon idée avant de retourner au champ de pierres que je dois casser toute la journée sans savoir pourquoi, alors que c\'est idiot, il y en a déjà plein, des petites.\n\n Imagine que le boulot du gars consiste à ranger des bouteilles, et en arrivant après lui, tu constates qu\'il les a mises à l\'envers. Tu es choqué, tu comprends pas, est-ce de la provocation ou bien, selon la stricte logique, ignore-t-il ce que sont &laquo; des bouteilles &raquo; ?\n\n Et même en ignorant ce que sont &laquo; des bouteilles &raquo;, ne paraît-il pas plus &laquo; logique &raquo; de les mettre &laquo; à l\'endroit &raquo;, tel que nous les nommons ? Vu que le haut semble plus fragile. On peut lui demander : Pourquoi tu as fait ça ?\n\n Il répondra vraisemblablement qu\'il n\'en sait rien, qu\'effectivement il ne connaît pas ces objets, n\'en a jamais vu, et a estimé que c\'était assez solide pour tenir dans ce sens, et selon lui, plus joli. On pourra ausculter ses raisons.\n\n Je veux dire que &laquo; la raison &raquo; dépend de la connaissance, et qu\'une connaissance commune fabrique des raisons cohérentes entre elles. La plupart du temps, sans s\'en rendre compte, et sinon, on est interloqués.\n\n Un exemple moins grossier permet d\'approfondir : Cette personne ne comprend pas pourquoi il ne faut pas acheter des produits avec des emballages plastiques, qui finissent dans la nature et donc dans son estomac.\n\n Pour elle, quand on les jette à la poubelle ils disparaissent de sa vue donc le problème est réglé. Sous la pression de sa fille elle décide d\'acheter des récipients en verre, et d\'y loger toutes ses denrées, après avoir bien sûr jeté tous les emballages.\n\n Elle ne comprend pas le principe. C\'est très drôle, on en rit, mais on touche à quelque chose d\'essentiel : la compréhension, la conscience, la raison, le discernement. La différence entre le bien et le mal.\n\n L\'éducation. Elle consiste à enseigner aux enfants à acheter de récipients en verre pour y mettre des denrées dont on a jeté le plastique pour &laquo; enseigner &raquo; &laquo; des principes &raquo;... qu\'en réalité même les enseignants ignorent.\n\n Ils agissent par réplication, mimétisme, imprégnation, et même par le forçage si jamais il y en a qui osent poser des questions. Mais les vraies raisons restent obscures, confuses, à part simplement qu\'elles sont associées à une répression brutale.\n\n Une société plonge naturellement vers la dictature dès que les liens avec la raison ne sont plus solides et conscients, mais inculqués par la force, au point de finit par perdre le fil de cette même raison, disparue depuis longtemps.\n\n Petit à petit les comportements, les connaissances, les notions du bien et de mal sont associées à des choses qui ne sont jamais interrogées et qui n\'ont jamais leur place dans les discussions, qui seraient trop longues.\n\n On peut par exemple définir qu\'il est obligatoire d\'avoir des bols en verre. Que ceux qui n\'ont pas de bols en verre sont de mauvais citoyens, qu\'il faut brimer et punir. Sans que personne ne sache pourquoi ils agissent ainsi.\n\n Les gens ont juste, naturellement, culturellement, et d\'une façon tellement répétée au fil des générations qu\'elle est inculquée dans l\'Adn, ont &laquo; confiance &raquo; en la Loi. Toute loi est stricte est imparable. C\'est comme une loi elle-même.\n\n Alors on peut créer n\'importe quelle loi. On peut profiter de la crédulité des gens. On peut leur faire faire n\'importe quoi, et guider leurs comportements en fonction des besoins, des avantages et du confort du législateur, qui baigne dans le luxe.\n\n À un moment donné on a le droit d\'être intelligent, c\'est pourquoi je dis toujours à mes élèves, à qui j\'enseigne à casser du caillou, pour que leur bagne soit efficace et le patron content, que les lois n\'ont que la valeur de leur logique.\n\n Les lois, pour être des lois, doivent être aimées, et pour être défendues elles doivent être défendables. Si on accepte une loi, on en devient le législateur, et on doit pouvoir se justifier, personnellement, et non en disant juste [voix grave] &laquo; c\'est la loi &raquo;.\n\n C\'est à l\'humain qu\'il revient de tisser les liens de la raison pour que sa société soit en paix. La paix découle de la logique, et la logique associe les connaissances entre elles. Et cette loi-là, à la différence des lois libres, est inéluctable.', 1, '2023-08-22 20:55:00', '2023-10-05 12:22:06'),
(18, 1, 1, 'Perles de la prog', 'Des fois les mecs ils ne savent pas ce qu\'ils disent', 'Perles de la #prog - Pour pas que ce soit le bordel, utilisez des namespaces. Mais attention, il est vivement conseillé de ne pas utiliser deux fois le même nom de classe, même sur deux namespaces différents, surtout si on a besoin des deux en même temps.\n\nDe même, choisissez des namespaces qui ne soient pas déjà utilisés par n\'importe quelle autre librairie dans le monde.\n\n- « Pour la sécurité de vos mots de passes, utilisez dotenv. Attention, la clef publique doit absolument rester secrète ».\n\n- « Les dépendances applicatives peuvent être dangereuses. Pour vous assurer de la maintient, sentez-vous libre de financer exactement les dépendances que vous utilisez ».\n\n(non mais sérieux, à chaque fois les mecs ne voient même pas la contradiction dans ce qu\'ils racontent)\n\nen fait, en terme général (c\'est très instructif) les problèmes de sécurité ne sont jamais résolus, ils sont insolubles, et les solutions ne servent qu\'à déplacer le problème, le plus souvent, dans un endroit où ce sera pire.\n\nParce qu\'un « problème de sécurité » n\'est pas un problème, c\'est un jugement. On ne mélange pas les jugements et les choses réelles. Ou sinon on se retrouve à chasser des fantômes.\n\nTypiquement, « être en sécurité », « se sentir en sécurité » résulte de l\'acceptation d\'une domination qui se prétend « protectrice ». Alors pourtant que sait tous très bien, l\'histoire ne fait que le répéter, que ça va mal finir. Et que le problème, il est dans ta tête.', 1, '2023-08-24 22:15:21', '2023-10-05 12:22:06'),
(19, 1, 4, 'Crévidence ', 'Bon mot', 'Crévidence (mot inventé par Dav) : croyance qui fonctionne comme une évidence, sur laquelle on ne s\'est jamais interrogé et qu\'on n\'a jamais nommée, sur laquelle se basent les certitudes, dont la fausseté dénote dans le soubassement de la construction psychologique une crévidence.\n\npar exemple le fait de n\'avoir consacré qu\'une fraction de seconde à une réflexion, et de l\'avoir immédiatement acquise pour vraie, sans se demander s\'il est raisonnable qu\'une telle idée puisse se contenter d\'une fraction de seconde de réflexion.', 1, '2023-08-26 14:15:18', '2023-11-09 23:59:30'),
(20, 1, 8, 'Disquettes', 'Aphorismes et autres penées', 'Le truc est que j\'ai oublié de noter la raison de certains choix. C\'est une erreur, d\'autant qu\'elle fait perdre du temps. C\'est sensé découler de la logique, et ne pas à être signalé, mais on peut très bien passer devant en se demandant pourquoi cette chose étrange est là, et croire qu\'on va la corriger.\n\n*\n\nIl arrive quand quand il y a un seul truc qui ne marche pas, ça révèle un parapluie d\'erreurs qui mérite une attention spéciales.\n\n*\n\nC\'est imaginaire de croire qu\'on peut construire un logiciel en suivant des étapes bien établies et délimitées. Au lieu de faire 1, 2, 3, la réalité nous amène plutôt à devoir faire 1, 2, réviser 1, finir 2, 3, réviser 1, réviser 2, finir 3. Un truc du genre.\n\n*\n\nLes différents indicateurs des notes de dev sont : fix, add, reform, ehance,\n\n*\n\nDes fois tu passes la journée entière à faire que le truc marche comme tu croyais qu\'il marchait le matin avant de faire ce que tu avais prévu.\n\n*\n\nOn a l\'impression que le logiciel nous parle. Quand on fait une trouvaille, c\'est comme si l\'ensemble du système se mettait soudainement à réclamer d\'être en harmonie avec l\'esprit de cette trouvaille.\n\n*\n\nQuand tu ne maintient pas un code depuis un certain temps, il te le fait bien sentir.\n\n*\n\nC\'est dans mes entrailles des problèmes insolubles (facilement) que naissent les révolutions et les changements de paradigmes (qui vont coûter de la bande passante mais allons-y quand même)\n\n*\n\nTravailler dans la précipitation ne mène qu\'à perdre du temps. Mieux vaut aller se promener et continuer demain.\n\n*\n\nConcernant les règles de nommage, la linguistique enseigne à distinguer la qualité de la description - ce qui ne se fait pas assez dans le langage courant. Un \'article\' est une qualité, d\'un objet qui se présente sous forme de texte. La séparation de la couche narrative doit être l\'enjeu du système de nommage. Le vocable doit être situé à l\'extérieur du code. C\'est valable pour les messages d\'alerte comme pour les notions du métier. Le code doit n\'être que fonctionnel, on fait tel truc, on ne sait pas à quoi ça sert, mais ça marche comme ça. Cela ne sert à rien de savoir à quoi ça sert ou comment on le nomme dans telle ou telle région du monde. Il n\'y a pas assez de place dans la tête d\'un développeur pour en plus y mettre des notions psychopolitiques.\n\n*\n\nC\'est con à dire mais : il ne faut jamais croire qu\'on s\'est trompé. Il faut toujours vérifier si on a eu raison.\n\n*\n\nQuand tu rencontres un problème, la première question à se poser est de savoir si on est d\'humeur à résoudre un problème.\n\n*\n\nNon, on ne pense pas à toutes les choses d\'un coup, de même qu\'on ne pense pas à tout, du premier coup. C\'est là que la passion ou la lassitude font la différence. C\'est aussi une crévidence qui n\'appartient qu\'aux faibles d\'esprit.\n\n*\n\nCeux qui pensent en termes de revue de code, de Psr-4, et de conformité aux exigences de l\'industrie (à décorer le code tel qu\'on s\'y attend) devraient au moins avoir la crainte sourde de très rapidement faire partie de la préhistoire.\n\n*\n\nLa législation logicielle est une discipline inconnue et fuie par ceux qui croient que la simplicité existe. Ceux-là trouve bien ce qu\'ils comprennent, mal ce qu\'ils ne comprennent pas. Or plus on met d\'intelligence dans la législation, plus on soulage le code. Elle pèse zéro et prend zéro processeur, donc la plus grande partie du logiciel doit reposer sur elle. On se rend compte de sa pertinence le jour où une innovation ne nécessite aucune ligne de code.\n\n*\n\nLa doc d\'un logiciel ne peut provenir que de deux sources, le logiciel, et ce qu\'il ne peut pas dire. Le logiciel cite ses propres actions, elles sont descriptives. L\'auteur explique la législation, pour donner les clefs de la compréhension générale.\n\n*\n\nD\'une langue à l\'autre il arrive qu\'il y ait plusieurs manières de dire le même mot, ou au contraire un seul tesseract de significations. Les discernement servent la compréhension et évite les erreurs et les conflits. Plus un mot est &laquo; développé &raquo; plus il a de variations. Le développement est par essence le chemin évolutif vers la perfection.\n\n*\n\nLe terme qui a le plus besoin d\'être développé, est celui de l\'être, que je viens d\'utiliser dans cette phrase. Ce &laquo; est &raquo; appartient au champ de la complétude. Il est démontrable, et objectif. L\'autre &laquo; est &raquo; appartient au champ de l\'incomplétude, il nécessite une construction psychologique pour être perçu, et reste subjectif, relatif. Les scientifiques ont fait beaucoup de confusions avec cette histoire de relativité qui leur échappe quand ils y pensent.\n\n*\n\nContrairement à la Poo qui sert à / prétend permettre d\'ajouter autant de fonctionnalités à la chaîne les unes des autres, le Composant structuré (Cs) offre une voie de développement en complexité à n\'importe quelle fonctionnalité.\n\n*\n\nSi le but est de partir de zéro et de centraliser ensuite les tâches répétitives au fur et à mesure de l\'augmentation en complexité, commencer sur la base de la Poo non-statique est déjà une complexité inutile. J\'ai toujours cherché à faire le code le plus minimal possible en nombre de calculs et en complexité. C\'est comme ça qu\'est né le principe de législation logicielle, en plaçant dans la connaissance des éléments de l\'application, de sorte qu\'il ne reste que des maths. Chaque chose doit n\'avoir lieu qu\'une fois, et (ce n\'est pas possible de se le représenter graphiquement) tous les processus passent par un seul endroit.\n\n*\n\nSi je n\'ai jamais utilisé de Poo c\'est parce qu\'il n\'y en a eu aucun usage. Les arguments en sa faveur sont de l\'ordre de la confusion entre les procédures et la logique (la structure, ou le fait de déporter dans la connaissance des parties du logiciel). Le code n\'est pas sensé parler de la logique, elle est sensée être connue ou reconnue. Et la Poo aujourd\'hui consiste à légiférer sur une et une seule logique comme si c\'était la seule, de sorte à exclure de sortir de ce schéma étroit, autant en terme d\'innovation que de croissance en complexité. Ces arguments sont la maintenance et le fait que les gens s\'y retrouvent. Mais la maintenance est un enfer, tout ce qu\'on voit est vite désuet, et le fait de s\'y retrouver n\'est qu\'une question de connaissance des structures existantes.\n\n*\n\n&laquo; Il faut absolument réprimer les développeurs et les conduire vers une tendance maniaco-dépressive axée sur le trouble obsessionnel compulsif, afin qu\'ils accordent une importance démesurée aux choses factices et qu\'ils relèguent la complexité à une autorité externe, et impossible à remettre en cause. Qu\'ils se sentent impuissants et qu\'ils se battent entre eux. Qu\'ils soient remplaçables et dépersonnalisés. Si un inculte veut devenir développeur, accueillez-le comme au club Med. Si l\'un deux commence à dire qu\'il a réfléchit et qu\'il a eu des idées, abattez-le, humiliez-le, discréditez-le. Il ne faut surtout pas que ces gens, qui ont un pouvoir immense entre leurs mains, s\'en rendent compte, et qu\'il leur vienne l\'idée qu\'ils pourraient rendre ce monde bien meilleur, et se débarrasser de nous, leurs maîtres ! &raquo;', 1, '2023-10-05 12:17:08', '2023-10-05 12:22:08');

-- --------------------------------------------------------

--
-- Structure de la table `profile`
--

CREATE TABLE `profile` (
  `id` int(11) NOT NULL,
  `uid` int(11) DEFAULT NULL,
  `surname` varchar(255) NOT NULL DEFAULT '',
  `slogan` varchar(255) NOT NULL DEFAULT '',
  `banner` varchar(255) NOT NULL DEFAULT '',
  `logo` varchar(255) NOT NULL DEFAULT '',
  `up` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `profile`
--

INSERT INTO `profile` (`id`, `uid`, `surname`, `slogan`, `banner`, `logo`, `up`) VALUES
(1, 1, 'etc...', 'Framework de Papy<br>', '<br>', '24601_4_1.jpg', '2023-10-05 10:17:44'),
(2, 2, 'd', 'here', 'IC1396,Hubble5-cropped-lrg.jpg', '15765888.png', '2023-08-19 19:26:11'),
(3, 0, 'kjhkhj', 'kjh', '', '', '2023-08-20 20:23:32'),
(4, 0, 'hjhjjhg', '', '', '', '2023-08-20 20:25:05'),
(5, 0, '', '', '', '', '2023-08-20 20:27:08'),
(6, 0, '', 'ee', '', '', '2023-08-20 20:27:12'),
(7, 0, 'e', 'e', 'eeee', '', '2023-08-20 20:27:17'),
(8, 0, 'jhjuh', '', '', '', '2023-08-20 20:38:15');

-- --------------------------------------------------------

--
-- Structure de la table `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `pos` int(11) DEFAULT NULL,
  `role` varchar(60) NOT NULL DEFAULT '',
  `up` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `roles`
--

INSERT INTO `roles` (`id`, `pos`, `role`, `up`) VALUES
(1, 6, 'admin', '2023-08-17 20:15:47'),
(2, 5, 'editor', '2023-08-17 20:15:47'),
(3, 4, 'publisher', '2023-08-17 20:15:47'),
(5, 3, 'reviewer', '2023-08-17 20:15:47'),
(6, 2, 'tracker', '2023-08-17 20:15:47'),
(7, 1, 'reader', '2023-08-17 20:15:47');

-- --------------------------------------------------------

--
-- Structure de la table `socials`
--

CREATE TABLE `socials` (
  `id` int(11) NOT NULL,
  `uid` int(11) DEFAULT NULL,
  `url` varchar(255) NOT NULL DEFAULT '',
  `up` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `socials`
--

INSERT INTO `socials` (`id`, `uid`, `url`, `up`) VALUES
(1, 1, 'facebook.com', '2023-08-18 10:30:51'),
(2, 1, 'youtube.com', '2023-08-18 10:31:33'),
(3, 1, 'linkedin.com', '2023-08-18 10:31:33');

-- --------------------------------------------------------

--
-- Structure de la table `tracks`
--

CREATE TABLE `tracks` (
  `id` int(11) NOT NULL,
  `uid` int(11) DEFAULT NULL,
  `bid` int(11) DEFAULT NULL,
  `txt` mediumtext DEFAULT NULL,
  `pub` int(11) DEFAULT NULL,
  `up` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `tracks`
--

INSERT INTO `tracks` (`id`, `uid`, `bid`, `txt`, `pub`, `up`) VALUES
(1, 1, 1, 'hello', 0, '2023-11-14 10:40:46'),
(4, 1, 2, 'hello', 1, '2023-08-18 10:27:05'),
(5, 1, 2, 'hello', -1, '2023-10-05 12:05:08'),
(6, 1, 2, 'hellooo', -1, '2023-10-05 12:05:06'),
(7, 1, 1, 'jhhhj', -1, '2023-08-18 10:47:50'),
(8, 1, 1, 'jhgjh', -1, '2023-08-18 10:48:36'),
(9, 1, 2, 'ghgg', -1, '2023-10-05 12:05:05'),
(10, 1, 2, 'klk', -1, '2023-10-05 12:05:03'),
(11, 1, 18, 'hello', 1, '2023-08-24 20:21:29'),
(12, 1, 3, 'hooo', 1, '2023-08-24 20:23:49'),
(13, 1, 2, 'jkhk', -1, '2023-10-05 12:05:01'),
(14, 1, 2, 'kjhkjh', -1, '2023-10-05 12:05:00'),
(15, 1, 3, 'hkjjk', 0, '2023-08-25 22:19:15'),
(16, 1, 3, 'kjhkj', 0, '2023-08-25 22:22:17'),
(17, 3, 3, '', 0, '2023-08-25 22:22:46'),
(18, 4, 3, 'jhk', 0, '2023-08-25 22:23:30'),
(19, 5, 3, 'hkjk', 0, '2023-08-25 22:24:47'),
(20, 6, 3, '', 0, '2023-08-25 22:33:45'),
(21, 1, 1, 'hola', -1, '2023-08-26 19:41:32'),
(22, 1, 1, 'hhjgjj', -1, '2023-08-26 19:42:33'),
(23, 1, 1, 'kjkjh', -1, '2023-08-26 19:46:40'),
(24, 1, 1, 'kjhkhkjh', -1, '2023-10-05 10:19:25'),
(25, 1, 4, '', -1, '2023-08-27 11:56:59'),
(26, 7, 4, 'dd', 1, '2023-11-14 10:41:56'),
(27, 1, 4, 'fgfgh', -1, '2023-10-05 12:13:26'),
(28, 1, 19, 'jhgj', 1, '2023-11-09 23:59:41'),
(29, 1, 19, 'hghh', 1, '2023-11-14 10:41:49'),
(30, 1, 19, 'jhgjgh', 1, '2023-11-14 10:41:48');

-- --------------------------------------------------------

--
-- Structure de la table `twit`
--

CREATE TABLE `twit` (
  `id` int(11) NOT NULL,
  `ib` bigint(36) DEFAULT NULL,
  `twid` bigint(36) DEFAULT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `screen_name` varchar(255) NOT NULL DEFAULT '',
  `user_id` bigint(36) DEFAULT NULL,
  `date` int(11) DEFAULT NULL,
  `text` mediumtext DEFAULT NULL,
  `media` varchar(60) NOT NULL DEFAULT '',
  `lang` varchar(60) NOT NULL DEFAULT '',
  `up` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `auth` int(11) DEFAULT NULL,
  `mail` varchar(255) NOT NULL DEFAULT '',
  `pswd` varchar(255) NOT NULL DEFAULT '',
  `ip` varchar(255) NOT NULL DEFAULT '',
  `up` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `name`, `auth`, `mail`, `pswd`, `ip`, `up`) VALUES
(1, 'dav', 6, 'd', '$2y$10$hm6XKfNHbG99WgOg3OHplexeCncNHaMZVPV8W6ku1F1KHK9L1fePC', '', '2023-08-19 19:19:28'),
(2, 'd', 1, 'd', '$2y$10$nVMcAiStRALH497AfBpfceoJblScD3dx/tMROpyTLbcqT34.UH9yS', '', '2023-08-19 19:26:11'),
(3, '3', 1, '', '$2y$10$cGsKGSVRoldjP0I1/4jYbev6qDq6ZyPcSE32xEH6hoB748a2gpx6e', '', '2023-08-25 22:22:46'),
(4, '3', 1, 'jhk', '$2y$10$dW0jKSBbs7K0M8E9s9wsx.C20pXTgqnF9Ii3mMLEr3/sj5NzHuuOC', '', '2023-08-25 22:23:30'),
(5, '3', 1, 'hkjk', '$2y$10$YJ69OAO76/Etdi9EhKTQr.UIMoYriaIAK1sbYUSPbzVelqTLRaRpy', '', '2023-08-25 22:24:47'),
(6, 'kjh', 1, 'kjk', '$2y$10$gXzVBoDhMkxQ/yy5jKFwnuS71BIUqyPlyltbgS6.C/irzibN2c2Fy', '', '2023-08-25 22:33:45'),
(7, 'dd', 1, 'dd', '$2y$10$KWH2gcO7KyZlQnFZjSo0megOwDp5gjiFaIkTHVucNyJ2XYgrhSxnG', '', '2023-08-27 12:40:36');

-- --------------------------------------------------------

--
-- Structure de la table `_prog`
--

CREATE TABLE `_prog` (
  `id` int(11) NOT NULL,
  `dir` varchar(255) NOT NULL DEFAULT '',
  `page` varchar(255) NOT NULL DEFAULT '',
  `func` varchar(255) NOT NULL DEFAULT '',
  `vars` varchar(255) NOT NULL DEFAULT '',
  `code` mediumtext DEFAULT NULL,
  `uses` int(11) DEFAULT NULL,
  `up` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `_prog`
--

INSERT INTO `_prog` (`id`, `dir`, `page`, `func`, `vars`, `code`, `uses`, `up`) VALUES
(1, 'src/php/app', 'contact', 'save', '$p', '[$a,$b,$c]=vals($p,[\'name\',\'mail\',\'msg\']); $ex=\'\';\r\nif(!filter_var($b,FILTER_VALIDATE_EMAIL))return alert(\'bad_mail2\',\'red\');\r\nif($a && $b && $c)$ex=sql::sav(\'contact\',[ses(\'uid\'),cnfg(\'usrhome\'),$a,$b,$c,1],0);\r\nif($ex)return alert(\'received\',\'green\');\r\nelse return alert(\'error\',\'red\');', 0, '2023-10-01 16:45:02'),
(2, 'src/php/app', 'contact', 'read', '$p', '$ret=\'\';\r\n[$a,$b,$c]=vals($p,[\'a\',\'b\',\'c\']);\r\n$r=sql::read(\'name,msg as txt,mail,date_format(up,\"%d/%m/%Y\") as date\',\'contact\',\'ra\',[\'_order\'=>\'up desc\']);\r\n//return build::tabler($r,[\'from\',\'txt\',\'mail\',\'date\']);\r\nforeach($r as $k=>$v){$v[\'pub\']=\'\';\r\n$ret.=view::call(\'track\',$v);}\r\nreturn $ret;', 1, '2023-10-01 16:45:02'),
(3, 'src/php/app', 'contact', 'call', '$p', '[$a,$b]=vals($p,[\'a\',\'b\']);\r\n$bt=h3(voc(\'contact_bt\'));\r\n$ret=bj(\'main|contact,save||name,mail,msg\',icovoc(\'send\'),\'btsav\');\r\n$ret.=div(input(\'name\',\'\',44).label(\'name\',voc(\'name_bt\')));\r\n$ret.=div(input(\'mail\',\'\',44).label(\'mail\',voc(\'mail_bt\')));\r\n$ret.=div(label(\'msg\',voc(\'message\')));\r\n$ret.=div(textarea(\'msg\',\'\',\'\',12),\'area\');\r\nreturn $bt.div($ret,\'\',\'tgmail\');', 0, '2023-10-01 16:45:02'),
(4, 'src/php/app', 'posts', 'usrart', '$id', 'return sql::read(\'uid\',\'posts\',\'v\',$id);', 3, '2023-10-01 16:45:02'),
(5, 'src/php/app', 'posts', 'catid', '$a', '$catid=sql::read(\'id\',\'cats\',\'v\',[\'category\'=>$a]);\r\nif(!$catid)$catid=sql::sav(\'cats\',[$a]);\r\nreturn $catid;', 2, '2023-10-01 16:45:02'),
(6, 'src/php/app', 'posts', 'content', '$p', '$d=sql::read(\'content\',\'posts\',\'v\',$p[\'id\']);\r\nreturn conn::embed_p($d);', 1, '2023-10-01 16:45:02'),
(7, 'src/php/app', 'posts', 'del', '$p', '[$a,$b,$ok]=vals($p,[\'a\',\'b\',\'ok\']);\r\nif(!$ok){\r\n    $ret=bj(\'main|posts,del|a=\'.$a.\',ok=1\',icovoc(\'cry\',\'really?\'),\'btdel\');\r\n    $ret.=bj(\'main|posts,read|a=\'.$a,icovoc(\'laugh\',\'no!\'),\'btn\');\r\n    return $ret;}\r\nelse sql::upd(\'posts\',[\'pub\'=>-1],[\'id\'=>$a]);\r\nreturn bh(\'main|posts,call\',icovoc(\'back\',\'done\'),\'bigbt\');', 0, '2023-10-01 16:45:02'),
(8, 'src/php/app', 'posts', 'save', '$p', '[$a,$b,$c,$d]=vals($p,[\'cat\',\'tit\',\'exc\',\'msg\']);\r\n$catid=self::catid($a);\r\n$ex=sql::sav(\'posts\',[ses(\'uid\'),$catid,$b,$c,$d,0,sqldate()],0);\r\nif($ex)return self::read([\'a\'=>$ex,\'b\'=>\'\']);\r\nelse return alert(\'error\',\'red\');', 1, '2023-10-01 16:45:02'),
(9, 'src/php/app', 'posts', 'update', '$p', '[$id,$c,$d]=vals($p,[\'id\',\'col\',\'val\']);\r\nif($c==\'content\')$d=conv::build([\'txt\'=>$d]);\r\nelse $d=strip_tags($d);\r\n$d=delnbsp($d);\r\n$r=[$c=>$c==\'catid\'?self::catid($d):$d];\r\nif($d)$ok=sql::upd(\'posts\',$r,$id);\r\nif($c==\'content\')$d=conn::build([\'txt\'=>$d,\'m\'=>0,\'id\'=>$id]);\r\nreturn $d;', 0, '2023-10-01 16:45:02'),
(10, 'src/php/app', 'posts', 'create', '$p', '$ex=sql::read(\'id\',\'posts\',\'v\',[\'uid\'=>ses(\'uid\'),\'title\'=>voc(\'title\')]);\r\nif(!$ex)$ex=self::save([\'cat\'=>\'public\',\'tit\'=>voc(\'title\'),\'exc\'=>voc(\'excerpt\'),\'msg\'=>voc(\'text\')]);\r\nreturn self::read([\'a\'=>$ex]);', 1, '2023-10-01 16:45:02'),
(11, 'src/php/app', 'posts', 'datas', '$p', '$q=[];\r\n[$a,$b,$inp]=vals($p,[\'a\',\'b\',\'inp\']);\r\nif(is_numeric($a))$q[\'b2.id\']=$a;\r\nelseif($a)$q[\'category\']=$a;\r\nif($inp)$q[\'%content\']=$inp;\r\n$pbs=[\'1\']; if(auth(4)){$pbs[]=\'0\'; $pbs[]=-1;} $q[\'pub(\']=$pbs;\r\n$q[\'_group\']=\'b2.id\';\r\n$cl=\'b2.id,uid,title,category,excerpt,content,pub,date_format(lastup,\"%d/%m/%Y\") as up\';\r\n$r=sql::inner($cl,\'cats\',\'posts\',\'catid\',\'ra\',$q);\r\nreturn $r;', 2, '2023-10-01 16:45:02'),
(12, 'src/php/app', 'posts', 'read', '$p', '[$a,$b]=vals($p,[\'a\',\'b\']); $pr=[]; $pr1=[]; $pr2=[];\r\n$r=self::datas($p); if($r)$r=$r[0];\r\nif(!$r)return alert(\'nothing\',\'red\');\r\n$own=ses(\'uid\')==$r[\'uid\']?1:0;\r\nif(!auth(4) && $own && $r[\'pub\']<1)return alert(\'moderated\',\'red\');\r\nif(auth(6) or ($own && $r[\'pub\']>0)){\r\n    $pr=[\'contenteditable\'=>\'false\',\'class\'=>\'editable\'];\r\n    $pr1=[\'onclick\'=>\'editxt(this,\'.$a.\')\',\'onblur\'=>\'savtxt(this,\'.$a.\')\'];\r\n    $pr2=[\'ondblclick\'=>\'editbt(\\\'content\\\',\'.$a.\',1)\'];}//,\'onblur\'=>\'savtxt(this,\'.$a.\',1)\'\r\n$r[\'date\']=$r[\'up\'];\r\n$r[\'author\']=sql::read(\'name\',\'users\',\'v\',[\'id\'=>$r[\'uid\']]);\r\n$r[\'pub\']=auth(4)?admin::bt($a,$r[\'pub\'],\'posts\'):\'\';\r\n$r[\'pub\'].=auth(4)?bj(\'post\'.$a.\'|posts,del|a=\'.$a,ico(\'trash\'),\'\'):\'\';\r\n$r[\'title\']=tag(\'div\',[\'id\'=>\'title\']+$pr+$pr1,$r[\'title\']);\r\n$r[\'excerpt\']=tag(\'div\',[\'id\'=>\'excerpt\']+$pr+$pr1,$r[\'excerpt\']);\r\n$r[\'category\']=tag(\'span\',[\'id\'=>\'catid\']+$pr+$pr1,$r[\'category\']);\r\n$txt=conn::build([\'txt\'=>$r[\'content\'],\'m\'=>0,\'id\'=>$a]);\r\n$r[\'content\']=tag(\'div\',[\'id\'=>\'content\']+$pr+$pr2,$txt);\r\n//$r[\'editbt\']=\'\';\r\n$r[\'editbt\']=conns::btedt([\'id\'=>$a,\'sav\'=>1]);\r\n//$r[\'editbt\']=auth(4)?btj(\'editbt\',[\'content\',$a],voc(\'edit\'),\'btn\',[\'id\'=>\'bt\'.$a]):\'\';\r\n$r[\'tracks\']=tracks::call($p);\r\n$bt=bh(\'posts\',icovoc(\'back\',\'back\'),\'bigbt\');\r\n$ret=view::call(\'post\',$r);\r\nreturn $bt.$ret;', 4, '2023-10-01 16:45:02'),
(13, 'src/php/app', 'posts', 'stream', '$p', '[$a,$b,$inp]=vals($p,[\'a\',\'b\',\'inp\']);\r\n$ret=div(bj(\'main|post,call||inp\',icovoc(\'gosearch\',\'search_bt\',\'react\'),\'btsav\').\' \'.input(\'inp\',$inp,14),\'right\');\r\n$ret.=h3($a?ucfirst($a):voc(\'posts_title\'));\r\n$r=self::datas($p);\r\n$ret.=div(count($r).\' \'.voc(\'posts_nb_title\'),\'bigbt\');\r\nif(auth(4))$ret.=bh(\'create\',icovoc(\'plus\',\'create_bt\',\'react\'),\'bigbt\');\r\nforeach($r as $k=>$v){\r\n    $r[$k][\'date\']=$v[\'up\'];\r\n    //$r[$k][\'pub\']=auth(4)?admin::bt($v[\'id\'],$v[\'pub\'],\'posts\'):\'\';\r\n    $r[$k][\'author\']=sql::read(\'surname\',\'profile\',\'v\',[\'uid\'=>$v[\'uid\']]);\r\n    $r[$k][\'tracks_nb\']=sql::read(\'count(id)\',\'tracks\',\'v\',[\'bid\'=>$v[\'id\']]);\r\n    $r[$k][\'tracks_nb_title\']=voc(\'tracks_nb_title\');}\r\nforeach($r as $k=>$v)$ret.=view::call(\'posts\',$v);\r\nreturn $ret;', 1, '2023-10-01 16:45:02'),
(14, 'src/php/app', 'posts', 'call', '$p', 'if(is_numeric($p[\'a\']??\'\'))$ret=self::read($p);//avoid post/public\r\nelse $ret=self::stream($p);\r\nreturn $ret;', 1, '2023-10-01 16:45:02'),
(15, 'src/php/app', 'test', 'md', '$p', '$ret=\'\';\r\n    [$a,$b]=vals($p,[\'a\',\'b\']);\r\n    $d=\'\r\n[title:h1]\r\n\r\n[hello:b]\r\n\r\ntext\r\n[hola:i]\r\n\r\nhey hey [hey:code] hey [hey:i]\';\r\n    $d1=conn::build([\'txt\'=>$d,\'\',\'\']);//conn2html\r\n    eco($d1);\r\n    $d2=conn::build([\'txt\'=>$d,\'parser\'=>\'conn::markdown\',\'nop\'=>1]);//conn2md\r\n    eco($d2);\r\n    $d4=conv::md2conn($d2);\r\n    eco($d4);', 1, '2023-10-01 16:45:02'),
(16, 'src/php/app', 'test', 'jaja', '', 'return [\'one\'=>1,\'two\'=>2,\'three\'=>3];', 0, '2023-10-01 16:45:02'),
(17, 'src/php/app', 'test', 'jajax', '', '$ret=div(\'one\',\'\',\'one\');\r\n	$ret.=div(\'two\',\'\',\'two\');\r\n	$ret.=div(\'three\',\'\',\'three\');\r\n	$ret.=div(\'\',\'\',\'cb\');\r\n	$ret.=bj(\',|test,jaja|one,two,three\',ico(\'ok\'));\r\n	return $ret;', 1, '2023-10-01 16:45:02'),
(18, 'src/php/app', 'test', 'call', '$p', '//return self::md($p);\r\n//$ok=build::ftpchmod(\'src\',777); return $ok?1:0;\r\nreturn self::jajax();', 0, '2023-10-01 16:45:02'),
(19, 'src/php/app', 'tracks', 'del', '$p', '[$a,$b,$ok]=vals($p,[\'a\',\'b\',\'ok\']);\r\nif(!$ok){\r\n    $ret=bj(\'track\'.$b.\'|tracks,del|a=\'.$a.\',b=\'.$b.\',ok=1\',voc(\'really?\'),\'btdel\');\r\n    $ret.=bj(\'track\'.$b.\'|tracks,read|a=\'.$b,icovoc(\'laugh\',\'no!\'),\'btn\');\r\n    return $ret;}\r\nelse sql::upd(\'tracks\',[\'pub\'=>-1],[\'id\'=>$b]);', 0, '2023-10-01 16:45:02'),
(20, 'src/php/app', 'tracks', 'edit', '$p', '[$a,$b]=vals($p,[\'a\',\'b\']);\r\n$r=sql::read(\'id,title,category,excerpt,content,date\',\'posts\',\'a\',[\'id\'=>$a]);\r\n$r[\'date\']=date(\'ymd\',strtotime($r[\'date\']));\r\n$r[\'name\']=sql::read(\'name\',\'users\',\'v\',[\'id\'=>$a]);\r\n$ret=view::call(\'post\',$r);return $ret;', 0, '2023-10-01 16:45:02'),
(21, 'src/php/app', 'tracks', 'register', '$p', '$uid=\'\';\r\n[$a,$b,$c]=vals($p,[\'name\',\'mail\',\'pswd\']);\r\n$ex=login::uid($a); $uid=\'\';\r\nif($ex)self::$er=\'name_exists\';\r\nelseif(!filter_var($b,FILTER_VALIDATE_EMAIL))self::$er=\'bad_mail\';\r\nelse $uid=sql::sav(\'users\',[$a,1,$b,login::hash($c)]);\r\nif($uid)login::identify($uid);\r\nreturn $uid;', 1, '2023-10-01 16:45:03'),
(22, 'src/php/app', 'tracks', 'save', '$p', '$uid=ses(\'uid\'); $ret=\'\'; $psw=\'\'; $er=\'\'; $ok=\'\'; $psw=\'\'; $ex=\'\';\r\n[$a,$b,$c,$d]=vals($p,[\'bid\',\'msg\',\'name\',\'mail\']);\r\n$own=$uid==posts::usrart($a)?1:0;\r\nif(!$uid && !$c)$er=\'required_name\';\r\nelseif(!$uid && !$d)$er=\'required_mail\';\r\nelseif($c && $d){$psw=unid(time());\r\n    $uid=self::register([\'name\'=>$c,\'mail\'=>$d,\'pswd\'=>$psw]);\r\n	if(!$uid)$psw=\'\'; $er=self::$er;}\r\nif($a && $b && $uid){$pub=$own?1:0;\r\n    $ex=sql::sav(\'tracks\',[$uid,$a,$b,$pub],0);\r\n    if($ex)$ok=\'pending_track\'; else $er=\'already_said\';}\r\nelseif(!$b)$er=\'empty\';\r\nelseif(!$a)$er=\'error\';\r\nif($er)$ret=alert($er,\'red\');\r\nelseif($ok && $own)$ret=self::read([\'a\'=>$a]);\r\nelseif($ok)$ret.=alert($ok,\'green\');\r\nif($psw && $uid)$ret.=alert(\'new_password\',\'blue\',tagb(\'pre\',$psw));\r\n$ret.=bh(\'post/\'.$a,icovoc(\'redoit\'),\'bigbt\');\r\nreturn $ret;', 0, '2023-10-01 16:45:03'),
(23, 'src/php/app', 'tracks', 'form', '$a', '$ret=bj(\'track_form|tracks,save||bid,msg,name,mail\',voc(\'send\'),\'btsav\');\r\nif(!auth(1)){\r\n	$ret.=input(\'name\',\'\',\'\',[\'placeholder\'=>voc(\'name\')]);\r\n	$ret.=inpmail(\'mail\',\'\',[\'placeholder\'=>voc(\'mail\')]);}\r\nelse $ret.=hidden(\'name\',\'\').hidden(\'mail\',\'\');\r\n$ret.=divarea(\'msg\',\'\',\'track-content\');\r\n$ret.=hidden(\'bid\',$a);\r\nreturn $ret;', 1, '2023-10-01 16:45:03'),
(24, 'src/php/app', 'tracks', 'read', '$p', '[$a,$b]=vals($p,[\'a\',\'b\']);\r\n$r=sql::inner(\'b2.id,name,txt,pub,date_format(b2.up,\"%d/%m/%Y\") as up\',\'users\',\'tracks\',\'uid\',\'a\',[\'b2.id\'=>$a]);\r\n$r[\'date\']=$r[\'up\'];\r\n$r[\'pub\']=auth(4)?admin::bt($r[\'id\'],$r[\'pub\'],\'tracks\'):\'\';\r\n$ret=view::call(\'track\',$r);\r\nreturn $ret;', 1, '2023-10-01 16:45:03'),
(25, 'src/php/app', 'tracks', 'stream', '$p', '$ret=\'\';\r\n[$a,$b]=vals($p,[\'a\',\'b\']);\r\n$pbs=[\'1\']; if(auth(4))$pbs[]=\'0\';\r\n$q=[\'bid\'=>$a,\'pub(\'=>$pbs];\r\n$r=sql::inner(\'b2.id,name,txt,pub,date_format(b2.up,\"%d/%m/%Y\") as up\',\'users\',\'tracks\',\'uid\',\'ra\',$q);\r\nif($r)foreach($r as $k=>$v){\r\n    $r[$k][\'date\']=$v[\'up\'];\r\n    $r[$k][\'pub\']=auth(4)?admin::bt($v[\'id\'],$v[\'pub\'],\'tracks\'):\'\';\r\n    $r[$k][\'pub\'].=auth(4)?bj(\'track\'.$v[\'id\'].\'|tracks,del|a=\'.$a.\',b=\'.$v[\'id\'],ico(\'trash\'),\'\'):\'\';\r\n    $ret.=view::call(\'track\',$r[$k]);}\r\nelse $ret=ico(\'comment\');\r\nreturn $ret;', 1, '2023-10-01 16:45:03'),
(26, 'src/php/app', 'tracks', 'call', '$p', '[$a,$b]=vals($p,[\'a\',\'b\']);\r\n$r[\'tracks_title\']=voc(\'tracks_title\');\r\n$r[\'tracks_nb\']=sql::read(\'count(id)\',\'tracks\',\'v\',[\'bid\'=>$a,\'pub\'=>1]);\r\n$r[\'tracks_nb_title\']=voc(\'tracks_nb_title\');\r\n$r[\'track_form\']=self::form($a);//if(ses(\'uid\'))\r\n//else $r[\'track_form\']=bh(\'login\',voc(\'need_auth\'),\'btdel\');\r\n$r[\'tracks\']=self::stream($p);\r\n$ret=view::call(\'tracks\',$r);\r\nreturn $ret;', 2, '2023-10-01 16:45:03'),
(27, 'src/php/core', 'build', 'popup', '$d,$t', '$bt=btj(\'popclose\',\'\',ico(\'red\'));\r\n$bt.=btj(\'poprepos\',\'\',ico(\'blue\'));\r\n$bt.=btj(\'reduce\',\'\',ico(\'green\'));\r\n$bt.=span($t,\'tit\');\r\n$ret=div($bt,\'popa\',\'popa\').div($d,\'popu\',\'popu\');\r\nreturn div($ret,\'popup\',\'\',\'max-width:760px;\');', 0, '2023-10-01 16:45:03'),
(28, 'src/php/core', 'build', 'pagup', '$d,$t', '$t=ses::$r[\'popt\']??$t; $w=760;\r\n$ret=div(btj(\'popclose\',\'\',ico(\'red\')).span($t,\'tit\'),\'popnav\',\'popnav\').div($d,\'popu\',\'popu\');\r\nreturn div($ret,\'\',\'\',\'margin:auto; max-width:\'.$w.\'px;\');', 0, '2023-10-01 16:45:03'),
(29, 'src/php/core', 'build', 'tabler', '$r,$h=\'\',$keys=\'\',$frame=\'\'', '$i=0; $td=\'\'; $tr=\'\';\r\nif(is_array($h)){array_unshift($r,$h); $h=1;}\r\nif(is_array($r))foreach($r as $k=>$v){$td=\'\'; $i++; $tag=$i==1&&$h?\'th\':\'td\';\r\n    if($keys)$td.=tagb($tag,$k);\r\n    if(is_array($v))foreach($v as $ka=>$va)$td.=tagb($tag,$va);\r\n    else $td.=tagb(\'th\',$k).tagb($tag,$v);\r\n    if($td)$tr.=tagb(\'tr\',$td);}//ats(\'valign\',\'top\')\r\n$ret=tagb(\'table\',tagb(\'tbody\',$tr));\r\nif($frame)$ret=tag(\'div\',[\'width\'=>\'100%\',\'height\'=>\'400px\',\'overflow\'=>\'auto\',\'scrollbar-width\'=>\'thin\'],$ret);\r\nreturn $ret;', 8, '2023-10-01 16:45:03'),
(30, 'src/php/core', 'build', 'tabs', '$r,$id=\'tab1\',$c=\'\'', '$b=0; $mnu=\'\'; $ret=\'\'; $sp=span(\' \',\'space\');\r\nif($r)foreach($r as $k=>$v){$b++;\r\n    $dsp=$b==1?\'block\':\'none\'; $cs=$b==1?\'active\':\'\';\r\n    $mnu.=span(btj(\'tabs\',[$id,$b],$k),$cs).$sp;\r\n    $ret.=div($v,$c,\'div\'.$id.$b,\'display:\'.$dsp);}\r\nreturn div($mnu,\'tabs\',\'mn\'.$id).$ret;', 2, '2023-10-01 16:45:03'),
(31, 'src/php/core', 'build', 'playr', '$r,$c=\'\',$o=\'\'', '$ret=\'\';\r\nif(is_array($r))foreach($r as $k=>$v){\r\n    if(is_array($v))$ret.=li(btj(\'liul\',\'this\',$k,$c?\'active\':\'\').self::playr($v,$c,$o));\r\n    else $ret.=li($o?$k.\': \'.$v:$v);}\r\nreturn tag(\'ul\',[\'class\'=>$c?\'on\':\'off\'],$ret);', 2, '2023-10-01 16:45:03'),
(32, 'src/php/core', 'build', 'tree', '$r,$c=\'\',$o=\'\'', 'return div(self::playr($r,$c,$o),\'topology\');', 2, '2023-10-01 16:45:03'),
(33, 'src/php/core', 'build', 'mkli', '$r,$ul=\'ul\'', '$ret=\'\';\r\nforeach($r as $v){if(substr($v,0,1)==\'-\')$v=substr($v,1); if($v=trim($v))$ret.=li($v);}\r\nreturn tag($ul,[],$ret);', 2, '2023-10-01 16:45:03'),
(34, 'src/php/core', 'build', 'scroll', '$d,$max=10,$w=\'\',$h=\'\',$id=\'\'', '$h=is_numeric($h)?$h.\'px\':$h;\r\n$s=$w?\'width:\'.$w.\'px; \':\'\'; $s.=\'max-height:\'.($h?$h:\'420px\').\';\';\r\n$c=strlen($d)>$max?\'scroll\':\'\'; return div($d,$c,$id,$s);', 0, '2023-10-01 16:45:03'),
(35, 'src/php/core', 'build', 'writecsv', '$f,$r', 'putfile($f,\'\');\r\nif(($h=fopen($f,\'r+\'))!==false){\r\nforeach($r as $k=>$v)fputcsv($h,$v); fclose($h);}', 1, '2023-10-01 16:45:03'),
(36, 'src/php/core', 'build', 'readcsv', '$f', '$rb=[];\r\nif(($h=fopen($f,\'r\'))!==false){$k=0;\r\nwhile(($r=fgetcsv($h,\'\',\"\\t\"))!==false){$nb=count($r);\r\nfor($i=0;$i<$nb;$i++)$rb[$k][]=$r[$i]; $k++;} fclose($h);}\r\nreturn $rb;', 0, '2023-10-01 16:45:03'),
(37, 'src/php/core', 'build', 'csvfile', '$f,$r,$t=\'\'', '$t=ico(\'datas\').($t?$t:$f);\r\n$f=\'_datas/csv/\'.$f.\'.csv\'; self::writecsv($f,$r);\r\nreturn lk(\'/\'.$f,$t,\'btn\');', 2, '2023-10-01 16:45:03'),
(38, 'src/php/core', 'build', 'etc', '$d,$n=200', '$d=deln($d,\' \'); $d=strip_tags($d);\r\nif(strlen($d)>$n){$e=strpos($d,\' \',$n); $d=substr($d,0,$e?$e:$n).\'...\';} return $d;', 0, '2023-10-01 16:45:03'),
(39, 'src/php/core', 'build', 'btpages_nb', '$nbp,$pg', '$cases=5; $left=$pg-1; $right=$nbp-$pg; $r[1]=1; $r[$nbp]=1;\r\nfor($i=0;$i<$left;$i++){$r[$pg-$i]=1; $i*=2;}\r\nfor($i=0;$i<$right;$i++){$r[$pg+$i]=1; $i*=2;}\r\nif($r)ksort($r);\r\nreturn $r;', 1, '2023-10-01 16:45:03'),
(40, 'src/php/core', 'build', 'btpages', '$nbyp,$pg,$nbarts,$j', '$ret=\'\'; $nbp=\'\'; $rp=[];\r\nif($nbarts>$nbyp)$nbp=ceil($nbarts/$nbyp);\r\nif($nbp)$rp=self::btpages_nb($nbp,$pg);\r\nif($rp)foreach($rp as $k=>$v)$ret.=bj($j.\',pg=\'.$k,$k,active($k,$pg));\r\nif($ret)return div($ret,\'nbp sticky\');', 0, '2023-10-01 16:45:03'),
(41, 'src/php/core', 'build', 'download', '$f,$t=\'\'', 'if(!is_file($f))$i=\'img/\'.$f; if(!is_file($f))$f=\'usr/\'.$f;\r\nif(is_file($f))return lk(\'/download/\'.base64_encode($f),ico(\'download\').$t).\' \'.span(fsize($f,1),\'small\');\r\nelse return span(strend($f,\'/\').\' (file not exists)\',\'small\');', 1, '2023-10-01 16:45:03'),
(42, 'src/php/core', 'build', 'audio', '$d,$t=\'\'', '$d=usrroot($d); $bt=self::download($d);\r\nreturn tag(\'audio\',[\'controls\'=>\'true\'],taga(\'source\',[\'src\'=>$d,\'type\'=>\'audio/mpeg\']),\'\').$bt;', 0, '2023-10-01 16:45:03'),
(43, 'src/php/core', 'build', 'video', '$d,$w=\'\',$h=\'\',$o=\'\'', '$d=usrroot($d); $w=$w?$w:\'100%\'; $h=$h?$h:\'440px\';\r\nreturn tag(\'video\',[\'src\'=>$d,\'width\'=>$w,\'height\'=>$h,\'type\'=>\'video/\'.xt($d,1),\'controls\'=>\'true\',\'autobuffer\'=>\'true\',\'poster\'=>$o],\'\');', 0, '2023-10-01 16:45:03'),
(44, 'src/php/core', 'build', 'iframe', '$d,$w=\'\',$h=\'\',$o=\'\'', '$d=usrroot($d); $w=$w?$w:\'100%\'; $h=$h?$h:\'440px\';\r\nreturn tag(\'iframe\',[\'src\'=>$d,\'frameborder\'=>\'0\',\'width\'=>$w,\'height\'=>$h,\'seamless\'=>$o,\'srcdoc\'=>$o,\'allowfullscreen\'=>\'true\'],\'\');', 1, '2023-10-01 16:45:03'),
(45, 'src/php/core', 'build', 'editable', '$r,$j,$h=[],$edk=\'\',$no=[]', '$pr=[\'contenteditable\'=>\'true\',\'class\'=>\'editable\',\'onblur\'=>\'editcell(this)\'];\r\n$i=0; $td=[]; $tr=[]; \r\nif($h){foreach($h as $k=>$v)$td[]=tagb(\'th\',$v); $tr[]=tagb(\'tr\',join(\'\',$td));}\r\nif($r)foreach($r as $k=>$v){$td=[]; $i++;\r\n	if($edk)$td[]=tag(\'th\',$pr+[\'id\'=>$i.\'-k\'],$k); else $td[]=tag(\'th\',[],$k);\r\n	if(is_array($v))foreach($v as $ka=>$va)$td[]=tag(\'td\',$pr+[\'id\'=>$i.\'-\'.$ka],$va);\r\n	else $td[]=tag(\'td\',$pr+[\'id\'=>$i.\'-v\'],$v);\r\n	$tr[]=tagb(\'tr\',join(\'\',$td));}\r\n$ret=tagb(\'table\',tagb(\'tbody\',join(\'\',$tr)));\r\n$ret.=hidden(\'edtcom\',$j);\r\nreturn tag(\'div\',[\'width\'=>\'100%\',\'class\'=>\'scroll\'],$ret);', 4, '2023-10-01 16:45:03'),
(46, 'src/php/core', 'build', 'ftp', '$d', '$r=ses::r(\'ftp\');\r\n$ci=ftp_connect($r[3]);\r\n$login_result=ftp_login($ci,$r[0],$r[1]);\r\nif(ftp_site($ci,$d)!==false)$ret=true; else $ret=false;\r\nftp_close($ci);\r\nreturn $ret;', 1, '2023-10-01 16:45:03'),
(47, 'src/php/core', 'build', 'ftpchmod', '$f,$n', '//if(cnfg(\'local\'))chmodf($f,0755);\r\n$d=\'CHMOD \'.intval($n,8).\' \'.$f;\r\nreturn self::ftp($d);', 2, '2023-10-01 16:45:03'),
(48, 'src/php/core', 'conn', 'cprm', '$d', '$n=mb_strrpos($d,\'|\'); if($n===false)$n=mb_strrpos($d,\'§\');\r\nif($n===false)return [$d,\'\']; else return [mb_substr($d,0,$n),mb_substr($d,$n+1)];', 1, '2023-10-01 16:45:03'),
(49, 'src/php/core', 'conn', 'poc', '$da', '$c=\'\'; $p=\'\'; $o=\'\'; $ht=str_contains($da,\'://\')?1:0; \r\n$cp=strrpos($da,\':\',$ht?7:0); if($cp!==false){$c=substr($da,$cp+1); $d=substr($da,0,$cp);} else $d=$da;\r\n[$p,$o]=self::cprm($d);\r\nreturn [$p,$o,$c,$d];', 2, '2023-10-01 16:45:03'),
(50, 'src/php/core', 'conn', 'parser', '$d,$p=[],$e=\'conn::connectors\'', '$a=\'\';$b=\'\';$c=\'\'; if(!$d)return\'\';//\r\n$op=\'[\'; $cl=\']\'; $in=strpos($d,$op);\r\nif($in!==false){$a=substr($d,0,$in);\r\n    $out=strpos(substr($d,$in+1),$cl);\r\n    if($out!==false){$bb=substr($d,$in+1,$out);\r\n        $n=substr_count($bb,$op);\r\n        if($n>=1){\r\n            for($i=1;$i<=$n;$i++){$tmp=$in+1+$out+1;\r\n                $out+=strpos(substr($d,$tmp),$cl)+1;\r\n                $n=substr_count(substr($d,$in+1,$out),$op);}\r\n            $b=substr($d,$in+1,$out);\r\n            $b=self::parser($b,$p,$e);}\r\n        else $b=$bb;\r\n        $b=$e($b,$p);//connectors\r\n        $c=substr($d,$in+1+$out+1);\r\n        $c=self::parser($c,$p,$e);}\r\n    else $c=substr($d,$in+1);}\r\nelse $c=$d;\r\nreturn $a.$b.$c;', 4, '2023-10-01 16:45:03'),
(51, 'src/php/core', 'conn', 'embed_p', '$d', '$d=str_replace(\"\\n\\n</\",\"</\",$d); $r=explode(\"\\n\\n\",$d); $ret=\'\';\r\n$ex=\'<h1<h2<h3<h4<h5<br<hr<bl<pr<di<if<fi\';//<ob<sv<sp<bi<li<im<ta<ol<ul\r\nforeach($r as $k=>$v){if($v=trim($v)){$cn=substr($v,0,3);\r\n    if(strpos($ex,$cn)!==false)$ret.=$v; else $ret.=\'<p>\'.$v.\'</p>\';}}\r\nreturn $ret;', 3, '2023-10-01 16:45:03'),
(52, 'src/php/core', 'conn', 'markdown', '$da,$rp', '[$p,$o,$c,$d]=conn::poc($da);        \r\nif($c)return match($c){\r\n    \'h1\'=>\'# \'.$d,\r\n    \'h2\'=>\'## \'.$d,\r\n    \'h3\'=>\'### \'.$d,\r\n    \'h4\'=>\'#### \'.$d,\r\n    \'i\'=>\'*\'.$d.\'*\',\r\n    \'b\'=>\'**\'.$d.\'**\',\r\n    \'k\'=>\'~~\'.$d.\'~~\',\r\n    \'k\'=>\'> \'.$d,\r\n    \'no\'=>\'\',\r\n    default=>\'\'};', 0, '2023-10-01 16:45:03'),
(53, 'src/php/core', 'conn', 'connectors', '$da,$rp=[]', '[$p,$o,$c,$d]=self::poc($da); $ret=\'\'; \r\nif($c)$ret=match($c){\r\n    \'clr\'=>tag(\'span\',[\'style\'=>\'color:\'.($o?$o:\'red\')],$p),\r\n    \'bkg\'=>tag(\'span\',[\'style\'=>\'background-color:\'.($o?$o:\'yellow\')],$p),\r\n    \'tn\'=>tag(\'a\',[\'href\'=>\'#fn\'.$p,\'id\'=>\'tn\'.$p],\'[\'.$p.\']\'),\r\n    \'fn\'=>tag(\'a\',[\'href\'=>\'#tn\'.$p,\'id\'=>\'fn\'.$p],\'[\'.$p.\']\'),\r\n    \'console\'=>div($d,\'console\'),\r\n    \'md\'=>conns::md($da),\r\n    \'pre\'=>tagb(\'pre\',$d),\r\n    \'ko\'=>tagb(\'pre\',$da),\r\n    \'no\'=>\'\',\r\n    default=>\'\'};\r\nif(!$ret)$ret=$da; $no=str_contains($da,\'<\')?1:0;\r\nif(method_exists(\'conns\',$c))return conns::$c($p,$o);\r\nif(isimg($p) && !$no)return tagb(\'figure\',img(imgroot($p)).($o?tagb(\'figcaption\',$o):\'\'));\r\nif(strpos($d,\'://\') && !$no){$ret=conns::lnk($p,$o); if($ret)return $ret;}\r\nif(in_array($c,self::$cn))return tag($c,\'\',$d);//html\r\nif(self::$cb[$c]??\'\')return tag(self::$cb[$c],\'\',$d);\r\nreturn $ret;', 0, '2023-10-01 16:45:03'),
(54, 'src/php/core', 'conn', 'build', '$p', '[$d,$m,$id,$prs,$nop]=vals($p,[\'txt\',\'m\',\'id\',\'parser\',\'nop\']);\r\n$d=self::parser($d,[$m,$id],$prs?$prs:\'conn::connectors\');\r\nif(!$nop)$d=self::embed_p($d);\r\nif(!$nop)$d=nl2br($d);\r\nreturn $d;', 4, '2023-10-01 16:45:03'),
(55, 'src/php/core', 'conn', 'call', '$p', '$j=\'cnn|conn,build||txt\';\r\n$bt=bj($j,ico(\'ok\'));\r\n$ret=conns::btedt([\'id\'=>\'txt\',\'bt\'=>$bt]);\r\n$js=atj(\'bjcall\',$j);\r\n$ret.=textarea(\'txt\',\'\',64,12,[\'class\'=>\'console\',\'onchange\'=>$js,\'onclick\'=>$js,\'onkeyup\'=>$js]);\r\nreturn $ret.div(\'\',\'area\',\'cnn\');', 0, '2023-10-01 16:45:03'),
(56, 'src/php/core', 'conv', 'repair', '$d', '$r=array_keys(self::$conn)+self::$conb;\r\nforeach($r as $k=>$v)$d=str_replace(\"\\n\".\':\'.$v.\']\',\':\'.$v.\']\',$d);\r\nreturn $d;', 0, '2023-10-01 16:45:03'),
(57, 'src/php/core', 'conv', 'md2conn', '$d', '$ma=[\'# \'=>\'h1\',\'## \'=>\'h2\',\'### \'=>\'h3\',\'#### \'=>\'h4\'];\r\n$mb=[\'*\'=>\'i\',\'**\'=>\'b\',\'~~\'=>\'k\',\'>\'=>\'q\',\"\\t\"=>\'q\',\'`\'=>\'code\'];\r\n$r=explode(\"\\n\",$d);\r\nforeach($r as $k=>$v){\r\n    foreach($ma as $ka=>$va)\r\n        if(str_starts_with($v,$ka))$r[$k]=\'[\'.substr(trim($v),strlen($ka)).\':\'.$va.\']\';\r\n    $rb=explode(\' \',$r[$k]);\r\n    foreach($rb as $ka=>$va)\r\n        foreach($mb as $kb=>$vb){$n=strlen($kb);\r\n            if(str_starts_with($va,$kb))$rb[$ka]=\'[\'.substr(trim($va),$n,-$n).\':\'.$vb.\']\';}\r\n    $r[$k]=join(\' \',$rb);}\r\nreturn join(\"\\n\",$r);', 2, '2023-10-01 16:45:03'),
(58, 'src/php/core', 'conv', 'tags', '$tag,$atb,$d', 'if(strpos($atb,\'align=\"center\"\')!==false)$d=\'[\'.$d.\':c]\';\r\nswitch($tag){\r\ncase(\'a\'):$u=between($atb,\'href=\"\',\'\"\'); //$ub=between($atb,\'data-j=\"\',\'\"\');\r\n    if($d==domain($u))$d=\'\';\r\n    if($u==$d && $u)return \'[\'.trim($u).\']\';\r\n    if($u && substr($u,0,3)==\'#nh\')return \'[\'.substr($u,3).\':nb]\';\r\n    if($u && substr($u,0,3)==\'#nb\')return \'[\'.substr($u,3).\':nh]\';\r\n    if($u)return \'[\'.trim($u).($d?\'|\'.trim($d):\'\').\':url]\'; break;\r\ncase(\'img\'):$u=between($atb,\'src=\"\',\'\"\'); $b64=\'\';\r\n    $w=between($atb,\'width=\"\',\'\"\'); $h=between($atb,\'height=\"\',\'\"\');\r\n    if(substr($u,0,10)==\'data:image\')$u=img::b64img($u);\r\n    elseif(substr($u,0,4)==\'http\')$u=img::getim($u,\'art\',$w,$h=\'\');\r\n    elseif(substr($u,0,9)==\'/img/mini\')return \'\';\r\n    //elseif(substr($u,0,9)==\'/img/full\')return $u;\r\n    elseif(substr($u,0,4)!=\'http\')$u=strend($u,\'/\');\r\n    //if($w && $h)$u.=\'|\'.$w.\'-\'.$h;\r\n    return \'[\'.$u.\']\'; break;//:img\r\ncase(\'table\'):\r\n    if(mb_substr($d,-1,1)==\'¬\')$d=mb_substr($d,0,-1);\r\n    if(post(\'th\')){$o=\'|1\'; self::$th=\'\';} else $o=\'\';\r\n    return \'[\'.$d.$o.\':table]\';break;//.$o\r\ncase(\'big\'):return \'[\'.$d.\':big]\'; break;\r\ncase(\'center\'):return \'[\'.$d.\':c]\'; break;\r\ncase(\'aside\'):return \'[\'.$d.\':aside]\'; break;\r\ncase(\'tr\'):if(mb_substr($d,-1,1)==\'|\')$d=trim(mb_substr($d,0,-1));\r\n    $d=strip_tags($d); return $d?str_replace(\"\\n\",\' \',$d).\"\\n\":\'\'; break;\r\ncase(\'th\'):self::$th=1; $d=trim($d); return $d?str_replace(\'|\',\'\',trim($d)).\'|\':\'\'; break;\r\ncase(\'td\'):$d=trim($d); return $d?str_replace(\'|\',\'\',$d).\'|\':\'\'; break;\r\ncase(\'font\'):return $d; break;//font-size\r\ncase(\'li\'):return trim($d).\"\\n\"; break;\r\ncase(\'ul\'):return \'[\'.$d.\':list]\'.\"\\n\"; break;\r\ncase(\'div\'):return $d.\"\\n\\n\"; break;\r\ncase(\'hr\'):return \'[--]\'; break;\r\ncase(\'p\'):return $d.\"\\n\\n\"; break;\r\ncase(\'embed\'):$u=between($atb,\'src=\"\',\'\"\'); return \'[\'.$u.\']\'; break;\r\ncase(\'iframe\'):$u=between($atb,\'src=\"\',\'\"\'); return \'[\'.$u.\']\'; break;}\r\n$r=self::$conn; if($d && isset($r[$tag]))return \'[\'.$d.\':\'.$r[$tag].\']\';\r\n$r=self::$conb; if($d && isset($r[$tag]))return \"\\n\\n\".\'[\'.$d.\':\'.$r[$tag].\']\'.\"\\n\\n\";\r\nreturn $d;', 1, '2023-10-01 16:45:03'),
(59, 'src/php/core', 'conv', 'cleanhtml', '$d', ';\r\n$r=[\'b\',\'i\',\'u\',\'strike\',\'ul\',\'ol\',\'li\'];\r\nforeach($r as $k=>$v){\r\n$d=str_replace(\'</\'.$v.\'><\'.$v.\'>\',\'\',$d);\r\n$d=str_replace(\'</\'.$v.\'> <\'.$v.\'>\',\' \',$d);}\r\nreturn $d;', 1, '2023-10-01 16:45:03'),
(60, 'src/php/core', 'conv', 'cleanconn', '$d', '$d=str_replace(\'[\'.\"\\n\",\"\\n\".\'[\',$d);\r\n$r=self::$conn+self::$conb;\r\nforeach($r as $k=>$v){\r\n$d=str_replace(\"\\n\".\':\'.$v.\']\',\':\'.$v.\']\'.\"\\n\",$d);\r\n$d=str_replace(\' :\'.$v.\']\',\':\'.$v.\'] \',$d);\r\n$d=str_replace(\':\'.$v.\'].\',\'.:\'.$v.\']\',$d);\r\n$d=str_replace(\'[:\'.$v.\']\',\'\',$d);}\r\nreturn $d;', 1, '2023-10-01 16:45:03'),
(61, 'src/php/core', 'conv', 'ecart', '$v,$a,$b', 'return substr($v,$a+1,$b-$a-1);', 4, '2023-10-01 16:45:03'),
(62, 'src/php/core', 'conv', 'recursearch', '$v,$ab,$ba,$tag', '//pousse si autre balise similaire\r\n$bb=strpos($v,\'>\',$ba); $d=self::ecart($v,$ab,$ba);\r\nif(strpos($d,\'<\'.$tag)!==false){$bab=strpos($v,\'</\'.$tag,$ba+1);\r\n    if($bab!==false)$ba=self::recursearch($v,$bb,$bab,$tag);}\r\nreturn $ba;', 2, '2023-10-01 16:45:03'),
(63, 'src/php/core', 'conv', 'parse', '$v,$x=\'\'', '$tag=\'\'; $atb=\'\'; $txt=\'\'; $before=\'\';\r\n$aa=strpos($v,\'<\'); $ab=strpos($v,\'>\');//tag\r\nif($aa!==false && $ab!==false && $ab>$aa){\r\n$before=substr($v,0,$aa);//...<\r\n$atb=self::ecart($v,$aa,$ab);//<...>\r\n    $aa_end=strpos($atb,\' \');\r\n    if($aa_end!==false)$tag=substr($atb,0,$aa_end);\r\n    else $tag=$atb;}\r\n$ba=strpos($v,\'</\'.$tag,$ab); $bb=strpos($v,\'>\',$ba);//end\r\nif($ba!==false && $bb!==false && $tag && $bb>$ba){\r\n    $ba=self::recursearch($v,$ab,$ba,$tag);\r\n    $bb=strpos($v,\'>\',$ba);\r\n    $tagend=self::ecart($v,$ba,$bb);\r\n    $txt=self::ecart($v,$ab,$ba);}\r\nelseif($ab!==false)$bb=$ab;\r\nelse{$bb=-1;}\r\n$after=substr($v,$bb+1);//>...\r\n$tag=strtolower($tag);\r\n//itération\r\nif(strpos($txt,\'<\')!==false)$txt=self::parse($txt,$x);\r\nif(!$x)//interdit l\'imbrication\r\n    $txt=self::tags($tag,$atb,$txt);\r\n//sequence\r\nif(strpos($after,\'<\')!==false)$after=self::parse($after,$x);\r\n$ret=$before.$txt.$after;\r\nreturn $ret;', 3, '2023-10-01 16:45:03'),
(64, 'src/php/core', 'conv', 'build', '$p', '$d=$p[\'txt\']??\'\';\r\n$d=delt($d);\r\n$d=delnbsp($d);\r\n$d=delr($d);\r\n$d=deln($d,\' \');\r\n$d=delsp($d);\r\n$d=str::clean_lines($d);\r\n$d=self::cleanhtml($d);\r\n$d=self::parse($d);\r\n$d=self::cleanconn($d);\r\n$d=delbr($d,\"\\n\");\r\n$d=str::clean_n($d);\r\n$d=str::clean_punctuation($d,2);\r\n$d=delsp($d);\r\nreturn $d;', 1, '2023-10-01 16:45:03'),
(65, 'src/php/core', 'conv', 'call', '$p', '$j=\'cnn|conv,build||txt\';\r\n$ret=div(bj($j,ico(\'ok\')));\r\n$js=atj(\'bjcall\',$j);\r\n$ret.=textarea(\'txt\',\'\',64,12,[\'class\'=>\'console\',\'onchange\'=>$js,\'onclick\'=>$js,\'onkeyup\'=>$js]);\r\nreturn $ret.div(\'\',\'area\',\'cnn\');', 0, '2023-10-01 16:45:03'),
(66, 'src/php/core', 'css', 'file', '$a', 'return \'src/css/\'.$a.\'.css\';', 2, '2023-10-01 16:45:03'),
(67, 'src/php/core', 'css', 'trigger', '$a', '$f=self::file($a); $fb=json::file(self::$path.$a);\r\n$d1=ftime($f); $d2=ftime($fb);\r\nif($d2>$d1)return $f;', 1, '2023-10-01 16:45:03'),
(68, 'src/php/core', 'css', 'save', '$a,$d', 'if($f=self::trigger($a)){putfile($f,$d); err(\'saved: \'.$f);}', 1, '2023-10-01 16:45:03'),
(69, 'src/php/core', 'css', 'read', '$r', '$rt=[];\r\nforeach($r as $k=>$v)\r\nif(is_array(current($v)))$rt[]=$k.\'{\'.self::read($v).\'}\';\r\nelse $rt[]=$k.\'{\'.implode_k($v,\':\',\'; \').\'}\';\r\nreturn implode(n(),$rt);', 2, '2023-10-01 16:45:03'),
(70, 'src/php/core', 'css', 'build', '$a', '$o=ses::cnfg(\'savecss\');\r\n$f=self::file($a); $d=\'\';\r\nif(!is_file($f) or $o){\r\n	$r=json::call(self::$path.$a);\r\n	if($r)$d=self::read($r);\r\n	if($d)self::save($a,$d);}', 2, '2023-10-01 16:45:03'),
(71, 'src/php/core', 'db', 'jsoncolfromattr', '$b,$c,$k', '//add col from json attr k in new col c//attr_colour\r\nsql::qr(\'alter table \'.$b.\' add \'.$c.\'_\'.$k.\' varchar(32) as (json_value(\'.$c.\', \"$.\'.$k.\'\"));\');\r\nsql::qr(\'create index \'.$b.\'_\'.$c.\'_\'.$k.\'_ix on \'.$b.\'(\'.$c.\'_\'.$k.\');\');', 0, '2023-10-01 16:45:03'),
(72, 'src/php/core', 'db', 'modifjsonvar', '$b,$c,$k,$v,$q=\'\'', '//impact colattr\r\nsql::qr(\'update \'.$b.\' set \'.$c.\' = json_replace(\'.$c.\', \"$.\'.$k.\'\", \"\'.$v.\'\") \'.sql::mkq($q,$b).\';\');', 0, '2023-10-01 16:45:03'),
(73, 'src/php/core', 'db', 'create_cols', '$r', '$ret=\'\'; $end=\'\';\r\n//$collate=\'collate utf8mb4_uniocode_ci\'; $set=\'CHARACTER SET utf8mb4\';\r\nforeach($r as $k=>$v)\r\nif($v==\'int\')$ret.=\'`\'.$k.\'` int(11) default NULL,\'.\"\\n\";\r\nelseif($v==\'bint\')$ret.=\'`\'.$k.\'` bigint(36) NULL default NULL,\'.\"\\n\";\r\nelseif($v==\'dec\')$ret.=\'`\'.$k.\'` decimal(20,20) NULL default NULL,\'.\"\\n\";\r\nelseif($v==\'float\')$ret.=\'`\'.$k.\'` float(20,2) NULL default NULL,\'.\"\\n\";\r\nelseif($v==\'double\')$ret.=\'`\'.$k.\'` double NULL default NULL,\'.\"\\n\";\r\nelseif($v==\'var\')$ret.=\'`\'.$k.\'` varchar(255) NOT NULL default \"\",\';\r\nelseif($v==\'bvar\')$ret.=\'`\'.$k.\'` varchar(1020) NOT NULL default \"\",\';\r\nelseif($v==\'svar\')$ret.=\'`\'.$k.\'` varchar(60) NOT NULL default \"\",\';\r\nelseif($v==\'tiny\')$ret.=\'`\'.$k.\'` tinytext,\';\r\nelseif($v==\'text\')$ret.=\'`\'.$k.\'` mediumtext,\';//\'.$set.\'\r\nelseif($v==\'long\')$ret.=\'`\'.$k.\'` longtext,\';\r\nelseif($v==\'date\')$ret.=\'`\'.$k.\'` date NOT NULL,\';\r\nelseif($v==\'time\')$ret.=\'`\'.$k.\'` datetime NOT NULL,\';\r\n//elseif($v==\'json\')$ret.=\'`\'.$k.\'` json,\';\r\nelseif($v==\'json\')$ret.=\'`\'.$k.\'` mediumtext,\';\r\n//elseif($v==\'json\'){$ret.=\'`\'.$k.\'` mediumtext,\'.\"\\n\"; $end=\'CHECK (\'.$k.\' is null or json_valid(\'.$k.\')),\'.\"\\n\";}\r\n//elseif($v==\'enum\')$ret.=\'\'.$k.\'` enum (\"\'.implode(\'\",\"\',$k).\'\") NOT NULL,\';\r\nreturn $ret.$end;', 1, '2023-10-01 16:45:03'),
(74, 'src/php/core', 'db', 'cleanup', '$r', '$rz=[\'USER\',\'CURRENT_CONNECTIONS\',\'TOTAL_CONNECTIONS\'];\r\nforeach($r as $k=>$v)\r\nif(in_array($v[\'column_name\']??\'\',$rz))unset($r[$k]);\r\nelseif(in_array($k,$rz))unset($r[$k]);\r\nreturn $r;', 1, '2023-10-01 16:45:03'),
(75, 'src/php/core', 'db', 'cols', '$b,$n=\'\'', 'if($n)$b=cnfg(\'db\').\'.\'.$b;\r\n$sql=\'select column_name,data_type,character_maximum_length from information_schema.columns where table_name=\"\'.$b.\'\"\';\r\nreturn sql::call($sql,\'ra\');', 1, '2023-10-01 16:45:03'),
(76, 'src/php/core', 'db', 'type_cols', '$b', '$r=self::cols($b,0); $rt=[]; $r=self::cleanup($r);\r\nforeach($r as $k=>$v){[\'column_name\'=>$nm,\'data_type\'=>$ty,\'character_maximum_length\'=>$sz]=$v;\r\n	$ty=match($ty){\r\n	\'varchar\'=>$sz<64?\'svar\':($sz>1000?\'bvar\':\'var\'),\r\n	//\'int\'=>\'int\',\r\n	\'bigint\'=>\'bint\',\r\n	\'decimal\'=>\'dec\',\r\n	//\'float\'=>\'float\',\r\n	//\'double\'=>\'double\',\r\n	//\'json\'=>\'json\',\r\n	\'json\'=>\'text\',\r\n	\'mediumtext\'=>\'text\',\r\n	\'longtext\'=>\'long\',\r\n	\'tinytext\'=>\'tiny\',\r\n	//\'date\'=>\'date\',\r\n	\'datetime\'=>\'time\',\r\n	default=>$ty};\r\n$rt[$nm]=$ty;}\r\nreturn $rt;', 1, '2023-10-01 16:45:03'),
(77, 'src/php/core', 'db', 'trigger', '$b,$ra', 'if(!sql::ex($b))return;\r\n$rb=self::type_cols($b); $rnew=[]; $rold=[];\r\nif(isset($rb[\'id\']))unset($rb[\'id\']); if(isset($rb[\'up\']))unset($rb[\'up\']);\r\nif($rb){$rnew=array_diff_assoc($ra,$rb); $rold=array_diff_assoc($rb,$ra);}//old\r\nif($rnew or $rold){echo $b; pr([$rnew,$rold]);\r\n	$bb=sql::backup($b,date(\'ymdHis\')); sql::drop($b);\r\n	$rtwo=array_intersect_assoc($ra,$rb);//common\r\n	//$rak=array_keys($ra); $rav=array_values($ra);\r\n	$rnk=array_keys($rnew); $rnv=array_values($rnew); $nn=count($rnk);\r\n	$rok=array_keys($rold); $rov=array_values($rold); $no=count($rok);\r\n	$na=count($rnew); $nb=count($rold); $ca=array_keys($rtwo); $cb=array_keys($rtwo);\r\n	if($na==$nb)for($i=0;$i<$nn;$i++)if($rnv[$i]==$rov[$i] or $rnv[$i]!=\'int\'){\r\n		$ca[]=$rnk[$i]; $cb[]=$rok[$i];}\r\n	return \'insert into \'.$b.\'(id,\'.implode(\',\',$ca).\',up) select id,\'.implode(\',\',$cb).\',up from \'.$bb;}', 1, '2023-10-01 16:45:03'),
(78, 'src/php/core', 'db', 'create', '$b,$r,$up=\'\'', 'if(!auth(6) && !cnfg(\'dev\'))return;\r\nif(!is_array($r) or !$b)return; reset($r);\r\nif($up==\'z\')sql::drop($b);\r\nif($up){$sql=self::trigger($b,$r); }\r\nsql::qr(\'create table if not exists `\'.$b.\'` (\r\n	`id` int(11) NOT NULL auto_increment,\'.self::create_cols($r).\'\r\n	`up` timestamp on update CURRENT_TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,\r\n	PRIMARY KEY (`id`)\r\n) ENGINE=InnoDB collate utf8mb4_unicode_ci;\',0);\r\n//if($b==\'users\' && $r[\'name\']??\'\')sql::unikey($b,\'name\');\r\nif(isset($sql))sql::qr($sql,1);', 2, '2023-10-01 16:45:03'),
(79, 'src/php/core', 'db', 'table', '$b', '$r=json::call(\'cnfg/db\');\r\nreturn $r[$b]??[];', 1, '2023-10-01 16:45:03'),
(80, 'src/php/core', 'db', 'cols_r', '$b', '$r=sesmk(\'db::table\',$b);\r\nreturn $r;', 6, '2023-10-01 16:45:03'),
(81, 'src/php/core', 'db', 'cols_k', '$b', '$r=self::cols_r($b);\r\nreturn array_keys($r);', 8, '2023-10-01 16:45:03'),
(82, 'src/php/core', 'db', 'cols_s', '$b', '$r=self::cols_k($b);\r\nreturn join(\',\',$r);', 1, '2023-10-01 16:45:03'),
(83, 'src/php/core', 'db', 'install', '$b,$z=0', 'self::create($b,self::table($b),$z);', 0, '2023-10-01 16:45:03'),
(84, 'src/php/core', 'db', 'install_all', '', '$r=json::call(\'cnfg/db\');\r\nforeach($r as $k=>$v)\r\n	self::create($k,$v,1);', 1, '2023-10-01 16:45:03'),
(85, 'src/php/core', 'db', 'call', '', '', 0, '2023-10-01 16:45:03'),
(86, 'src/php/core', 'dbedt', 'upd2', '$p', '$a=array_shift($p); $ka=key($p);\r\n[$row,$col]=explode(\'-\',$ka); $va=current($p);\r\n$r=sql::read(\'id\',$a,\'rv\',\'\'); $id=$r[$row-1];\r\nif(in_array($col,self::$no))$va=alert(\'forbidden\',\'red\');\r\nelse $nid=sql::upd($a,[$col=>$va],[\'id\'=>$id]);\r\nreturn $va;', 0, '2023-10-01 16:45:03'),
(87, 'src/php/core', 'dbedt', 'upd', '$p', '$a=array_shift($p); $id=array_shift($p); $ka=key($p);\r\n[$row,$col]=explode(\'-\',$ka); $va=current($p);\r\nif($col=\'v\')$col=$row;//2d array\r\n$ra=db::cols_k($a);\r\nif(in_array(\'uid\',$ra)){$ko=in_array_k(\'uid\',$ra); unset($ra[$ko]); $ra=array_values($ra);}//not edit uid\r\n$col=$ra[$col-1];\r\n$rt=[$col=>$va];\r\nif(in_array($col,self::$no))$va=alert(\'forbidden\',\'red\');\r\nelse $nid=sql::upd($a,$rt,[\'id\'=>$id]);\r\nreturn $va;', 0, '2023-10-01 16:45:03'),
(88, 'src/php/core', 'dbedt', 'play', '$p', '[$a,$n]=vals($p,[\'a\',\'n\']);\r\n$r=sql::read(\'allid\',$a,\'ra\',\'\'); $rb=$r;//[\'_limit\'=>$n.\', 20\']\r\nforeach($r as $k=>$v)\r\n	$rb[$k][\'id\']=bj(\'dbdt|dbedt,read|a=\'.$a.\',id=\'.$v[\'id\'],$v[\'id\'],\'btn\');\r\n$h=db::cols_k($a); $hb=$h; array_unshift($h,\'id\'); array_unshift($h,\'_\');\r\nif(count($r)<20)$ret=build::editable($rb,\'dbedt,upd2|a=\'.$a,$h,0,self::$no);\r\nelse$ret=build::tabler($r,$hb);\r\nreturn div($ret,\'\',\'plyt\');', 1, '2023-10-01 16:45:03'),
(89, 'src/php/core', 'dbedt', 'read', '$p', '$r=[];\r\n[$a,$id]=vals($p,[\'a\',\'id\']); $bt=\'\'; $ret=\'\';\r\n$ra=db::cols_r($a); if(!$ra)return \'nodb\';\r\nif($a && $id)$r=sql::read(\'all\',$a,\'a\',[\'id\'=>$id]);\r\n//elseif($a)return self::entries($a);\r\n$own=($r[\'uid\']??\'\')==ses(\'uid\')?1:0;\r\nif($r[\'uid\']??\'\')unset($r[\'uid\']);//not edit uid\r\nif($id)$ret=build::editable($r,\'dbedt,upd|a=\'.$a.\',id=\'.$id);\r\nelseif(auth(6) or $own)$ret=self::play($p+[\'n\'=>\'0\']);\r\nif($id)$bt=bj(\'dbdt|dbedt,read|a=\'.$a.\',id=\'.$id,ico(\'edit\').$a.\':\'.$id,\'btn\');\r\nreturn $bt.$ret;', 1, '2023-10-01 16:45:03'),
(90, 'src/php/core', 'dbedt', 'entries', '$a', '$rt=[]; $pr=[];\r\nif(!auth(6))$pr=[\'uid\'=>ses(\'uid\')];\r\n$r=sql::read(\'id\',$a,\'rv\',$pr);\r\nforeach($r as $k=>$v)$rt[]=bj(\'dbdt|dbedt,read|a=\'.$a.\',id=\'.$v,$v);\r\nreturn div(join(\'\',$rt),\'menu\');', 1, '2023-10-01 16:45:03'),
(91, 'src/php/core', 'dbedt', 'menu', '', '$rt=[];\r\n$r=sql::call(\'show tables\',\'rv\');\r\nforeach($r as $k=>$v)$rt[]=bj(\'dbdt|dbedt,read|a=\'.$v,$v);\r\nreturn join(\'\',$rt);', 1, '2023-10-01 16:45:03'),
(92, 'src/php/core', 'dbedt', 'call', '$p', '[$a,$id]=vals($p,[\'a\',\'id\']);\r\n$ret=self::read($p);\r\nif(auth(6))$bt=self::menu(); else $bt=\'\';\r\nreturn div($bt,\'menu\').div($ret,\'\',\'dbdt\');', 3, '2023-10-01 16:45:03'),
(93, 'src/php/core', 'docs', 'doc', '', '$rt=[];\r\n$r=sql::read(\'page,func,vars\',\'_prog\',\'kkv\',[]);\r\n$rb=sql::read(\'child,parent\',\'_progr\',\'kk\',[]);\r\nforeach($r as $k=>$v){$ret=\'\'; $d=\'\';\r\n	$fa=self::$doc.\'src/\'.$k.\'.md\';\r\n	//$fb=self::$doc.\'res/\'.$k.\'.md\';\r\n	//if(is_file($fa))$da=getfile($fa);\r\n	if(is_file($fa))$d=getfile($fa);\r\n	$ret.=\'## Overview\'.n().n();\r\n	$n=strpos($d,\'## Overview\');\r\n	if($n!==false)$d=mb_substr($d,13);\r\n	$n=strpos($d,\'## Functions\');\r\n	if($n!==false)$d=mb_substr($d,0,$n);\r\n	if($d)$d=trim($d);\r\n	if(!$d)echo $d=\'n/a\'; //$da?$da:\r\n	$ret.=$d.n().n();\r\n	$ret.=\'## Functions\'.n().n();\r\n	foreach($v as $ka=>$va){\r\n		$ret.=\'- `\'.$ka.\'(\'.$va.\')`\';\r\n		if($rb[$k.\'::\'.$ka]??\'\'){\r\n			$ret.=\' -- used in : `\'.join(\'`, `\',array_keys($rb[$k.\'::\'.$ka])).\'`\';}\r\n		$ret.=n();}\r\n	$ret=str_replace(\'##\'.n().n(),\'\',$ret);\r\n	$ret=str_replace(\'#\'.n().n(),\'\',$ret);\r\n	putfile($fa,$ret);\r\n	$rt[$k]=$ret;}\r\n$ret=getfile(self::$doc.\'abstract.md\').n().n(); $f=self::$doc.\'readme\'.day(\'ymd\').\'.md\';\r\nforeach($rt as $k=>$v)$ret.=\'# \'.$k.n().n().$v.n();\r\n$ret.=\'generated by botdoc, \'.day();\r\nputfile($f,$ret); putfile(\'readme.md\',$ret);\r\nreturn div($f,\'console\');', 1, '2023-10-01 16:45:03'),
(94, 'src/php/core', 'docs', 'iter2', '$ka', '$rt=[];\r\nif(isset(self::$rr[$ka])){$r=self::$rr[$ka]; unset(self::$rr[$ka]);} else return 1;\r\nforeach($r as $k=>$v)if($k!=$ka)$rt[$k]=self::iter($k);\r\nreturn $rt;', 1, '2023-10-01 16:45:03'),
(95, 'src/php/core', 'docs', 'see2', '$p', '$rt=[];\r\n$sq=$p?[\'child\'=>$p]:[];\r\n$r=sql::read(\'parent,child\',\'_progr\',\'kk\',$sq);\r\nself::$rr=$r;\r\nforeach($r as $k=>$v)$rt[$k]=self::iter2($k);\r\nreturn build::tree($rt,2,1);', 1, '2023-10-01 16:45:03'),
(96, 'src/php/core', 'docs', 'iter', '$ka', '$rt=[]; if($ka==self::$ka)return \'iterated\'; self::$ka=$ka;\r\nif(isset(self::$rr[$ka])){$r=self::$rr[$ka]; unset(self::$rr[$ka]);} else return 1;//\r\nforeach($r as $k=>$v)if($k!=$ka)$rt[$k]=self::iter($k);\r\nreturn $rt;', 5, '2023-10-01 16:45:03'),
(97, 'src/php/core', 'docs', 'see', '$p', '$rt=[];\r\n$sq=$p?[\'parent\'=>$p]:[];\r\n$r=sql::read(\'child,parent\',\'_progr\',\'kk\',$sq,1);\r\nself::$rr=$r;\r\nforeach($r as $k=>$v)$rt[$k]=self::iter($k);\r\nreturn build::tree($rt,1,1);', 1, '2023-10-01 16:45:03'),
(98, 'src/php/core', 'docs', 'vue', '', '$rm=[]; $rw=[]; $rd=[]; $rn=[];\r\n//$r=sqb(\'distinct(dir)\',\'_prog\',\'rv\',\'\'); $rk=array_flip($r);\r\n//$r=sqb(\'dir,func\',\'_prog\',\'kk\',\'\');\r\n//foreach($r as $k=>$v)foreach($v as $ka=>$va)$rm[$ka]=$rk[$k]; //moodularity_class\r\n$r=sql::read(\'page,func as nb\',\'_prog\',\'k\',[\'_order\'=>\'nb desc\']); //pr($r);\r\narsort($r); $rk=array_keys($r); $rk=array_flip($rk);//classes ordered by popularity\r\n$r=sql::read(\'dir,page,func,uses\',\'_prog\',\'rn\',\'\');\r\nforeach($r as $k=>$v){$kb=($v[0]!=\'/\'?$v[1].\'::\':\'\').$v[2];\r\n	$rm[$kb]=$rk[$v[1]];//moodularity_class2\r\n	$rw[$kb]=$v[3];}//weight\r\n//pr($rm);\r\n//pr($rw); \r\n$r=sql::read(\'parent,child\',\'_progr\',\'kk\',\'\');\r\n$ra[]=[\'Id\',\'Label\',\'timeset\',\'modularity_class\']; $i=0; $rd=[];\r\n$rb[]=[\'Source\',\'Target\',\'Type\',\'Id\',\'Label\',\'Timeset\',\'Weight\'];\r\nforeach($r as $k=>$v){$rd[$k]=$i++; foreach($v as $ka=>$va){$rd[$ka]=$i++; $rn[$ka][]=1;}} //id,weight\r\nforeach($rd as $k=>$v)$ra[]=[$v,$k,\'\',$rm[$k]??\'\'];\r\nforeach($r as $k=>$v){\r\n	foreach($v as $ka=>$va)$rb[]=[$rd[$k],$rd[$ka],\'undirected\',\'\',\'\',\'\',$rw[$k]??\'\'];} //count($rn[$k]);\r\n$ret=build::csvfile(\'prog\',$ra);\r\n$ret.=build::csvfile(\'prog_r\',$rb);\r\n$ret.=build::tabler($ra).build::tabler($rb);\r\nreturn $ret;', 1, '2023-10-01 16:45:03'),
(99, 'src/php/core', 'docs', 'save2', '$r', 'sql::trunc(self::$db2); $rt=[];\r\n$rh=[\'parent\',\'child\'];\r\nforeach($r as $k=>$v)foreach($v as $ka=>$va)$rt[]=[$k,$va];\r\nif($rt)foreach($rt as $k=>$v)sql::sav(self::$db2,$v);', 1, '2023-10-01 16:45:03'),
(100, 'src/php/core', 'docs', 'unused', '$r,$rb', '$rt=[];\r\nforeach($r as $k=>$v){[$a,$b]=$v; $fa=$a?$a.\'::\'.$b:$b;//searched\r\n	if(!isset($rb[$fa]))$rt[]=$fa;}\r\nreturn $rt;', 1, '2023-10-01 16:45:03'),
(101, 'src/php/core', 'docs', 'find', '$d,$fc', '$r=[\'.\',\'=\',\'{\',\'(\',\')\',\'[\',\' \',\"\\n\"];//}\r\nforeach($r as $k=>$v)\r\n	if(strpos($d,$v.$fc.\'(\')!==false)return true;\r\nreturn false;', 1, '2023-10-01 16:45:03'),
(102, 'src/php/core', 'docs', 'arbo', '$r', '$rt=[];\r\nforeach($r as $k=>$v){[$a,$b,$d]=$v;\r\n	$fa=($a?$a.\'::\':\'\').$b;//parent\r\n	foreach($r as $ka=>$va){[$a2,$b2]=$va;\r\n		$fb=($a2?$a2.\'::\':\'\').$b2;//child\r\n		$fc=($a2?($a2==$a?\'self\':$a2).\'::\':\'\').$b2;//searched\r\n		$ex=self::find($d,$fc);\r\n		if($ex)$rt[$fa][]=$fb;}}//&& $fb!=$fa//iteratives\r\nreturn $rt;', 2, '2023-10-01 16:45:03'),
(103, 'src/php/core', 'docs', 'mktree', '$a,$b', '$rt=[]; $rb=[]; $rc=[]; $ry=[];\r\n$r=sql::read(\'dir,page,func,code\',\'_prog\',\'rn\',[\'_order\'=>\'dir\']); //pr($r);\r\nforeach($r as $k=>$v){$a=$v[0]==\'/\'?\'\':$v[1]; $b=$v[2];\r\n	$rb[]=[$a,$b,$v[3]];} //pr($rb);\r\n$rt=self::arbo($rb);\r\n//$ru=self::unused($rb,$rt);\r\nif(self::$save)self::save2($rt);\r\n//foreach($rr as $k=>$v)foreach($v as $ka=>$va)\r\n//	if(isset($rt[$ka]))$ry[$k][$ka]=self::iter($ka); pr($ry);\r\nif(self::$save)$ret=self::state($a);\r\nreturn $ret;', 1, '2023-10-01 16:45:03'),
(104, 'src/php/core', 'docs', 'funcsee', '$r', '$rb=[];$rt=[];//child=>parent\r\nforeach($r as $k=>$v)foreach($v as $ka=>$va)$rb[$k][$va]=1;\r\nself::$rr=$rb;\r\nforeach($rb as $k=>$v)$rt[$k]=self::iter($k);\r\nreturn $rt;', 1, '2023-10-01 16:45:03'),
(105, 'src/php/core', 'docs', 'functree', '$r', '$rt=[];//page=>func=>dr/page=>content\r\nforeach($r as $k=>$v)foreach($v as $ka=>$va){$a=strpos($k,\'/\')?between($k,\'/\',\'.\'):\'\';\r\n	$rt[]=[$a,$ka,$va[1]];}\r\nreturn self::arbo($rt);', 1, '2023-10-01 16:45:03'),
(106, 'src/php/core', 'docs', 'save', '$p,$r', '$db=self::$db;\r\nif(self::$n==0)sql::trunc($db);\r\nself::$n+=1; $rt=[];\r\nif(strpos($p,\'/\'))[$dr,$p]=split_one(\'/\',$p,1); else [$dr,$p]=[\'/\',$p];\r\n$rh=[\'dir\',\'page\',\'func\',\'vars\',\'code\',\'uses\'];\r\nforeach($r as $k=>$v)$rt[]=array_combine($rh,[$dr,$p,$k,$v[0],$v[1],self::$rb[$k]]); //pr($rt);\r\nif($rt)foreach($rt as $k=>$v)sql::sav(\'_prog\',$v,0);', 1, '2023-10-01 16:45:03'),
(107, 'src/php/core', 'docs', 'find_func', '$d,$fc', '$p=strpos($d,\'function \'.$fc.\'(\');\r\n$d=substr($d,$p);\r\n$vars=between($d,\'(\',\')\');\r\n$p=str_replace([\"\'{\'\",\"\'}\'\"],[\'(ac1)\',\'(ac2)\'],$d);\r\n$p=strpos($d,\'{\');\r\n$d=substr($d,$p);\r\n$n=strlen($d); $a=0; $b=0;\r\nfor($i=0;$i<$n;$i++){$c=substr($d,$i,1);\r\nif($c==\'{\')$a+=1; elseif($c==\'}\')$b+=1; if($a-$b==0)$n=$i;}\r\n$func=substr($d,1,$n-1);\r\n//$func=html_entity_decode($func);\r\n//$func=utf8enc($func);\r\n$func=trim($func);\r\n$p=str_replace([\'(ac1)\',\'(ac2)\'],[\"\'{\'\",\"\'}\'\"],$d);\r\nreturn [$vars,$func];}\r\n\r\n#list\r\nstatic function funcnt($p,$r){//fonctions contents\r\n//if(self::$n==2)return;\r\n$pg=strto($p,\'.\'); $rt=[];\r\n$va=self::$r[$p];\r\nforeach($r as $k=>$v){//fc,occurrences\r\n	$kb=strfrom($k,\'::\');\r\n	$vb=self::find_func($va,$kb);\r\n	self::$rb[$kb]=array_sum($v);\r\n	$rt[$kb]=$vb;}\r\n	//pr($rt);\r\nif(self::$save)self::save($pg,$rt);\r\nreturn $rt;}\r\n\r\nstatic function funclist($r){$rt=[];\r\nforeach($r as $k=>$v)$rt[$k]=self::funcnt($k,$v);\r\nreturn $rt;}\r\n\r\n#occur\r\nstatic function count_cases($a,$va){//functions root\r\n$r=[\'.\',\'=\',\'{\',\'(\',\'[\',\' \',\"\\n\"]; $n=0;\r\nforeach($r as $k=>$v)$n+=substr_count($va,$v.$a.\'(\');\r\nreturn $n;}\r\n\r\nstatic function occurrences($dr,$r){$rt=[];\r\n$a=strpos($dr,\'/\')?between($dr,\'/\',\'.\',1).\'::\':\'\';\r\nforeach($r as $k=>$v){//0=>func\r\n	foreach(self::$r as $ka=>$va){$n=0; //a/b.php \r\n		if(!$a)$n=self::count_cases($v,$va);//not class\r\n		if($a)$n+=substr_count($va,$a.$v.\'(\');\r\n		$kb=between($ka,\'/\',\'.\',1).\'::\';\r\n		if($a==$kb)$n+=substr_count($va,\'self::\'.$v.\'(\');\r\n		$rt[$a.$v][$ka]=$n;}}//if($n)//if is_related\r\nreturn $rt;}\r\n\r\nstatic function funcount($r){$rt=[]; //pr($r);\r\nforeach($r as $k=>$v)$rt[$k]=self::occurrences($k,$v);\r\nreturn $rt;}\r\n\r\n#capture\r\nstatic function analys($d){$r=explode(\"\\n\",$d); $rf=[];\r\nforeach($r as $k=>$v){if(strpos($v,\'function \')!==false)$rf[]=between($v,\'function \',\'(\');}\r\nreturn $rf;}\r\n\r\nstatic function capture($r,$dr=\'\'){$rt=[];\r\nforeach($r as $k=>$v){\r\n	if(is_array($v))$rt+=self::capture($v,$k.\'/\');\r\n	elseif(substr($v,-3)!=\'.js\'){$f=$dr.$v;\r\n		if(is_file($f)){$d=getfile($f);\r\n			self::$r[$dr.$v]=str_replace([\'\',\'\'],\'\',$d);\r\n			//$a=substr($v,0,-4); //$a=strfrom($a,\'/\');\r\n			$rt[$dr.$v]=self::analys($d);}}}\r\nreturn $rt;}\r\n\r\n#load\r\nstatic function rapport($r,$p){\r\nreturn build::tabler($r[$p]??\'\',\'\',1);}\r\n\r\nstatic function build($p){\r\n[$a,$b]=vals($p,[\'a\',\'inp\']);\r\n$r=scanfiles(self::$dr);\r\n$ra=self::capture($r); $rb=[]; $rc=[]; $rd=[]; $ret=\'\'; //dr/page=>func\r\n$rb=self::funcount($ra); //dr/page=>func=>dr/page=>nb\r\n$rc=self::funclist($rb,0); //page=>func=>content\r\n$rd=self::functree($rc); //pr($rb);\r\n//$re=self::funcsee($rd);\r\nif($b)$ret=self::rapport($rd,$b);\r\nif(self::$save)$ret=self::state($a);\r\nreturn $ret;}\r\n\r\nstatic function state($d){\r\n$na=sql::read(\'count(id)\',\'_prog\',\'v\',\'\');\r\n$nb=sql::read(\'count(id)\',\'_progr\',\'v\',\'\');\r\n$ret=\'action:\'.$d.\', prog:\'.$na.\', progr:\'.$nb;\r\nreturn div($ret,\'frame-blue\');}\r\n\r\nstatic function read($p){\r\n[$a,$b]=vals($p,[\'a\',\'inp\']);\r\nif($b)self::$dr=$b; if($b)self::$save=0;\r\nif($a==\'tree\')$ret=self::mktree($a,$b);\r\nelseif($a==\'vue\')$ret=self::vue($a);\r\nelseif($a==\'see\')$ret=self::see($b);\r\nelseif($a==\'see2\')$ret=self::see2($b);\r\nelseif($a==\'doc\')$ret=self::doc($b);\r\nelse $ret=self::build($p);\r\nreturn $ret;}\r\n\r\nstatic function menu($p,$o){\r\n$j=\'fnc|docs,read|\';\r\n$ret=input(\'inp\',$p);\r\n$ret.=bj($j.\'a=collect|inp\',\'prog\',\'btsav\').\' \';\r\n$ret.=bj($j.\'a=tree|inp\',\'tree\',\'btsav\').\' \';\r\n$ret.=bj($j.\'a=vue|inp\',\'datas\',\'btn\').\' \';\r\n$ret.=bj($j.\'a=see|inp\',\'see\',\'btn\').\' \';\r\n$ret.=bj($j.\'a=see2|inp\',\'see2\',\'btn\').\' \';\r\n$ret.=bj($j.\'a=doc|inp\',\'doc\',\'btn\').\' \';\r\nreturn $ret;}\r\n\r\nstatic function call($p){\r\n[$a,$b]=arr($p,2);\r\nif(!auth(6))self::$save=0;\r\n$bt=self::menu($a,$b);\r\n$ret=self::state($b);\r\nreturn $bt.div($ret,\'\',\'fnc\');}\r\n}', 1, '2023-10-01 16:45:03'),
(108, 'src/php/core', 'docs', '\'.$fc.\'', '\'', '\'\",\"\'', 0, '2023-10-01 16:45:03'),
(109, 'src/php/core', 'docs', 'funcnt', '$p,$r', '//fonctions contents\r\n//if(self::$n==2)return;\r\n$pg=strto($p,\'.\'); $rt=[];\r\n$va=self::$r[$p];\r\nforeach($r as $k=>$v){//fc,occurrences\r\n	$kb=strfrom($k,\'::\');\r\n	$vb=self::find_func($va,$kb);\r\n	self::$rb[$kb]=array_sum($v);\r\n	$rt[$kb]=$vb;}\r\n	//pr($rt);\r\nif(self::$save)self::save($pg,$rt);\r\nreturn $rt;', 1, '2023-10-01 16:45:03'),
(110, 'src/php/core', 'docs', 'funclist', '$r', '$rt=[];\r\nforeach($r as $k=>$v)$rt[$k]=self::funcnt($k,$v);\r\nreturn $rt;', 1, '2023-10-01 16:45:03');
INSERT INTO `_prog` (`id`, `dir`, `page`, `func`, `vars`, `code`, `uses`, `up`) VALUES
(111, 'src/php/core', 'docs', 'count_cases', '$a,$va', '//functions root\r\n$r=[\'.\',\'=\',\'{\',\'(\',\'[\',\' \',\"\\n\"]; $n=0;\r\nforeach($r as $k=>$v)$n+=substr_count($va,$v.$a.\'(\');\r\nreturn $n;}\r\n\r\nstatic function occurrences($dr,$r){$rt=[];\r\n$a=strpos($dr,\'/\')?between($dr,\'/\',\'.\',1).\'::\':\'\';\r\nforeach($r as $k=>$v){//0=>func\r\n	foreach(self::$r as $ka=>$va){$n=0; //a/b.php \r\n		if(!$a)$n=self::count_cases($v,$va);//not class\r\n		if($a)$n+=substr_count($va,$a.$v.\'(\');\r\n		$kb=between($ka,\'/\',\'.\',1).\'::\';\r\n		if($a==$kb)$n+=substr_count($va,\'self::\'.$v.\'(\');\r\n		$rt[$a.$v][$ka]=$n;}}//if($n)//if is_related\r\nreturn $rt;}\r\n\r\nstatic function funcount($r){$rt=[]; //pr($r);\r\nforeach($r as $k=>$v)$rt[$k]=self::occurrences($k,$v);\r\nreturn $rt;}\r\n\r\n#capture\r\nstatic function analys($d){$r=explode(\"\\n\",$d); $rf=[];\r\nforeach($r as $k=>$v){if(strpos($v,\'function \')!==false)$rf[]=between($v,\'function \',\'(\');}\r\nreturn $rf;}\r\n\r\nstatic function capture($r,$dr=\'\'){$rt=[];\r\nforeach($r as $k=>$v){\r\n	if(is_array($v))$rt+=self::capture($v,$k.\'/\');\r\n	elseif(substr($v,-3)!=\'.js\'){$f=$dr.$v;\r\n		if(is_file($f)){$d=getfile($f);\r\n			self::$r[$dr.$v]=str_replace([\'\',\'\'],\'\',$d);\r\n			//$a=substr($v,0,-4); //$a=strfrom($a,\'/\');\r\n			$rt[$dr.$v]=self::analys($d);}}}\r\nreturn $rt;}\r\n\r\n#load\r\nstatic function rapport($r,$p){\r\nreturn build::tabler($r[$p]??\'\',\'\',1);}\r\n\r\nstatic function build($p){\r\n[$a,$b]=vals($p,[\'a\',\'inp\']);\r\n$r=scanfiles(self::$dr);\r\n$ra=self::capture($r); $rb=[]; $rc=[]; $rd=[]; $ret=\'\'; //dr/page=>func\r\n$rb=self::funcount($ra); //dr/page=>func=>dr/page=>nb\r\n$rc=self::funclist($rb,0); //page=>func=>content\r\n$rd=self::functree($rc); //pr($rb);\r\n//$re=self::funcsee($rd);\r\nif($b)$ret=self::rapport($rd,$b);\r\nif(self::$save)$ret=self::state($a);\r\nreturn $ret;}\r\n\r\nstatic function state($d){\r\n$na=sql::read(\'count(id)\',\'_prog\',\'v\',\'\');\r\n$nb=sql::read(\'count(id)\',\'_progr\',\'v\',\'\');\r\n$ret=\'action:\'.$d.\', prog:\'.$na.\', progr:\'.$nb;\r\nreturn div($ret,\'frame-blue\');}\r\n\r\nstatic function read($p){\r\n[$a,$b]=vals($p,[\'a\',\'inp\']);\r\nif($b)self::$dr=$b; if($b)self::$save=0;\r\nif($a==\'tree\')$ret=self::mktree($a,$b);\r\nelseif($a==\'vue\')$ret=self::vue($a);\r\nelseif($a==\'see\')$ret=self::see($b);\r\nelseif($a==\'see2\')$ret=self::see2($b);\r\nelseif($a==\'doc\')$ret=self::doc($b);\r\nelse $ret=self::build($p);\r\nreturn $ret;}\r\n\r\nstatic function menu($p,$o){\r\n$j=\'fnc|docs,read|\';\r\n$ret=input(\'inp\',$p);\r\n$ret.=bj($j.\'a=collect|inp\',\'prog\',\'btsav\').\' \';\r\n$ret.=bj($j.\'a=tree|inp\',\'tree\',\'btsav\').\' \';\r\n$ret.=bj($j.\'a=vue|inp\',\'datas\',\'btn\').\' \';\r\n$ret.=bj($j.\'a=see|inp\',\'see\',\'btn\').\' \';\r\n$ret.=bj($j.\'a=see2|inp\',\'see2\',\'btn\').\' \';\r\n$ret.=bj($j.\'a=doc|inp\',\'doc\',\'btn\').\' \';\r\nreturn $ret;}\r\n\r\nstatic function call($p){\r\n[$a,$b]=arr($p,2);\r\nif(!auth(6))self::$save=0;\r\n$bt=self::menu($a,$b);\r\n$ret=self::state($b);\r\nreturn $bt.div($ret,\'\',\'fnc\');}', 1, '2023-10-01 16:45:03'),
(112, 'src/php/core', 'docs', 'occurrences', '$dr,$r', '$rt=[];\r\n$a=strpos($dr,\'/\')?between($dr,\'/\',\'.\',1).\'::\':\'\';\r\nforeach($r as $k=>$v){//0=>func\r\n	foreach(self::$r as $ka=>$va){$n=0; //a/b.php \r\n		if(!$a)$n=self::count_cases($v,$va);//not class\r\n		if($a)$n+=substr_count($va,$a.$v.\'(\');\r\n		$kb=between($ka,\'/\',\'.\',1).\'::\';\r\n		if($a==$kb)$n+=substr_count($va,\'self::\'.$v.\'(\');\r\n		$rt[$a.$v][$ka]=$n;}}//if($n)//if is_related\r\nreturn $rt;', 1, '2023-10-01 16:45:03'),
(113, 'src/php/core', 'docs', 'funcount', '$r', '$rt=[]; //pr($r);\r\nforeach($r as $k=>$v)$rt[$k]=self::occurrences($k,$v);\r\nreturn $rt;', 1, '2023-10-01 16:45:03'),
(114, 'src/php/core', 'docs', 'analys', '$d', '$r=explode(\"\\n\",$d); $rf=[];\r\nforeach($r as $k=>$v){if(strpos($v,\'function \')!==false)$rf[]=between($v,\'function \',\'(\');}\r\nreturn $rf;', 1, '2023-10-01 16:45:03'),
(115, 'src/php/core', 'docs', '\')!==false)$rf[]=between', '$v,\'function \',\'(\'', '$rt=[];\r\nforeach($r as $k=>$v){\r\n	if(is_array($v))$rt+=self::capture($v,$k.\'/\');\r\n	elseif(substr($v,-3)!=\'.js\'){$f=$dr.$v;\r\n		if(is_file($f)){$d=getfile($f);\r\n			self::$r[$dr.$v]=str_replace([\'\',\'\'],\'\',$d);\r\n			//$a=substr($v,0,-4); //$a=strfrom($a,\'/\');\r\n			$rt[$dr.$v]=self::analys($d);}}}\r\nreturn $rt;', 0, '2023-10-01 16:45:03'),
(116, 'src/php/core', 'docs', 'capture', '$r,$dr=\'\'', '$rt=[];\r\nforeach($r as $k=>$v){\r\n	if(is_array($v))$rt+=self::capture($v,$k.\'/\');\r\n	elseif(substr($v,-3)!=\'.js\'){$f=$dr.$v;\r\n		if(is_file($f)){$d=getfile($f);\r\n			self::$r[$dr.$v]=str_replace([\'\',\'\'],\'\',$d);\r\n			//$a=substr($v,0,-4); //$a=strfrom($a,\'/\');\r\n			$rt[$dr.$v]=self::analys($d);}}}\r\nreturn $rt;', 2, '2023-10-01 16:45:03'),
(117, 'src/php/core', 'docs', 'rapport', '$r,$p', 'return build::tabler($r[$p]??\'\',\'\',1);', 1, '2023-10-01 16:45:03'),
(118, 'src/php/core', 'docs', 'build', '$p', '[$a,$b]=vals($p,[\'a\',\'inp\']);\r\n$r=scanfiles(self::$dr);\r\n$ra=self::capture($r); $rb=[]; $rc=[]; $rd=[]; $ret=\'\'; //dr/page=>func\r\n$rb=self::funcount($ra); //dr/page=>func=>dr/page=>nb\r\n$rc=self::funclist($rb,0); //page=>func=>content\r\n$rd=self::functree($rc); //pr($rb);\r\n//$re=self::funcsee($rd);\r\nif($b)$ret=self::rapport($rd,$b);\r\nif(self::$save)$ret=self::state($a);\r\nreturn $ret;', 1, '2023-10-01 16:45:03'),
(119, 'src/php/core', 'docs', 'state', '$d', '$na=sql::read(\'count(id)\',\'_prog\',\'v\',\'\');\r\n$nb=sql::read(\'count(id)\',\'_progr\',\'v\',\'\');\r\n$ret=\'action:\'.$d.\', prog:\'.$na.\', progr:\'.$nb;\r\nreturn div($ret,\'frame-blue\');', 3, '2023-10-01 16:45:03'),
(120, 'src/php/core', 'docs', 'read', '$p', '[$a,$b]=vals($p,[\'a\',\'inp\']);\r\nif($b)self::$dr=$b; if($b)self::$save=0;\r\nif($a==\'tree\')$ret=self::mktree($a,$b);\r\nelseif($a==\'vue\')$ret=self::vue($a);\r\nelseif($a==\'see\')$ret=self::see($b);\r\nelseif($a==\'see2\')$ret=self::see2($b);\r\nelseif($a==\'doc\')$ret=self::doc($b);\r\nelse $ret=self::build($p);\r\nreturn $ret;', 0, '2023-10-01 16:45:03'),
(121, 'src/php/core', 'docs', 'menu', '$p,$o', '$j=\'fnc|docs,read|\';\r\n$ret=input(\'inp\',$p);\r\n$ret.=bj($j.\'a=collect|inp\',\'prog\',\'btsav\').\' \';\r\n$ret.=bj($j.\'a=tree|inp\',\'tree\',\'btsav\').\' \';\r\n$ret.=bj($j.\'a=vue|inp\',\'datas\',\'btn\').\' \';\r\n$ret.=bj($j.\'a=see|inp\',\'see\',\'btn\').\' \';\r\n$ret.=bj($j.\'a=see2|inp\',\'see2\',\'btn\').\' \';\r\n$ret.=bj($j.\'a=doc|inp\',\'doc\',\'btn\').\' \';\r\nreturn $ret;', 1, '2023-10-01 16:45:03'),
(122, 'src/php/core', 'docs', 'call', '$p', '[$a,$b]=arr($p,2);\r\nif(!auth(6))self::$save=0;\r\n$bt=self::menu($a,$b);\r\n$ret=self::state($b);\r\nreturn $bt.div($ret,\'\',\'fnc\');', 0, '2023-10-01 16:45:03'),
(123, 'src/php/core', 'edit', 'save', '$p', '$a=$p[\'a\']??\'\';\r\n//if($a!=\'tracks\')return $no;//derogation\r\n$ra=db::cols_k($a);\r\n$rd=walk($ra,\'unid\');\r\n$rb=vals($p,$rd);\r\n$rt=array_combine($ra,$rb);\r\n$nid=sql::sav($a,$rt);\r\nif($nid)$ret=alert(\'saved\',\'green\');\r\nelse $ret=alert(\'error\',\'red\');\r\n$tg=$a.\'c1,\'.$a.\'c2,\'.$a.\'c3\';\r\n$ret.=bj($tg.\'|edit,read|a=\'.$a.\',b=play,c=\'.$nid,voc(\'return\'),\'btn\');\r\nreturn $ret;', 0, '2023-10-01 16:45:03'),
(124, 'src/php/core', 'edit', 'update', '$p', '[$a,$id]=vals($p,[\'a\',\'id\']);\r\n$ra=db::cols_k($a);\r\n$rd=walk($ra,\'unid\');\r\n$rb=vals($p,$rd);\r\n$rt=array_combine($ra,$rb);\r\n$nid=sql::upd($a,$rt,$id);\r\nif($nid)$ret=alert(\'saved\',\'green\');\r\nelse $ret=alert(\'error\',\'red\');\r\n$tg=$a.\'c1,\'.$a.\'c2,\'.$a.\'c3\';\r\n$ret.=bj($tg.\'|edit,read|a=\'.$a.\',b=edit,c=\'.$id,voc(\'return\'),\'btn\');\r\nreturn $ret;', 0, '2023-10-01 16:45:03'),
(125, 'src/php/core', 'edit', 'create', '$p', '$r=[];\r\n[$a,$id]=vals($p,[\'a\',\'id\']);\r\n$ra=db::cols_r($a); if(!$ra)return;\r\n//if($b && $id)$r=sql::read(\'all\',$a,\'a\',$id,0);\r\n$keys=implode(\',\',walk(array_keys($ra),\'unid\'));\r\n$ret=bj($a.\'3|edit,save|a=\'.$a.\',id=\'.$id.\'|\'.$keys,icovoc(\'save\'),\'btsav\');\r\n$r[\'uid\']=ses(\'uid\');\r\n$ret.=form::call($ra,$r);\r\nreturn $ret;', 1, '2023-10-01 16:45:03'),
(126, 'src/php/core', 'edit', 'edit', '$p', '$r=[];\r\n[$a,$id]=vals($p,[\'a\',\'id\']);\r\nif(!$id)return \'noid\';\r\n$ra=db::cols_r($a); if(!$ra)return;\r\nif($a && $id)$r=sql::read(\'all\',$a,\'a\',$id);\r\n$keys=implode(\',\',walk(array_keys($ra),\'unid\'));\r\n$ret=bj($a.\'c3|edit,update|a=\'.$a.\',id=\'.$id.\'|\'.$keys,icovoc(\'update\'),\'btsav\');\r\n$ret.=form::call($ra,$r);\r\nreturn $ret;', 1, '2023-10-01 16:45:03'),
(127, 'src/php/core', 'edit', 'play', '$p', '$r=[];\r\n[$a,$id]=vals($p,[\'a\',\'id\']);\r\nif(!$id)return \'noid\';\r\n//$ra=db::cols_k($b);\r\n$r=sql::read(\'all\',$a,\'a\',$id);\r\nreturn build::tabler($r);', 1, '2023-10-01 16:45:03'),
(128, 'src/php/core', 'edit', 'read', '$p', '$rt=[];\r\n[$a,$b,$c]=vals($p,[\'a\',\'b\',\'c\']);\r\n$pr=[\'a\'=>$a,\'id\'=>$c]; $rt=[\'\',\'\',\'\'];\r\n$rt[0]=self::menu($a,$b,$c);\r\nif($a && $b!=\'create\')$rt[1]=self::entries($a,$b,$c);\r\n$rt[2]=match($b){\r\n	\'play\'=>self::play($pr),\r\n	\'edit\'=>self::edit($pr),\r\n	\'create\'=>self::create($pr),\r\n	default=>\'\'};\r\nreturn $rt;', 1, '2023-10-01 16:45:03'),
(129, 'src/php/core', 'edit', 'entries', '$a,$b,$c', '$rt=[];\r\n$ra=db::cols_r($a); $q=[];\r\nif(isset($r[\'uid\']))$q=[\'uid\'=>ses(\'uid\')];\r\nelseif(!auth(6))return;\r\n$r=sql::read(\'id\',$a,\'rv\',$q);\r\n$tg=$a.\'c1,\'.$a.\'c2,\'.$a.\'c3\';\r\n//foreach($r as $k=>$v)$rt[]=bj($tg.\'|edit,read|a=\'.$a.\',b=\'.$b.\',c=\'.$v,$v,active($c,$v));\r\nforeach($r as $k=>$v)$rt[]=bjr($tg,\'edit,read\',[\'a\'=>$a,\'b\'=>$b,\'c\'=>$v],$v,active($c,$v));\r\n$ret=join(\'\',$rt);\r\nreturn $ret;', 1, '2023-10-01 16:45:03'),
(130, 'src/php/core', 'edit', 'menu', '$a,$b,$c', '$r=[\'play\',\'edit\']; $rt=[];\r\nif(auth(self::$ath))$r+=[\'create\'];\r\n$tg=$a.\'c1,\'.$a.\'c2,\'.$a.\'c3\';\r\n//foreach($r as $k=>$v)$rt[]=bj($tg.\'|edit,read|a=\'.$a.\',b=\'.$v.\',c=\'.$c,$v,active($b,$v));\r\nforeach($r as $k=>$v)$rt[]=bjr($tg,\'edit,read\',[\'a\'=>$a,\'b\'=>$v,\'c\'=>$c],$v,active($b,$v));\r\nreturn join(\'\',$rt);', 1, '2023-10-01 16:45:03'),
(131, 'src/php/core', 'edit', 'list', '', '$rt=[];\r\n$r=sql::call(\'show tables\',\'rv\');\r\nforeach($r as $k=>$v)$rt[]=bj(\'edt|edit,call|a=\'.$v.\',b=play,c=\',$v);//bh(\'edit/\'.$v,$v);\r\n$ret=join(\'\',$rt);\r\nreturn $ret.div(\'\',\'\',\'edt\');', 1, '2023-10-01 16:45:03'),
(132, 'src/php/core', 'edit', 'call', '$p', '[$a,$b,$c]=vals($p,[\'a\',\'b\',\'c\']);//table,action,id\r\n[$menu,$entries,$res]=self::read($p);\r\nif(!$a)$menu=self::list();\r\nreturn h2($a).div($menu,\'menu\',$a.\'c1\').div($entries,\'menu\',$a.\'c2\').div($res,\'\',$a.\'c3\');', 0, '2023-10-01 16:45:03'),
(133, 'src/php/core', 'form', 'tabler', '$r', '', 0, '2023-10-01 16:45:03'),
(134, 'src/php/core', 'form', 'build', '$r', '$rt=[];\r\nforeach($r as $k=>$v){\r\n	[$id,$ty,$va]=$v; $rid=unid($id);\r\n	$rp=[\'placeholder\'=>$id];\r\n	if($ty==\'text\' or $ty==\'long\')$d=textarea($rid,$va,40,4,$rp);\r\n	elseif($ty==\'json\')$d=textarea($rid,$va?$va:\'{}\',40,4,$rp);\r\n	elseif($ty==\'int\')$d=inpnb($rid,$va);\r\n	elseif($ty==\'date\' or $ty==\'time\')$d=inpdate($rid,$va?$va:sqldate(),1);\r\n	else $d=input($rid,$va,\'32\',$rp);\r\n	$rt[]=div($d.\' \'.label($rid,$id));}\r\nreturn join(\'\',$rt);', 1, '2023-10-01 16:45:03'),
(135, 'src/php/core', 'form', 'call', '$ra,$r=[]', '$rt=[];\r\n//foreach($r as $k=>$v)$rt[$k]=array_combine($ra,$v);\r\nforeach($ra as $k=>$v)$rt[]=[$k,$v,$r[$k]??\'\'];\r\nreturn self::build($rt);', 3, '2023-10-01 16:45:03'),
(136, 'src/php/core', 'head', 'add', '$k,$v', 'self::$r[][$k]=$v;', 1, '2023-10-01 16:45:03'),
(137, 'src/php/core', 'head', 'json', '$a', 'self::$r=json::call($a);', 2, '2023-10-01 16:45:03'),
(138, 'src/php/core', 'head', 'ra', '$r', 'foreach($r as $k=>$v)self::$r[][$k]=$v;', 0, '2023-10-01 16:45:03'),
(139, 'src/php/core', 'head', 'meta', '$d,$v,$c=\'\'', 'return taga(\'meta\',[$d=>$v,\'content\'=>$c]).\"\\n\";', 3, '2023-10-01 16:45:03'),
(140, 'src/php/core', 'head', 'csslink', '$d', 'return taga(\'link\',[\'href\'=>$d,\'rel\'=>\'stylesheet\']).\"\\n\";', 1, '2023-10-01 16:45:03'),
(141, 'src/php/core', 'head', 'jslink', '$d', 'return tag(\'script\',[\'src\'=>$d],\'\').\"\\n\";', 1, '2023-10-01 16:45:03'),
(142, 'src/php/core', 'head', 'csscode', '$d', 'return tag(\'style\',[\'type\'=>\'text/css\'],$d).\"\\n\";', 1, '2023-10-01 16:45:03'),
(143, 'src/php/core', 'head', 'jscode', '$d', 'return tag(\'script\',[\'type\'=>\'text/javascript\'],$d).\"\\n\";', 2, '2023-10-01 16:45:03'),
(144, 'src/php/core', 'head', 'css', '$d', '$c=self::$rid;\r\nreturn taga(\'link\',[\'href\'=>self::$path.\'/css/\'.$d.\'.css\'.$c,\'rel\'=>\'stylesheet\']).\"\\n\";', 1, '2023-10-01 16:45:03'),
(145, 'src/php/core', 'head', 'js', '$d', '$c=self::$rid; $b=ses(\'dev\');\r\nreturn tag(\'script\',[\'src\'=>self::$path.\'/js/\'.$d.\'.js\'.$c],\'\').\"\\n\";', 1, '2023-10-01 16:45:03'),
(146, 'src/php/core', 'head', 'link', '$d,$v', 'return taga(\'link\',[\'rel\'=>$d,\'href\'=>$v]).\"\\n\";', 1, '2023-10-01 16:45:03'),
(147, 'src/php/core', 'head', 'relod', '$v', 'echo self::jscode(\'window.location=\"\'.$v.\'\"\');', 0, '2023-10-01 16:45:03'),
(148, 'src/php/core', 'head', 'build', '', '$r=self::$r; $rt=[]; if(ses(\'dev\'))self::$rid=\'?\'.rid();\r\nif($r)foreach($r as $k=>$v){$va=current($v); $ka=key($v); $rt[]=match($ka){\r\n\'css\'=>self::css($va),\'js\'=>self::js($va),\r\n\'csslink\'=>self::csslink($va),\'jslink\'=>self::jslink($va),\r\n\'csscode\'=>self::csscode($va),\'jscode\'=>self::jscode($va),\r\n\'name\'=>self::meta(\'name\',$va[0],$va[1]),\'code\'=>$va.\"\\n\",\r\n\'meta\'=>self::meta($va[0],$va[1],$va[2]),\'link\'=>self::link($va[0],$va[1]),\r\n\'tagb\'=>tag($va[0],[],$va[1]).\"\\n\",\'taga\'=>taga(key($va),current($va)).\"\\n\",\r\ndefault=>self::meta($ka,$va[0],$va[1])};}\r\nreturn implode(\'\',$rt);', 3, '2023-10-01 16:45:03'),
(149, 'src/php/core', 'head', 'html', '$lg=\'fr\'', 'return \'<!DOCTYPE html>\'.\"\\n\".\'<html lang=\"\'.$lg.\'\" xml:lang=\"\'.$lg.\'\">\'.\"\\n\";', 1, '2023-10-01 16:45:03'),
(150, 'src/php/core', 'head', 'run', '$lg=\'fr\'', 'return self::html($lg).tag(\'head\',[],self::build()).\"\\n\";', 2, '2023-10-01 16:45:03'),
(151, 'src/php/core', 'head', 'page', '$d,$lg=\'fr\'', '$rp=[\'onclick\'=>\'clpop(event)\',\'onmousemove\'=>\'popslide(event)\'];\r\nreturn self::run($lg).tag(\'body\',$rp,$d).\'</html>\';', 1, '2023-10-01 16:45:03'),
(152, 'src/php/core', 'head', 'call', '$r=[]', 'if($r)self::$r=array_merge($r,self::$r); return self::build();', 0, '2023-10-01 16:45:03'),
(153, 'src/php/core', 'head', 'get', '', 'return self::build();', 0, '2023-10-01 16:45:03'),
(154, 'src/php/core', 'img', 'b64img', '$u', 'if(substr($u,0,21)==\'data:image/png;base64\'){$d=substr($u,22); $xt=\'.png\';}\r\nelseif(substr($u,0,22)==\'data:image/jpeg;base64\'){$d=substr($u,23); $xt=\'.jpg\';}\r\n$f=unid($d).$xt; putfile(\'img/\'.$f,base64_decode($d));\r\nreturn $f;', 1, '2023-10-01 16:45:03'),
(155, 'src/php/core', 'img', 'imgthumb', '$f', '$fa=\'img/full/\'.$f; $fc=\'img/mini/\'.$f;\r\nif(!is_file($fc) && is_file($fa))self::thumb($fa,$fc,170,170,0);\r\n//elseif(is_file($fc))unlink($fc);//maintenance\r\nreturn $fc;', 0, '2023-10-01 16:45:03'),
(156, 'src/php/core', 'img', 'getim', '$f,$w=240,$h=180', '$er=1;\r\nif(substr($f,0,4)!=\'http\')return;\r\nif(strpos($f,\'?\'))$f=struntil($f,\'?\');\r\n$xt=xt($f); if(!$xt)$xt=\'.jpg\';\r\n$nm=unid($f,10); $h=$h?$h:$w;\r\n$fa=\'img/full/\'.$nm.$xt;\r\n$fb=\'img/mini/\'.$nm.$xt;\r\nif(is_file($fa))return $nm.$xt;\r\n$ok=@copy($f,$fa); if(!$ok){$d=getfile($f); if($d)$er=putfile($fa,$d);}\r\nif($ok or !$er)if(filesize($fa)){\r\n    [$wa,$ha]=getimagesize($fa); if($wa>$w or $ha>$h)self::thumb($fa,$fb,$w,$h,0);\r\n    return $nm.$xt;}', 1, '2023-10-01 16:45:03'),
(157, 'src/php/core', 'img', 'scale', '$w,$h,$wo,$ho,$s', '$hx=$wo/$w; $hy=$ho/$h; $yb=0; $xb=0;\r\nif($s==2){$xb=($wo/2)-($w/2); $yb=($ho/2)-($h/2); $wo=$w; $ho=$h;}\r\nelseif($hy<$hx && $s){$xb=0; $yb=($ho-($h*$hx))/2; $ho=$ho/($hy/$hx);}//reduce_h\r\nelseif($hy>$hx && $s){$xb=($wo-($w*$hy))/2; $wo=$wo/($hx/$hy);}//reduce_w\r\nelseif($hy<$hx){$xb=($wo-($w*$hy))/2; $wo=$wo/($hx/$hy);}//adapt_h\r\nelseif($hy && $hx){$xb=0; $ho=$ho/($hy/$hx);}//adapt_w\r\nreturn [round($wo),round($ho),round($xb),round($yb)];', 1, '2023-10-01 16:45:03'),
(158, 'src/php/core', 'img', 'thumb', '$in,$out,$w,$h,$s', '$xa=0; $ya=0;\r\n$w=$w?$w:170; $h=$h?$h:100; [$wo,$ho,$ty]=getimagesize($in);\r\n[$wo,$ho,$xb,$yb]=self::scale($w,$h,$wo,$ho,$s);\r\nif(is_file($in))if(fsize($in)>5000)return;\r\n$img=imagecreatetruecolor($w,$h);\r\nif($ty==2){$im=imagecreatefromjpeg($in);\r\n    imagecopyresampled($img,$im,$xa,$ya,$xb,$yb,$w,$h,$wo,$ho);\r\n    imagejpeg($img,$out,100);}\r\nelseif($ty==1){$im=imagecreatefromgif($in); self::alpha($img);\r\n    imagecopyresampled($img,$im,$xa,$ya,$xb,$yb,$w,$h,$wo,$ho);\r\n    imagegif($img,$out);}\r\nelseif($ty==3){$im=imagecreatefrompng($in); self::alpha($img);\r\n    imagecopyresampled($img,$im,$xa,$ya,$xb,$yb,$w,$h,$wo,$ho);\r\n    imagepng($img,$out);}\r\nreturn $out;', 2, '2023-10-01 16:45:03'),
(159, 'src/php/core', 'img', 'alpha', '$img', '//imagefilledrectangle($im,0,0,$w,$h,$wh);\r\n$c=imagecolorallocate($img,255,255,255); imagecolortransparent($img,$c);\r\nimagealphablending($img,false);\r\nimagesavealpha($img,true);', 2, '2023-10-01 16:45:03'),
(160, 'src/php/core', 'jedt', 'addnew', '$a,$v', '$f=json::file($a);\r\n$d=getfile($f);\r\n$r=json_decode($d,true);\r\n//if($r[$k]??\'\')return alert(\'really?\',\'red\');\r\n$r[]=array_values($v);\r\n$d=json_encode($r);\r\nputfile($f,$d);\r\nreturn alert(\'saved\',\'green\');', 1, '2023-10-01 16:45:03'),
(161, 'src/php/core', 'jedt', 'update', '$a,$k,$col,$val', '$f=json::file($a);\r\n$d=getfile($f);\r\n$r=json_decode($d,true);\r\nif($col==\'k\')$r[$k]=$val;\r\nelse $r[$k][$col]=$val;\r\n$d=json_encode($r);\r\n//pr($col);\r\n//putfile($f,$d);', 1, '2023-10-01 16:45:03'),
(162, 'src/php/core', 'jedt', 'save', '$p', '$com=array_shift($p);\r\nreturn jedt::addnew(\'cnfg/nav\',$com,$p);', 0, '2023-10-01 16:45:03'),
(163, 'src/php/core', 'jedt', 'create', '', '$r=[\'com\',\'bt\',\'ico\',\'auth\'];\r\n$ra=array_combine($r,[\'var\',\'var\',\'var\',\'int\']);\r\n$rb=array_combine($r,[\'com\',\'bt\',\'ico\',\'0\']);\r\n$keys=implode(\',\',walk($r,\'unid\'));\r\n$ret=bj(\'navedt|nav,save||\'.$keys,icovoc(\'save\'),\'btsav\');\r\n$ret.=form::call($ra,$rb);\r\nreturn $ret.div(\'\',\'\',\'navedt\');', 0, '2023-10-01 16:45:03'),
(164, 'src/php/core', 'jedt', 'modif', '$p', '$r=json::call(\'cnfg/nav\'); [$ka,$col]=explode(\'-\',key($p)); $val=current($p); $i=0;\r\nforeach($r as $k=>$v){$i++; if($i==$ka)$ka=$k;}\r\nself::update(\'cnfg/nav\',$ka,$col,$val);\r\nreturn $val;', 0, '2023-10-01 16:45:03'),
(165, 'src/php/core', 'jedt', 'artype', '$r', '$ty=\'\'; $isrb=\'\'; $isrc=\'\'; $isrd=\'\';\r\n$k=key($r); $v=current($r); $nk=is_numeric($k)?1:0; $isr=is_array($v)?1:0;\r\nif($isr){$kb=key($v); $vb=next($v); $nkb=is_numeric($kb)?1:0; $isrb=is_array($vb)?1:0;}\r\nif($isrb){$kc=key($vb); $vc=next($vb); $nkc=is_numeric($kc)?1:0; $isrc=is_array($vc)?1:0;}\r\nif($isrc){$kd=key($vc); $vd=next($vc); $nkd=is_numeric($kd)?1:0; $isrd=is_array($vd)?1:0;}\r\nif($isrd)$ty=$nkd?\'kkkr\':\'rrrr\';\r\nelseif($isrc)$ty=$nkd?\'kkr\':\'rrr\';\r\nelseif($isrb)$ty=$nkc?\'kkv\':\'rr\';\r\nelseif($isr)$ty=$nkb?\'rv\':\'ra\';\r\nelse $ty=$nk?\'kv\':\'a\';\r\nreturn $ty;', 1, '2023-10-01 16:45:03'),
(166, 'src/php/core', 'jedt', 'addrow', '$p', '$ret=\'\';\r\n$a=$p[\'a\']; $r=json::call($a); $r[]=array_pad([],count(current($r)),\'\'); $h=[];\r\nreturn build::editable($r,\'jedt,modif|\',$h,1);', 0, '2023-10-01 16:45:03'),
(167, 'src/php/core', 'jedt', 'edit', '$p', '$ret=\'\';\r\n$a=$p[\'a\']; $r=json::call($a);\r\n$ty=self::artype($r); $h=[];\r\nif($ty==\'a\' or $ty==\'rv\')$ret=build::editable($r,\'jedt,modif|\',$h,1);\r\nelse $ret=self::editxt($p);\r\n$bt=bj(\'jmnu|jedt,editxt|a=\'.$a,ico(\'edit\').strend($a,\'/\').\'(\'.$ty.\')\');\r\nif($ty==\'a\' or $ty==\'rv\')$bt.=bj(\'navedt|jedt,addrow|a=\'.$a,ico(\'plus\'));\r\nreturn $bt.div($ret,\'\',\'navedt\');', 0, '2023-10-01 16:45:03'),
(168, 'src/php/core', 'jedt', 'savext', '$p', '$f=json::file($p[\'a\']);\r\nputfile($f,$p[\'inp\']);\r\nreturn alert(\'saved\',\'green\');', 0, '2023-10-01 16:45:03'),
(169, 'src/php/core', 'jedt', 'editxt', '$p', '$f=json::file($p[\'a\']);\r\n$d=getfile($f);\r\n$ret=bj(\'jedt|json,savext|a=\'.$p[\'a\'].\'|inp\',icovoc(\'save\'),\'btsav\');\r\n$ret.=div(textarea(\'inp\',$d,\'\',24,[\'class\'=>\'console\']),\'area\');\r\nreturn div($ret,\'\',\'jedt\');', 1, '2023-10-01 16:45:03'),
(170, 'src/php/core', 'jedt', 'bt', '$v', 'return bj(\'jmnu|jedt,edit|a=\'.$v,strend($v,\'/\'));', 0, '2023-10-01 16:45:03'),
(171, 'src/php/core', 'jedt', 'itermenu', '$ka,$r,$rt=[]', 'foreach($r as $k=>$v)\r\nif(is_array($v))$rt=self::itermenu($k,$v,$rt);\r\nelse $rt[$ka][]=$v;\r\nreturn $rt;', 2, '2023-10-01 16:45:03'),
(172, 'src/php/core', 'jedt', 'menu', '', '$dr=\'src/json\';\r\n$r=scanfiles($dr); $ra=[]; $rt=[];\r\nforeach($r as $k=>$v){\r\n	$vb=str_replace([$dr.\'/\',\'.json\'],\'\',$v);\r\n	[$ka,$kb,$kc]=expl(\'/\',$vb,3);\r\n	if($kc)$ra[$ka][$kb][$kc]=$vb;\r\n	elseif($kb)$ra[$ka][$kb]=$vb;}\r\n$rb=self::itermenu(\'/\',$ra);\r\nforeach($rb as $k=>$v)$rt[]=div($k.\' \'.join(\'\',walk($v,\'jedt::bt\')));\r\nreturn join(\'\',$rt);', 2, '2023-10-01 16:45:03'),
(173, 'src/php/core', 'jedt', 'call', '$p', 'return div(self::menu(),\'menu\').div(\'\',\'\',\'jmnu\');', 0, '2023-10-01 16:45:03'),
(174, 'src/php/core', 'json', 'file', '$a', 'return self::$path.$a.\'.json\';', 8, '2023-10-01 16:45:03'),
(175, 'src/php/core', 'json', 'error', '', 'return match(json_last_error()){\r\nJSON_ERROR_NONE=>0,\r\nJSON_ERROR_DEPTH=>1,//\'Profondeur maximale atteinte\'\r\nJSON_ERROR_STATE_MISMATCH=>2,//\'Inadéquation des modes ou underflow\'\r\nJSON_ERROR_CTRL_CHAR=>3,//\'Erreur lors du contrôle des caractères\'\r\nJSON_ERROR_SYNTAX=>4,//\'Erreur de syntaxe ; JSON malformé\'\r\nJSON_ERROR_UTF8=>5,//\'Caractères UTF-8 malformés, erreur encodage\'\r\ndefault=>6};', 1, '2023-10-01 16:45:03'),
(176, 'src/php/core', 'json', 'err', '$r,$a=\'\'', '$e=self::error(); if(!$e)return;\r\nif($r)return json_encode(array_combine(array_keys($r),array_fill(0,count($r),$e)));\r\nelse return \'error in: \'.self::file($a);', 2, '2023-10-01 16:45:03'),
(177, 'src/php/core', 'json', 'build', '$r', '$rt=json_encode($r,JSON_HEX_TAG);\r\nif($e=self::err($r))echo $e;\r\nreturn $rt;', 0, '2023-10-01 16:45:03'),
(178, 'src/php/core', 'json', 'call', '$a', '$r=[];\r\n$f=self::file($a);\r\nif(is_file($f)){\r\n	$d=getfile($f);\r\n	$r=json_decode($d,true);\r\n	if($e=self::err($r,$a))echo $e;}\r\nelse err(\'not loaded: \'.$f);\r\nreturn $r;', 13, '2023-10-01 16:45:03'),
(179, 'src/php/core', 'login', 'hash', '$d', 'return password_hash($d,PASSWORD_DEFAULT);', 2, '2023-10-01 16:45:03'),
(180, 'src/php/core', 'login', 'vrfpsw', '$d,$hash', 'return password_verify($d,$hash);', 1, '2023-10-01 16:45:03'),
(181, 'src/php/core', 'login', 'uid', '$a', 'return sql::read(\'id\',\'users\',\'v\',[\'name\'=>$a]);', 2, '2023-10-01 16:45:03'),
(182, 'src/php/core', 'login', 'register', '$p', '$ok=\'\';\r\n[$a,$b,$c]=vals($p,[\'name\',\'mail\',\'pswd\']);\r\n$ex=self::firstuser(); $auth=$ex?1:6; $psw=self::hash($c);\r\n$ex=self::uid($a); if($ex)return alert(\'already_exists\',\'red\');\r\nif(!filter_var($b,FILTER_VALIDATE_EMAIL))return alert(\'bad_mail\',\'red\');\r\nif($a && $b && $c && !$ex)$ok=sql::sav(\'users\',[$a,$auth,$b,$psw,uip()]);\r\nif($ok)$ak=sql::sav(\'profile\',[$ok,$a,\'here\',self::$default_ban,\'\']);\r\nif($ok)self::identify($ok);\r\nif($ok)$ret=alert(\'registered\',\'blue\');\r\nelse $ret=alert(\'notregistered\',\'red\');\r\nreturn $ret;', 1, '2023-10-01 16:45:03'),
(183, 'src/php/core', 'login', 'firstuser', '', 'return sql::read(\'id\',\'users\',\'v\',1);', 2, '2023-10-01 16:45:03'),
(184, 'src/php/core', 'login', 'form', '$p', '[$a,$b]=vals($p,[\'a\',\'b\']);\r\n$ret=h3(voc(\'login_bt\'));\r\nif(!self::firstuser())$ret.=alert(\'first_user\',\'white\');\r\n$ret.=bj(\',|login,port||name,pswd\',voc(\'go\'),\'btsav\',[\'id\'=>\'logbt\']);\r\n$ret.=div(inputj(\'name\',\'\',\'logbt\').label(\'name\',voc(\'knowname\')));\r\n$ret.=div(inputj(\'pswd\',\'\',\'logbt\',[\'type\'=>\'password\']).label(\'pswd\',voc(\'password\')));\r\nreturn $ret;', 1, '2023-10-01 16:45:03'),
(185, 'src/php/core', 'login', 'response', '$p', '[$a,$b]=vals($p,[\'name\',\'pswd\']);\r\n$uid=sql::read(\'id\',\'users\',\'v\',[\'name\'=>$a]);\r\n$psw=sql::read(\'pswd\',\'users\',\'v\',[\'id\'=>$uid]);\r\n$ok=self::vrfpsw($b,$psw);\r\nif($ok){self::identify($uid); $ret=alert(\'loged\',\'green\',$a).bh(\'/\',icovoc(\'home\'),\'bigbt\');}\r\nelseif($uid){\r\n	$ret=alert(\'bad_password\',\'red\');\r\n	$ret.=div(bh(\'login\',voc(\'redo\'),\'btn\'));\r\n	$ret.=hidden(\'name\',$a);\r\n	$ret.=div(inpsw(\'pswd\',$b).label(\'pswd\',voc(\'password\')));\r\n	$ret.=bj(\',|login,port||name,pswd\',voc(\'go\'),\'btsav\');}\r\nelse{\r\n	$ret=alert(\'inexistant_user\',\'red\');\r\n	$ret.=div(bh(\'login\',voc(\'go\'),\'btn\'));\r\n	$ret.=hidden(\'name\',$a).hidden(\'pswd\',$b);\r\n	$ret.=div(inpmail(\'mail\',\'\').label(\'mail\',voc(\'knownmail\')));\r\n	$ret.=bj(\',|login,port_register||name,mail,pswd\',voc(\'register?\'),\'btsav\');\r\n	$ret.=div(\'\',\'\',\'tgreg\');}\r\nreturn $ret;', 1, '2023-10-01 16:45:03'),
(186, 'src/php/core', 'login', 'identify', '$id=\'\'', '$r=sql::inner(\'b1.id,uid,b1.name,auth,slogan,logo,ip\',\'users\',\'profile\',\'uid\',\'a\',[\'b1.id\'=>$id]);\r\nif(!$r)return;// pr($r); trace();\r\ncookie(\'uid\',$r[\'id\']);\r\nses(\'uid\',$r[\'id\']);\r\nses(\'usr\',$r[\'name\']);\r\nses(\'auth\',$r[\'auth\']); //auth(6);\r\nses::$r[\'usr\']=$r;', 5, '2023-10-01 16:45:03'),
(187, 'src/php/core', 'login', 'resetpsw', '', '', 0, '2023-10-01 16:45:03'),
(188, 'src/php/core', 'login', 'resetip', '', '$ip=sql::read(\'ip\',\'users\',\'v\',[\'id\'=>ses(\'uid\')]);\r\nif($ip!=uip())sql::upd(\'users\',[\'ip\'=>uip()],[\'id\'=>ses(\'uid\')]);', 0, '2023-10-01 16:45:03'),
(189, 'src/php/core', 'login', 'recognize2', '', 'if(ses(\'uid\'))return;\r\n$uid=sql::read(\'id\',\'users\',\'v\',[\'ip\'=>uip()]);\r\nif($uid && !ses(\'uid\'))self::identify($uid);\r\nif(!ses(\'uid\'))ses(\'auth\',0);', 0, '2023-10-01 16:45:03'),
(190, 'src/php/core', 'login', 'recognize', '', '//called from boot\r\nif(ses(\'uid\'))return;\r\n//cookiz(\'uid\');//not works\r\n$uid=cookie(\'uid\'); //pr($_COOKIE); //cookie is rebuilt the second time we come there\r\nif($uid && !ses(\'uid\') && !sesx(\'auth\'))self::identify($uid);\r\nif(!ses(\'uid\'))ses(\'auth\',0);', 1, '2023-10-01 16:45:03'),
(191, 'src/php/core', 'login', 'logout', '', 'sesz(\'usr\');\r\nsesz(\'uid\');\r\nses(\'auth\',0);\r\ncookiz(\'uid\');\r\ncookiz(\'PHPSESSID\');\r\n$ret=alert(\'loged_out\',\'blue\');\r\n$ret.=bh(\'home\',icovoc(\'back\'),\'bigbt\');\r\nreturn $ret;', 1, '2023-10-01 16:45:03'),
(192, 'src/php/core', 'login', 'loged', '', '$ret=alert(\'hello\',\'blue\',ses(\'usr\'));\r\n$ret.=div(bj(\',|login,port_logout\',voc(\'logout\'),\'bigbt\'));\r\nreturn $ret;', 1, '2023-10-01 16:45:03'),
(193, 'src/php/core', 'login', 'call', '$p', '[$a,$b]=vals($p,[\'name\',\'pswd\']);\r\nif(ses(\'uid\'))$ret=self::loged();\r\nelseif($a && $b)$ret=self::response($p);\r\nelse $ret=self::form($p);\r\nreturn $ret;', 1, '2023-10-01 16:45:03'),
(194, 'src/php/core', 'login', 'port_register', '$p', '$r[self::$maintg]=self::register($p);\r\n$r[\'nav\']=nav::call([\'a\'=>\'login\']);\r\nreturn $r;', 0, '2023-10-01 16:45:03'),
(195, 'src/php/core', 'login', 'port_logout', '$p', '$r[self::$maintg]=self::logout();\r\n$r[\'nav\']=nav::call([\'a\'=>\'login\']);\r\nreturn $r;', 0, '2023-10-01 16:45:03'),
(196, 'src/php/core', 'login', 'port', '$p', '$r[self::$maintg]=self::call($p);\r\n$r[\'nav\']=nav::call([\'a\'=>\'login\']);\r\nreturn $r;', 0, '2023-10-01 16:45:03'),
(197, 'src/php/core', 'sql', '__construct', '$r', 'if(!self::$qr){self::$r=$r; self::dbq();}', 0, '2023-10-01 16:45:03'),
(198, 'src/php/core', 'sql', 'dbq', '', '[$h,$n,$p,$b]=self::$r; \r\n$dsn=\'mysql:host=\'.$h.\';dbname=\'.$b.\';charset=utf8\';\r\n$ro=[PDO::ATTR_ERRMODE=>PDO::ERRMODE_EXCEPTION,PDO::ATTR_PERSISTENT=>true,PDO::ATTR_DEFAULT_FETCH_MODE=>PDO::FETCH_ASSOC,PDO::MYSQL_ATTR_INIT_COMMAND=>\'set character set utf8mb4\'];\r\nself::$qr=new PDO($dsn,$n,$p,$ro);', 2, '2023-10-01 16:45:03'),
(199, 'src/php/core', 'sql', 'rq', '', 'if(!self::$qr)self::dbq(); return self::$qr;', 5, '2023-10-01 16:45:03'),
(200, 'src/php/core', 'sql', 'qrr', '$r', 'return $r->fetchAll(PDO::FETCH_BOTH);', 0, '2023-10-01 16:45:03'),
(201, 'src/php/core', 'sql', 'qra', '$r', 'return $r->fetchAll(PDO::FETCH_ASSOC);', 0, '2023-10-01 16:45:03'),
(202, 'src/php/core', 'sql', 'qrw', '$r', 'return $r->fetchAll(PDO::FETCH_NUM);', 0, '2023-10-01 16:45:03'),
(203, 'src/php/core', 'sql', 'qr', '$sql,$z=\'\'', '$qr=self::rq(); if($z)err($sql);\r\ntry{return $qr->query($sql); echo $sql;}catch(Exception $e){err($e->getMessage());}', 14, '2023-10-01 16:45:03'),
(204, 'src/php/core', 'sql', 'format', '$r,$p', '$rt=[];  if($p==\'v\')$rt=\'\';\r\nforeach($r as $k=>$v)switch($p){\r\n	case(\'a\'):$rt=$v; break;//assoc\r\n	case(\'w\'):$rt=$v; break;//num\r\n	case(\'r\'):$rt=$v; break;//both\r\n	case(\'v\'):$rt=$v[0]; break;\r\n	case(\'k\'):$rt[$v[0]]=($rt[$v[0]]??0)+1; break;\r\n	case(\'ra\'):$rt[]=$v; break;//assoc\r\n	case(\'rr\'):$rt[]=$v; break;//both\r\n	case(\'rn\'):$rt[]=$v; break;//num\r\n	case(\'rv\'):$rt[]=$v[0]; break;//r\r\n	case(\'kv\'):$rt[$v[0]]=$v[1]??\'\'; break;\r\n	case(\'kk\'):$rt[$v[0]][$v[1]]=($rt[$v[0]][$v[1]]??0)+1; break;\r\n	case(\'vv\'):$rt[]=[$v[0],$v[1]]; break;\r\n	case(\'kr\'):$rt[$v[0]][]=$v[1]; break;\r\n	case(\'kkv\'):$rt[$v[0]][$v[1]]=$v[2]; break;\r\n	case(\'kkk\'):$rt[$v[0]][$v[1]][$v[2]]+=1; break;\r\n	case(\'kkkv\'):$rt[$v[0]][$v[1]][$v[2]]=$v[3]; break;\r\n	case(\'kvv\'):$rt[$v[0]]=[$v[1],$v[2]]; break;\r\n	case(\'kkr\'):$rt[$v[0]][$v[1]][]=$v[2]; break;\r\n	case(\'krr\'):$rt[$v[0]][]=$v; break;\r\n	case(\'kx\'):$rt[$v[0]]=explode(\'/\',$v[1]); break;\r\n	case(\'index\'):$rt[$v[0]]=$v; break;\r\n	default:$rt[]=$v; break;}\r\nreturn $rt;', 4, '2023-10-01 16:45:03'),
(205, 'src/php/core', 'sql', 'where', '$r', '$rb=[]; $rt=[]; $w=\'\';\r\nif(is_numeric($r))$r=[\'id\'=>$r]; $i=0;\r\nif(is_string($r))return [[],$r];\r\nforeach($r as $k=>$v){$i++;\r\n	$c=substr($k,-1); $kb=substr($k,0,-1); $kc=$kb;//.$i\r\n	if($k==\'_order\')$w=\' order by \'.$v;\r\n	elseif($k==\'_group\')$w.=\' group by \'.$v;\r\n	elseif($k==\'_limit\')$w.=\' limit \'.$v;\r\n	elseif($c==\'<\'){$rb[]=$kb.\'<:\'.$kc; $rt[$kc]=$v;}\r\n	elseif($c==\'>\'){$rb[]=$kb.\'>:\'.$kc; $rt[$kc]=$v;}\r\n	elseif($c==\'!\'){$rb[]=$kb.\'!=:\'.$kc; $rt[$kc]=$v;}\r\n	elseif($c==\'%\'){$rb[]=$kb.\' like :\'.$kc; $rt[$kc]=\'%\'.$v.\'%\';}\r\n	elseif($c==\'-\'){$rb[]=\'substring(\'.$kb.\',1,1)!=:\'.$kc.\'\'; $rt[$kc]=$v;}\r\n	elseif($c==\'&\'){$rb[]=$kb.\' between :\'.$kc.\' and :\'.$kc; $rt[$kc]=$v[0]; $rt[$kc]=$v[1];}\r\n	elseif($c==\'(\'){foreach($v as $ka=>$va)$rta[\'in\'.$ka]=$va; $rt+=$rta;\r\n		$rb[]=$kb.\' in (:\'.implode(\',:\',array_keys($rta)).\')\';}\r\n	elseif($c==\')\'){foreach($v as $ka=>$va)$rta[\'nin\'.$ka]=$va; $rt+=$rta;\r\n		$rb[]=$kb.\' not in (:\'.implode(\',:\',array_keys($rta)).\')\';}\r\n	else{$rb[]=$k.\'=:\'.$k; $rt[$k]=$v;}}\r\n$q=implode(\' and \',$rb); if($q)$q=\'where \'.$q; if($w)$q.=$w;\r\nreturn [$rt,$q];', 4, '2023-10-01 16:45:03'),
(206, 'src/php/core', 'sql', 'sqcl', '$d,$b', 'if($d){$cols=db::cols_s($b);\r\n	if($d==\'all\' && $cols)$d=$cols;\r\n	if($d==\'allid\' && $cols)$d=\'id,\'.$cols;\r\n	if($d==\'full\' && $cols)$d=\'id,\'.$cols.\',up\';}\r\nif(!$d)$d=\'*\';\r\nreturn $d;', 3, '2023-10-01 16:45:03'),
(207, 'src/php/core', 'sql', 'mkv', '$r', '$rt=[]; foreach($r as $k=>$v)$rt[]=\':\'.$k; return implode(\',\',$rt);', 2, '2023-10-01 16:45:03'),
(208, 'src/php/core', 'sql', 'mkvk', '$r', '$rt=[]; foreach($r as $k=>$v)$rt[]=$k.\'=:\'.$k; return implode(\',\',$rt);', 1, '2023-10-01 16:45:03'),
(209, 'src/php/core', 'sql', 'mkvr', '$r', '$rt=[]; foreach($r as $k=>$v)$rt[]=$k.\'=\"\'.$v.\'\"\'; return implode(\',\',$rt);', 0, '2023-10-01 16:45:03'),
(210, 'src/php/core', 'sql', 'mkq', '$r', '[$r,$q]=self::where($r);//oldschool\r\nforeach($r as $k=>$v){$vb=\'\"\'.$v.\'\"\'; if(substr($v,0,9)==\'password(\' or $v==\'null\')$vb=$v;\r\n$q=str_replace(\':\'.$k,$vb,$q);} return $q;', 2, '2023-10-01 16:45:03'),
(211, 'src/php/core', 'sql', 'mkvq', '$r', '$q=[]; foreach($r as $k=>$v)$q[\':\'.$k]=$v; return $q;', 1, '2023-10-01 16:45:03'),
(212, 'src/php/core', 'sql', 'see', '$sql,$r', 'foreach($r as $k=>$v)$sql=str_replace(\':\'.$k,\'\"\'.$v.\'\"\',$sql); return $sql;', 2, '2023-10-01 16:45:03'),
(213, 'src/php/core', 'sql', 'fetch', '$stmt,$p', '$rt=[];\r\nif($p==\'a\' or $p==\'ra\')$rt=$stmt->fetchAll(\\PDO::FETCH_ASSOC);\r\nelseif($p==\'r\' or $p==\'rr\')$rt=$stmt->fetchAll(\\PDO::FETCH_BOTH);\r\nelse $rt=$stmt->fetchAll(PDO::FETCH_NUM);\r\nreturn $rt;', 5, '2023-10-01 16:45:03'),
(214, 'src/php/core', 'sql', 'bind', '$stmt,$r', 'foreach($r as $k=>$v)$stmt->bindValue(\':\'.$k,$v,is_numeric($v)?PDO::PARAM_INT:PDO::PARAM_STR);', 1, '2023-10-01 16:45:03'),
(215, 'src/php/core', 'sql', 'prep', '$sql,$r,$z=\'\'', 'if($z)echo self::see($sql,$r); $qr=self::rq(); $stmt=$qr->prepare($sql); self::bind($stmt,$r);\r\ntry{$ok=$stmt->execute();}catch(Exception $e){err($e->getMessage());}\r\nreturn $stmt;', 5, '2023-10-01 16:45:03'),
(216, 'src/php/core', 'sql', 'read', '$d,$b,$p,$q,$z=\'\'', '[$r,$wh]=self::where($q); $ret=$p==\'v\'?\'\':[];\r\n$sql=\'select \'.self::sqcl($d,$b).\' from \'.$b.\' \'.$wh; self::$sq=$sql;\r\n$stmt=self::prep($sql,$r,$z);\r\n$rt=self::fetch($stmt,$p);\r\nif($p)$ret=self::format($rt,$p);\r\nreturn $ret;', 45, '2023-10-01 16:45:03'),
(217, 'src/php/core', 'sql', 'read2', '$d,$b,$p,$q,$z=\'\'', '$rt=[];\r\n$qr=self::rq(); $q=self::mkq($q); $ret=$p==\'v\'?\'\':[];\r\n$sql=\'select \'.self::sqcl($d,$b).\' from \'.$b.\' \'.$q; self::$sq=$sql;\r\n$stmt=$qr->query($sql);\r\n$rt=self::fetch($stmt,$p);\r\nif($p)$ret=self::format($rt,$p);\r\nreturn $ret;', 0, '2023-10-01 16:45:03'),
(218, 'src/php/core', 'sql', 'alex', '$b,$r', '$ra=db::cols_k($b);\r\n$rb=array_combine($ra,$r);\r\nreturn self::read(\'id\',$b,\'v\',$rb);', 1, '2023-10-01 16:45:03'),
(219, 'src/php/core', 'sql', 'combine', '$b,$r', '$ra=db::cols_k($b);\r\n//$ra=self::cols($b);//will fail cause db src\r\nreturn array_combine($ra,$r);', 1, '2023-10-01 16:45:03'),
(220, 'src/php/core', 'sql', 'integrity', '$b,$r', '$ra=db::cols_r($b);\r\nforeach($ra as $k=>$v)switch($v){\r\n	case(\'int\'):!is_numeric($r[$k])?$r[$k]=0:\'\';}\r\nreturn $r;', 1, '2023-10-01 16:45:03'),
(221, 'src/php/core', 'sql', 'complete', '$r', '$r=[\'id\'=>NULL]+$r+[\'up\'=>sqldate()];\r\n//array_unshift($r,NULL); array_push($r,sqldate());\r\nreturn $r;', 1, '2023-10-01 16:45:03'),
(222, 'src/php/core', 'sql', 'sav', '$b,$q,$z=\'\'', '$ex=self::alex($b,$q); if($ex)return false;\r\n$r=self::combine($b,$q);\r\n$r=self::integrity($b,$r);\r\n$q=self::complete($r);\r\n$sql=\'insert into \'.$b.\' value (\'.self::mkv($q).\')\';\r\n$stmt=self::prep($sql,$q,$z);\r\nreturn self::$qr->lastInsertId();', 10, '2023-10-01 16:45:03'),
(223, 'src/php/core', 'sql', 'sav2', '$b,$q,$z=\'\'', '$sk=self::mkv($q); $sq=self::mkvq($q); //eco($q);\r\n$sql=\'insert into \'.$b.\' value (\'.$sk.\')\';\r\n$stmt=self::prep($sql,$q,$z);\r\nreturn self::$qr->lastInsertId();', 0, '2023-10-01 16:45:03'),
(224, 'src/php/core', 'sql', 'upd', '$b,$r,$q,$z=\'\'', '$vals=self::mkvk($r); [$ra,$wh]=self::where($q);\r\n$sql=\'update \'.$b.\' set \'.$vals.\' \'.$wh;\r\n$stmt=self::prep($sql,$ra+$r,$z);\r\nreturn $stmt?1:0;', 8, '2023-10-01 16:45:03'),
(225, 'src/php/core', 'sql', 'inner', '$d,$b1,$b2,$k2,$p,$q,$z=\'\'', 'if($d==$k2)$d=$b2.\'.\'.$d; [$ra,$wh]=self::where($q); $rt=[]; $ret=$p==\'v\'?\'\':[];\r\n$sql=\'select \'.self::sqcl($d,$b2).\' from \'.$b1.\' b1 inner join \'.$b2.\' b2 on b1.id=b2.\'.$k2.\' \'.$wh;\r\n//$stmt=self::prep($sql,$ra,$z);\r\n$sql=self::see($sql,$ra); $stmt=self::qr($sql,$z); //pr($sql);\r\nif($stmt)$rt=self::fetch($stmt,$p);\r\nif($rt)$ret=self::format($rt,$p);\r\nreturn $ret;', 8, '2023-10-01 16:45:03'),
(226, 'src/php/core', 'sql', 'call', '$sql,$p,$z=\'\'', '$stmt=self::qr($sql,$z);\r\n$rt=self::fetch($stmt,$p);\r\nreturn self::format($rt,$p);', 5, '2023-10-01 16:45:03'),
(227, 'src/php/core', 'sql', 'call2', '$sql,$p', '$qr=self::rq(); $stmt=$qr->query($sql);\r\nreturn self::fetch($stmt,$p);', 0, '2023-10-01 16:45:03'),
(228, 'src/php/core', 'sql', 'com', '$sql', 'return self::rq()->query($sql);', 0, '2023-10-01 16:45:03'),
(229, 'src/php/core', 'sql', 'cols', '$b,$n=\'\'', 'if($n)$b=cnfg(\'db\').\'.\'.$b;\r\n$sql=\'select column_name,data_type from information_schema.columns where table_name=\"\'.$b.\'\"\';\r\nreturn self::call($sql,\'kv\');', 1, '2023-10-01 16:45:03'),
(230, 'src/php/core', 'sql', 'drop', '$b', 'self::qr(\'drop table \'.$b);', 3, '2023-10-01 16:45:03'),
(231, 'src/php/core', 'sql', 'trunc', '$b', 'self::qr(\'truncate table \'.$b);', 2, '2023-10-01 16:45:03'),
(232, 'src/php/core', 'sql', 'setinc', '$b,$n', 'self::qr(\'alter table \'.$b.\' auto_increment=\'.$n);', 0, '2023-10-01 16:45:03'),
(233, 'src/php/core', 'sql', 'unikey', '$b,$d', 'self::qr(\'alter table \'.$b.\' add unique key \'.$d.\' (\'.$d.\')\');', 1, '2023-10-01 16:45:03'),
(234, 'src/php/core', 'sql', 'show', '$b', 'self::call(\'show tables like \"\'.$b.\'\"\',\'rv\',1);', 0, '2023-10-01 16:45:03'),
(235, 'src/php/core', 'sql', 'ex', '$b', '$rq=self::read(\'id\',$b,\'v\',[]); return $rq?1:0;', 2, '2023-10-01 16:45:03'),
(236, 'src/php/core', 'sql', 'backup', '$b,$d=\'\'', '$bb=\'z_\'.$b.\'_\'.$d;\r\nif(self::ex($bb))self::drop($bb);\r\nself::qr(\'create table \'.$bb.\' like \'.$b);\r\n//self::qr(\'alter table \'.$bb.\' add primary key (id)\');\r\nself::qr(\'insert into \'.$bb.\' select * from \'.$b);\r\nreturn $bb;', 1, '2023-10-01 16:45:03'),
(237, 'src/php/core', 'str', 'acc', '$o=1', '$a=[\'À\',\'Á\',\'Â\',\'Ã\',\'Ä\',\'Ç\',\'È\',\'É\',\'Ê\',\'Ë\',\'Ì\',\'Í\',\'Î\',\'Ï\',\'Ñ\',\'Ò\',\'Ó\',\'Ô\',\'Õ\',\'Ö\',\'Ù\',\'Ú\',\'Û\',\'Ü\',\'Ý\'];\r\n$am=[\'à\',\'á\',\'â\',\'ã\',\'ä\',\'å\',\'ç\',\'è\',\'é\',\'ê\',\'ë\',\'ì\',\'í\',\'î\',\'ï\',\'ð\',\'ò\',\'ó\',\'ô\',\'õ\',\'ö\',\'ù\',\'ú\',\'û\',\'ü\',\'ý\',\'ÿ\'];\r\n$b=[\'à\',\'á\',\'â\',\'ã\',\'ä\',\'ç\',\'è\',\'é\',\'ê\',\'ë\',\'ì\',\'í\',\'î\',\'ï\',\'ñ\',\'ò\',\'ó\',\'ô\',\'õ\',\'ö\',\'ù\',\'ú\',\'û\',\'ü\',\'ý\'];\r\n$bm=[\'a\',\'a\',\'a\',\'a\',\'a\',\'a\',\'c\',\'e\',\'e\',\'e\',\'e\',\'i\',\'i\',\'i\',\'i\',\'o\',\'o\',\'o\',\'o\',\'o\',\'o\',\'u\',\'u\',\'u\',\'u\',\'y\',\'y\'];\r\nif($o){$a+=$am; $b+=$bm;}\r\nreturn [$a,$b];', 2, '2023-10-01 16:45:03'),
(238, 'src/php/core', 'str', 'eradic_acc', '$d', '[$a,$b]=self::acc(1);\r\nreturn str_replace($a,$b,$d);', 1, '2023-10-01 16:45:03'),
(239, 'src/php/core', 'str', 'normalize_alpha', '$d,$o=\'\'', 'if(!$d)return;\r\n$r=[\' \',\'-\',\'&nbsp;\',\"\'\",\'\"\',\'/\',\',\',\';\',\':\',\'|\',\'§\',\'%\',\'&\',\'$\',\'#\',\'_\',\'+\',\'=\',\'!\',\'?\',\'\\n\',\'\\r\',\'\\\\\',\'~\',\'(\',\')\',\'[\',\']\',\'{\',\'}\',\'«\',\'»\']; if($o)unset($r[$o]); return str_replace($r,\'\',$d);', 1, '2023-10-01 16:45:03'),
(240, 'src/php/core', 'str', 'normalize_ext', '$d', 'if(!$d)return;\r\nreturn str_replace([\'.JPG\',\'.JPEG\',\'.jpeg\',\'.GIF\',\'.PNG\'],[\'.jpg\',\'.jpg\',\'.jpg\',\'.gif\',\'.png\'],$d);', 1, '2023-10-01 16:45:03'),
(241, 'src/php/core', 'str', 'normalize', '$d,$o=\'\'', 'if(!$d)return;\r\n$d=self::normalize_alpha($d,$o); $d=self::normalize_ext($d); $d=self::eradic_acc($d); return $d;', 1, '2023-10-01 16:45:03'),
(242, 'src/php/core', 'str', 'numentities', '$d', '$d=html_entity_decode(stripslashes($d),ENT_QUOTES,\'UTF-8\');\r\n$r=preg_split(\'/(!^)(?!$)/u\',$d); $ret=\'\';\r\nforeach($r as $c){$o=ord($c);\r\nif((strlen($c)>1) || ($o <32 || $o > 126) || ($o >33 && $o < 40) || ($o >59 && $o < 63))\r\n$c=mb_encode_numericentity($c,[0x0,0xffff,0,0xffff],\'UTF-8\');\r\n$ret.=$c;}\r\nreturn $ret;', 0, '2023-10-01 16:45:03'),
(243, 'src/php/core', 'str', 'clean_acc', '$d', 'if(!$d)return;\r\n$a=[\'»»\',\"’\",\"‘\",\'“\',\'”\',\"…\",\"–\",\"\\t\"];//,\'«\',\'»\'//no detructive because of odd number\r\n$b=[\'⇒\',\"\'\",\"\'\",\'\"\',\'\"\',\"...\",\"-\",\'\'];//,\'\"\',\'\"\'\r\nif(substr_count($d,\'«\')==substr_count($d,\'»\')){$a+=[\'«\',\'»\']; $b+=[\'\"\',\'\"\'];}\r\nforeach($a as $k=>$v)$d=str_replace([htmlentities($v),$v],$b[$k],$d);\r\nreturn $d;', 2, '2023-10-01 16:45:03'),
(244, 'src/php/core', 'str', 'clean_punctuation', '$d,$o=\'\'', 'if(!$d)return;\r\nif($o)$d=self::clean_acc($d);//avoid utf error\r\n$n=mb_substr_count($d,\'\"\'); $no=$n%2;\r\n$r=mb_str_split($d); $n=count($r); $ia=2;\r\nfor($i=0;$i<$n;$i++){\r\nif(($r[$i]??\'\')==\'\"\'){$ia=$ia==2?1:2;\r\nif($ia==1 && !$no && ($r[$i+1]??\'\')==\' \')unset($r[$i+1]);\r\nif($ia==2 && !$no && ($r[$i-1]??\'\')==\' \')unset($r[$i-1]);}\r\nif(($r[$i]??\'\')==\'(\' && ($r[$i+1]??\'\')==\' \')unset($r[$i+1]);\r\nif(($r[$i]??\'\')==\')\' && ($r[$i-1]??\'\')==\' \')unset($r[$i-1]);\r\nif(($r[$i]??\'\')==\",\" && ($r[$i-1]??\'\')==\' \')unset($r[$i-1]);}\r\nif($r)$d=implode(\'\',$r); if($o==2)$d=self::nicequotes($d,1);\r\nreturn $d;', 1, '2023-10-01 16:45:03'),
(245, 'src/php/core', 'str', 'nicequotes', '$d,$o=\'\'', 'if(!$d)return;\r\nif($o)$d=self::clean_acc(delnbsp($d)); $nb=sp();\r\n$n=mb_substr_count($d,\'\"\'); $no=$n%2;\r\n//$n=mb_substr_count($d,\'\"\'); if($n%2)return $d;\r\n$r=mb_str_split($d); $n=1; $rp=[\'&laquo;\'.$nb,$nb.\'&raquo;\'];\r\nif(!$no)foreach($r as $k=>$v)if($v==\'\"\'){$n=$n==1?0:1; $r[$k]=$rp[$n];}\r\nif($r)$d=implode(\'\',$r); if($o)$d=self::add_nbsp($d);\r\nreturn $d;', 1, '2023-10-01 16:45:03'),
(246, 'src/php/core', 'str', 'add_nbsp', '$d', 'if(!$d)return;\r\n$a=[\'( \',\' )\',\' ,\',\' .\',\' ;\',\' :\',\' !\',\' ?\',\'« \',\' »\',\'&laquo; \',\' &raquo;\',\'0 0\',\'<<\',\'>>\'];\r\n$b=[\'(\',\')\',\',\',\'.\',\"&nbsp;;\",\"&nbsp;:\",\"&nbsp;!\",\"&nbsp;?\",\"«&nbsp;\",\"&nbsp;»\",\"«&nbsp;\",\"&nbsp;»\",\'0&nbsp;0\',\'\"\',\'\"\'];\r\nreturn str_replace($a,$b,$d);', 1, '2023-10-01 16:45:03'),
(247, 'src/php/core', 'str', 'mb_ucfirst', '$d,$e=\'utf-8\'', '//unused\r\nreturn mb_strtoupper(mb_substr($d,0,1,$e),$e).mb_strtolower(mb_substr($d,1,mb_strlen($d,$e),$e));', 0, '2023-10-01 16:45:03'),
(248, 'src/php/core', 'str', 'mb_uclet', '$d,$e=\'utf-8\'', '//unused\r\nreturn mb_substr($d,0,1,$e).mb_strtolower(mb_substr($d,1,mb_strlen($d,$e),$e));', 0, '2023-10-01 16:45:03'),
(249, 'src/php/core', 'str', 'lowcase', '$d', '[$a,$b]=self::acc();\r\nreturn str_replace($a,$b,$d);', 0, '2023-10-01 16:45:03'),
(250, 'src/php/core', 'str', 'letcase', '$d', '$n=mb_strlen($d); $ret=\'\'; $y=1; $o=0;\r\nfor($i=0;$i<$n;$i++){$c=mb_substr($d,$i,1);\r\nif(!$y)$c=mb_strtolower($c); $ret.=$c;//if($i>0)$o=1; \r\nif($c==\' \' or $c==\" \" or $c==\"\'\" or $c==\'\"\' or $c==\'«\' or $c==\"&laquo;\" or $c==\'-\' or $c==\'[\' or $c==\'(\')$y=1; else $y=0;}// or $c==\"&nbsp;\"\r\nreturn $ret;', 1, '2023-10-01 16:45:03'),
(251, 'src/php/core', 'str', 'lowercase', '$d', 'if(!$d)return;\r\n//$d=hed($d); eco($d);\r\n$r=explode(\' \',$d); $rt=[];\r\nforeach($r as $k=>$v)$rt[]=self::letcase($v);\r\nreturn join(\' \',$rt);', 0, '2023-10-01 16:45:03'),
(252, 'src/php/core', 'str', 'clean_lines', '$d,$o=\'\'', 'if(!$d)return \'\';\r\nif($o)$d=self::clean_whitespaces($d);\r\n$r=explode(\"\\n\",$d);\r\nforeach($r as $k=>$v)$rb[]=self::trim($v);\r\nreturn implode(\"\\n\",$rb);', 3, '2023-10-01 16:45:03'),
(253, 'src/php/core', 'str', 'delspc', '$d', 'if($d)//erase \\n\r\n$d=preg_replace(\'/\\s+/\',\' \',$d);\r\nreturn delsp($d);', 0, '2023-10-01 16:45:03'),
(254, 'src/php/core', 'str', 'clean_whitespaces', '$d', 'if(!$d)return;\r\n$r=[\' \',\"&nbsp;\",\"&#160;\",\"&#xA0;\",\"&thinsp;\",\"&#8201;\",\"&ensp;\",\"&#8194\",\"&emsp;\",\"&#8195;\",\"&#8192;\",\"&#8193;\",\"&#8200;\",\"&#8239;\",\"\\t\"];//&#3647;//bitcoin\r\nforeach($r as $k=>$v)$d=str_replace([hed($v),$v],\' \',$d);\r\nreturn $d;', 2, '2023-10-01 16:45:03'),
(255, 'src/php/core', 'str', 'trim', '$d,$o=\'\'', 'if($o)$d=self::clean_whitespaces($d);\r\nreturn trim($d,\'  \');', 1, '2023-10-01 16:45:03'),
(256, 'src/php/core', 'str', 'clean_mail', '$d', '$d=delr($d);\r\n$d=delbr($d,\"\\n\");\r\n$d=delsp($d);\r\n$d=str_replace(\"M.\\n\",\'M. \',$d);\r\n$d=str_replace(\".\\n\",\'.µµ\',$d);\r\n$d=str_replace(\"\\n\",\'µ\',$d);\r\n$d=str_replace(\'µµ\',\"\\n\\n\",$d);\r\n$d=str_replace(\'µ\',\' \',$d);\r\n$d=self::clean_lines($d);\r\n$d=delsp($d);\r\nreturn $d;', 0, '2023-10-01 16:45:03'),
(257, 'src/php/core', 'str', 'clean_n', '$d', '$d=str_replace(\"\\r\\n\",\"\\n\",$d);\r\n$d=str_replace(\"\\r\",\"\\n\",$d);\r\n$d=str_replace(\'<br>\'.\"\\n\",\"\\n\",$d);\r\n$d=delsp($d);\r\n$d=delnl($d);\r\nreturn trim($d);', 1, '2023-10-01 16:45:03'),
(258, 'src/php/core', 'str', 'clean_br', '$d', '$d=delbr($d,\' \');\r\n$d=self::clean_lines($d);\r\n$d=deln($d,\' \');\r\n$d=delsp($d,\' \');\r\n$d=delsp($d);\r\nreturn trim($d);', 0, '2023-10-01 16:45:03'),
(259, 'src/php/core', 'view', 'file', '$a', 'return self::$path.$a.\'.html\';', 1, '2023-10-01 16:45:03'),
(260, 'src/php/core', 'view', 'vars', '$r', 'static $rv=[];\r\nforeach($r as $k=>$v)\r\n	if(is_array($v[2]))self::vars($v[2]);\r\n	elseif(substr($v[2],0,1)==\'{\'){//todo: multiples vars\r\n		$rv[]=substr($v[2],1,-1);}\r\nreturn $rv;}\r\n\r\nstatic function trigger($a){\r\n$f=self::file($a); $fb=json::file(self::$json_views.$a);\r\n$d1=ftime($f); $d2=ftime($fb);\r\nif($d2>$d1){return $f; err(\'saved: \'.$f);}}\r\n\r\nstatic function save($a,$d){\r\nif($f=self::trigger($a))putfile($f,$d);}\r\n\r\nstatic function save_html($a){\r\n$r=json::call(self::$json_views.$a); $d=\'\';\r\nif($r)$d=self::build($r,[],[]);\r\nself::save($a,$d);}\r\n\r\nstatic function build($r,$ra,$rc){$ret=\'\';\r\nforeach($r as $k=>$v){[$c,$p,$d]=$v;\r\n	if(is_array($d))$d=self::build($d,$ra,$rc);\r\n	else $d=str_replace($rc,$ra,$d);\r\n	if($p)foreach($p as $ka=>$va)\r\n		$p[$ka]=str_replace($rc,$ra,$va);\r\n	$ret.=tag($c,$p,$d).\"\\n\";}\r\nreturn $ret;}\r\n\r\nstatic function com($r,$ra){$rc=[]; $ret=\'\';\r\nif($ra)foreach($ra as $k=>$v)$rc[$k]=\'{\'.$k.\'}\';\r\nif($r)$ret=self::build($r,$ra,$rc);\r\nreturn $ret;}\r\n\r\nstatic function call($a,$ra){\r\n$r=json::call(self::$json_views.$a); $ret=\'\';\r\nif($r)$ret=self::com($r,$ra);\r\nif(ses::cnfg(\'savehtml\'))self::save_html($a);\r\nreturn $ret;}', 2, '2023-10-01 16:45:03'),
(261, 'src/php/core', 'view', 'trigger', '$a', '$f=self::file($a); $fb=json::file(self::$json_views.$a);\r\n$d1=ftime($f); $d2=ftime($fb);\r\nif($d2>$d1){return $f; err(\'saved: \'.$f);}', 1, '2023-10-01 16:45:03'),
(262, 'src/php/core', 'view', 'save', '$a,$d', 'if($f=self::trigger($a))putfile($f,$d);', 1, '2023-10-01 16:45:03'),
(263, 'src/php/core', 'view', 'save_html', '$a', '$r=json::call(self::$json_views.$a); $d=\'\';\r\nif($r)$d=self::build($r,[],[]);\r\nself::save($a,$d);', 2, '2023-10-01 16:45:04'),
(264, 'src/php/core', 'view', 'build', '$r,$ra,$rc', '$ret=\'\';\r\nforeach($r as $k=>$v){[$c,$p,$d]=$v;\r\n	if(is_array($d))$d=self::build($d,$ra,$rc);\r\n	else $d=str_replace($rc,$ra,$d);\r\n	if($p)foreach($p as $ka=>$va)\r\n		$p[$ka]=str_replace($rc,$ra,$va);\r\n	$ret.=tag($c,$p,$d).\"\\n\";}\r\nreturn $ret;', 3, '2023-10-01 16:45:04'),
(265, 'src/php/core', 'view', 'com', '$r,$ra', '$rc=[]; $ret=\'\';\r\nif($ra)foreach($ra as $k=>$v)$rc[$k]=\'{\'.$k.\'}\';\r\nif($r)$ret=self::build($r,$ra,$rc);\r\nreturn $ret;', 2, '2023-10-01 16:45:04'),
(266, 'src/php/core', 'view', 'call', '$a,$ra', '$r=json::call(self::$json_views.$a); $ret=\'\';\r\nif($r)$ret=self::com($r,$ra);\r\nif(ses::cnfg(\'savehtml\'))self::save_html($a);\r\nreturn $ret;', 10, '2023-10-01 16:45:04'),
(267, 'src/php', 'lib', 'n', '', 'return \"\\n\";', 0, '2023-10-01 16:45:04'),
(268, 'src/php', 'lib', 'br', '', 'return \"<br />\";', 0, '2023-10-01 16:45:04'),
(269, 'src/php', 'lib', 'hr', '', 'return \"<hr />\";', 0, '2023-10-01 16:45:04'),
(270, 'src/php', 'lib', 'sp', '', 'return \"&nbsp;\";', 0, '2023-10-01 16:45:04'),
(271, 'src/php', 'lib', 'st', '', 'return \"&#8239\";', 0, '2023-10-01 16:45:04'),
(272, 'src/php', 'lib', 'thin', '', 'return \"&thinsp;\";', 0, '2023-10-01 16:45:04'),
(273, 'src/php', 'lib', 'atr', '$r', '$ret=\'\'; if($r)foreach($r as $k=>$v)if($v||$v==0)$ret.=\' \'.$k.\'=\"\'.$v.\'\"\'; return $ret;', 0, '2023-10-01 16:45:04'),
(274, 'src/php', 'lib', 'tag', '$b,$p,$d', 'return \'<\'.$b.atr($p).\'>\'.$d.\'</\'.$b.\'>\';', 0, '2023-10-01 16:45:04'),
(275, 'src/php', 'lib', 'taga', '$b,$p', 'return \'<\'.$b.atr($p).\' />\';', 0, '2023-10-01 16:45:04'),
(276, 'src/php', 'lib', 'tagb', '$b,$d', 'return \'<\'.$b.\'>\'.$d.\'</\'.$b.\'>\';', 0, '2023-10-01 16:45:04'),
(277, 'src/php', 'lib', 'tagc', '$b,$c,$d', 'return \'<\'.$b.atr([\'class\'=>$c]).\'>\'.$d.\'</\'.$b.\'>\';', 0, '2023-10-01 16:45:04'),
(278, 'src/php', 'lib', 'lk', '$u,$v=\'\',$c=\'\',$p=[]', 'return tag(\'a\',[\'href\'=>$u,\'class\'=>$c]+$p,$v?$v:domain($v));', 0, '2023-10-01 16:45:04'),
(279, 'src/php', 'lib', 'img', '$d,$s=\'\',$o=\'\'', 'return taga(\'img\',[\'src\'=>$d,\'width\'=>$s,\'alt\'=>$o]);', 0, '2023-10-01 16:45:04'),
(280, 'src/php', 'lib', 'div', '$v,$c=\'\',$d=\'\',$s=\'\'', 'return tag(\'div\',[\'class\'=>$c,\'id\'=>$d,\'style\'=>$s],$v);', 0, '2023-10-01 16:45:04'),
(281, 'src/php', 'lib', 'span', '$v,$c=\'\',$d=\'\',$s=\'\'', 'return tag(\'span\',[\'class\'=>$c,\'id\'=>$d,\'style\'=>$s],$v);', 0, '2023-10-01 16:45:04'),
(282, 'src/php', 'lib', 'block', '$v', 'return tagb(\'blockquote\',$v);', 0, '2023-10-01 16:45:04'),
(283, 'src/php', 'lib', 'h1', '$v', 'return tagb(\'h1\',$v);', 0, '2023-10-01 16:45:04');
INSERT INTO `_prog` (`id`, `dir`, `page`, `func`, `vars`, `code`, `uses`, `up`) VALUES
(284, 'src/php', 'lib', 'h2', '$v', 'return tagb(\'h2\',$v);', 0, '2023-10-01 16:45:04'),
(285, 'src/php', 'lib', 'h3', '$v', 'return tagb(\'h3\',$v);', 0, '2023-10-01 16:45:04'),
(286, 'src/php', 'lib', 'h4', '$v', 'return tagb(\'h4\',$v);', 0, '2023-10-01 16:45:04'),
(287, 'src/php', 'lib', 'li', '$v', 'return tagb(\'li\',$v);', 0, '2023-10-01 16:45:04'),
(288, 'src/php', 'lib', 'atj', '$d,$j', 'return $d.\'(\'.implode_j($j).\');\';', 0, '2023-10-01 16:45:04'),
(289, 'src/php', 'lib', 'bt', '$j,$pj,$v,$c=\'\',$p=[]', 'return tag(\'button\',[\'onclick\'=>atj($j,$pj),\'class\'=>$c]+$p,$v);', 0, '2023-10-01 16:45:04'),
(290, 'src/php', 'lib', 'btj', '$j,$pj,$v,$c=\'\',$p=[]', 'return tag(\'a\',[\'onclick\'=>atj($j,$pj),\'class\'=>$c]+$p,$v);', 0, '2023-10-01 16:45:04'),
(291, 'src/php', 'lib', 'bj', '$j,$v,$c=\'\',$p=[]', 'if(cnfg(\'db\'))$p+=[\'title\'=>$j];\r\nreturn tag(\'a\',[\'onclick\'=>\'bj(this)\',\'data-bj\'=>$j,\'class\'=>$c]+$p,$v);', 0, '2023-10-01 16:45:04'),
(292, 'src/php', 'lib', 'bg', '$j,$v,$c=\'\',$p=[]', 'if(cnfg(\'db\'))$p+=[\'title\'=>$j];\r\nreturn tag(\'a\',[\'onclick\'=>\'bg(this)\',\'data-bj\'=>$j,\'class\'=>$c]+$p,$v);', 0, '2023-10-01 16:45:04'),
(293, 'src/php', 'lib', 'bh', '$h,$v,$c=\'\',$p=[]', 'return tag(\'a\',[\'href\'=>\'/\'.$h,\'onclick\'=>\'return bh(this)\',\'class\'=>$c]+$p,$v);', 0, '2023-10-01 16:45:04'),
(294, 'src/php', 'lib', 'bjr', '$t,$j,$p,$v,$c', 'return bj($t.\'|\'.$j.\'|\'.prm($p),$v,$c);', 0, '2023-10-01 16:45:04'),
(295, 'src/php', 'lib', 'togjs', '$t,$d', '$rid=rid(); return span(btj(\'togjs\',$rid,$t,\'btn\').span($d,\'hidden\',$rid));', 0, '2023-10-01 16:45:04'),
(296, 'src/php', 'lib', 'togj', '$t,$com', '$rid=rid(); return btj(\'bjtog\',[$rid,$com],$t,\'btn\').span(\'\',\'\',$rid);', 0, '2023-10-01 16:45:04'),
(297, 'src/php', 'lib', 'input', '$d,$v,$s=\'\',$p=[]', 'if($p[\'type\']??\'\'){$vy=$p[\'type\']; unset($p[\'type\']);} else $vy=\'text\';\r\nreturn \'<input\'.atr([\'type\'=>$vy,\'id\'=>$d,\'value\'=>$v,\'size\'=>$s]+$p).\' />\';', 0, '2023-10-01 16:45:04'),
(298, 'src/php', 'lib', 'hidden', '$d,$v', 'return taga(\'input\',[\'type\'=>\'hidden\',\'id\'=>$d,\'value\'=>$v]);', 0, '2023-10-01 16:45:04'),
(299, 'src/php', 'lib', 'label', '$id,$t,$c=\'\',$idb=\'\'', 'return tag(\'label\',[\'for\'=>$id,\'class\'=>$c,\'id\'=>$idb],$t);', 0, '2023-10-01 16:45:04'),
(300, 'src/php', 'lib', 'inputj', '$id,$v=\'\',$ida=\'\',$p=[]', 'return input($id,$v,16,[\'onkeypress\'=>atj(\'checkj\',$ida)]+$p);', 0, '2023-10-01 16:45:04'),
(301, 'src/php', 'lib', 'inpsw', '$d,$v,$s=\'\',$p=[]', 'return input($d,$v,$s,[\'type\'=>\'password\',\'maxlength\'=>\'100\',\'placeholder\'=>\'password\']+$p);', 0, '2023-10-01 16:45:04'),
(302, 'src/php', 'lib', 'inpnb', '$id,$v,$min=\'\',$max=\'\',$st=1', 'return input($id,$v,\'\',[\'type\'=>\'number\',\'name\'=>$id,\'min\'=>$min,\'max\'=>$max,\'step\'=>$st]);', 0, '2023-10-01 16:45:04'),
(303, 'src/php', 'lib', 'inpmail', '$id,$v=\'\',$p=[]', 'return input($id,$v,16,[\'type\'=>\'mail\',\'maxlength\'=>\'100\']+$p);', 0, '2023-10-01 16:45:04'),
(304, 'src/php', 'lib', 'inpdate', '$id,$v,$o=\'\',$min=\'\',$max=\'\'', 'return input($id,$v,\'\',[\'type\'=>$o?\'datetime-local\':\'date\',\'min\'=>$min,\'max\'=>$max]);', 0, '2023-10-01 16:45:04'),
(305, 'src/php', 'lib', 'inpclr', '$id,$v=\'\'', 'return input($id,$v,\'\',[\'type\'=>\'color\',\'name\'=>$id]);', 0, '2023-10-01 16:45:04'),
(306, 'src/php', 'lib', 'inptel', '$id,$v,$pl=\'06-01-02-03\'', 'return input($id,$v,[\'type\'=>\'tel\',\'name\'=>$id,\'placeholder\'=>$pl,\'pattern\'=>\"[0-9]{2}-[0-9]{2}-[0-9]{2}-[0-9]{2}\",\'required\'=>\'required\']);', 0, '2023-10-01 16:45:04'),
(307, 'src/php', 'lib', 'inprange', '$id,$v,$st=1,$min=\'\',$max=\'\'', 'return input($id,$v,\'\',[\'type\'=>\'range\',\'name\'=>$id,\'min\'=>$min,\'max\'=>$max,\'step\'=>$st]);', 0, '2023-10-01 16:45:04'),
(308, 'src/php', 'lib', 'bar', '$id,$v=50,$st=10,$min=0,$max=100,$js=\'\',$s=\'240px\'', '$js.=atj(\'val2html\',[$id,\'lbl\'.$id]);\r\n$pr=[\'type\'=>\'range\',\'name\'=>$id,\'min\'=>$min,\'max\'=>$max,\'step\'=>$st,\'onchange\'=>$js,\'style\'=>\'width:\'.$s.\'; height:5px;\',\'title\'=>\'use mousewheel\'];\r\nreturn input($id,$v,\'\',$pr).label($id,$v,\'\',\'lbl\'.$id);', 0, '2023-10-01 16:45:04'),
(309, 'src/php', 'lib', 'progress', '$v=\'\',$max=100,$w=240,$t=\'\'', 'return tag(\'progress\',[\'value\'=>$v,\'max\'=>$max,\'style\'=>\'width:\'.$w.\'px\'],$t);', 0, '2023-10-01 16:45:04'),
(310, 'src/php', 'lib', 'checkbox', '$id,$v,$t,$ck=\'\'', '$pr=[\'type\'=>\'checkbox\',\'checked\'=>$ck?\'checked\':\'\'];\r\nreturn input($id,$v,\'\',$pr).($t?label($id,$t).\' \':\'\');', 0, '2023-10-01 16:45:04'),
(311, 'src/php', 'lib', 'radio', '$id,$r,$h', '$rt=[];\r\nif($r)foreach($r as $k=>$v){$ck=$v==$h?\'checked\':\'\';\r\n$rt[]=taga(\'input\',[\'type\'=>\'radio\',\'id\'=>$id,\'value\'=>$v,\'checked\'=>$ck]).label($id,$v);}\r\nreturn implode(\' \',$rt);', 0, '2023-10-01 16:45:04'),
(312, 'src/php', 'lib', 'textarea', '$id,$v,$w=\'40\',$h=\'4\',$p=[]', 'return tag(\'textarea\',[\'id\'=>$id,\'cols\'=>$w,\'rows\'=>$h]+$p,$v);', 0, '2023-10-01 16:45:04'),
(313, 'src/php', 'lib', 'divarea', '$id,$d,$c=\'\',$s=\'\',$p=[]', 'return tag(\'div\',[\'contenteditable\'=>\'true\',\'id\'=>$id,\'class\'=>$c,\'style\'=>$s]+$p,$d);', 0, '2023-10-01 16:45:04'),
(314, 'src/php', 'lib', 'select', '$id,$r,$ck=\'\',$o=\'\',$js=\'\'', '$ret=\'\';\r\n$ra=[\'id\'=>$id,\'name\'=>$id]; if($js)$ra[\'onchange\']=$js;\r\nif($r)foreach($r as $k=>$v){$rb=[];\r\n    if($o)$k=is_numeric($k)?$v:$k;\r\n    if($k==$ck)$rb[\'selected\']=\'selected\'; $rb[\'value\']=$k;\r\n    $ret.=tag(\'option\',$rb,$v?$v:$k);}\r\n    return tag(\'select\',$ra,$ret);', 0, '2023-10-01 16:45:04'),
(315, 'src/php', 'lib', 'datalist', '$id,$r,$v,$s=34,$t=\'\'', '$ret=\'\'; $opt=\'\';\r\n$ret=tag(\'input\',[\'id\'=>$id,\'name\'=>$id,\'list\'=>\'dt\'.$id,\'size\'=>$s,\'value\'=>$v,\'placeholder\'=>$t],\'\',1);\r\nforeach($r as $v)$opt.=tagb(\'option\',[\'value\'=>$v]);\r\n$ret.=tag(\'datalist\',[\'id\'=>\'dt\'.$id],$opt);\r\nreturn $ret;', 0, '2023-10-01 16:45:04'),
(316, 'src/php', 'lib', 'submit', '$id,$v,$c=\'\'', 'return input($id,$v,\'\',[\'type\'=>\'submit\',\'class\'=>$c]);', 0, '2023-10-01 16:45:04'),
(317, 'src/php', 'lib', 'form', '$id,$d,$c=\'\',$p=[]', 'return tag(\'form\',[\'id\'=>$id,\'class\'=>$c]+$p,$d);', 0, '2023-10-01 16:45:04'),
(318, 'src/php', 'lib', 'delbr', '$d,$o=\'\'', 'return str_replace([\'<br />\',\'<br/>\',\'<br>\'],$o,$d??\'\');', 0, '2023-10-01 16:45:04'),
(319, 'src/php', 'lib', 'deln', '$d,$o=\'\'', 'return str_replace(\"\\n\",$o,$d??\'\');', 0, '2023-10-01 16:45:04'),
(320, 'src/php', 'lib', 'delr', '$d,$o=\'\'', 'return str_replace(\"\\r\",$o,$d??\'\');', 0, '2023-10-01 16:45:04'),
(321, 'src/php', 'lib', 'delt', '$d,$o=\'\'', 'return str_replace(\"\\t\",$o,$d??\'\');', 0, '2023-10-01 16:45:04'),
(322, 'src/php', 'lib', 'delnl', '$d', 'return preg_replace(\'/(\\n){2,}/\',\"\\n\\n\",$d??\'\');', 0, '2023-10-01 16:45:04'),
(323, 'src/php', 'lib', 'delsp', '$d', 'return preg_replace(\'/( ){2,}/\',\' \',$d??\'\');', 0, '2023-10-01 16:45:04'),
(324, 'src/php', 'lib', 'delnbsp', '$d', 'return str_replace(\"&nbsp;\",\' \',$d??\'\');', 0, '2023-10-01 16:45:04'),
(325, 'src/php', 'lib', 'nbsp', '$d', 'return str_replace(\' \',\"&nbsp;\",$d??\'\');', 0, '2023-10-01 16:45:04'),
(326, 'src/php', 'lib', 'delr_r', '$r', 'foreach($r as $k=>$v)$r[$k]=delr($v); return $r;', 0, '2023-10-01 16:45:04'),
(327, 'src/php', 'lib', 'hed', '$d', 'if($d)return html_entity_decode($d);', 0, '2023-10-01 16:45:04'),
(328, 'src/php', 'lib', 'gets', '', '$r=$_GET; foreach($r as $k=>$v)ses::$r[\'get\'][$k]=urldecode($v); return ses::$r[\'get\']??[];', 0, '2023-10-01 16:45:04'),
(329, 'src/php', 'lib', 'posts', '', '$r=$_POST??[]; foreach($r as $k=>$v)ses::$r[\'post\'][$k]=delr($v); return ses::$r[\'post\']??[];', 0, '2023-10-01 16:45:04'),
(330, 'src/php', 'lib', 'get', '$k,$v=\'\'', 'return ses::$r[\'get\'][$k]??ses::$r[\'get\'][$k]=$v;', 0, '2023-10-01 16:45:04'),
(331, 'src/php', 'lib', 'post', '$k', 'return ses::$r[\'post\'][$k]??\'\';', 0, '2023-10-01 16:45:04'),
(332, 'src/php', 'lib', 'get2', '$k', 'return filter_input(INPUT_GET,$k);', 0, '2023-10-01 16:45:04'),
(333, 'src/php', 'lib', 'post2', '$k', 'return filter_input(INPUT_POST,$k);', 0, '2023-10-01 16:45:04'),
(334, 'src/php', 'lib', 'cookie', '$d,$v=null', 'if(isset($v))setcookie($d,$v,time()+(86400*30)); return $_COOKIE[$d]??\'\';', 0, '2023-10-01 16:45:04'),
(335, 'src/php', 'lib', 'cookiz', '$d', 'unset($_COOKIE[$d]); setcookie($d,\'\',time()-3600);', 0, '2023-10-01 16:45:04'),
(336, 'src/php', 'lib', 'ses', '$d,$v=null', 'if(isset($v))$_SESSION[$d]=$v; return $_SESSION[$d]??\'\';', 0, '2023-10-01 16:45:04'),
(337, 'src/php', 'lib', 'sesz', '$d', 'if(isset($_SESSION[$d]))unset($_SESSION[$d]);', 0, '2023-10-01 16:45:04'),
(338, 'src/php', 'lib', 'sesx', '$d', 'return isset($_SESSION[$d])?1:0;', 0, '2023-10-01 16:45:04'),
(339, 'src/php', 'lib', 'sesmk', '$v,$p=\'\',$b=\'\'', '$rid=rid($v.$p);\r\nif(!isset($_SESSION[$rid]) or $b or ses(\'dev\'))$_SESSION[$rid]=$v($p);\r\nreturn $_SESSION[$rid]??[];', 0, '2023-10-01 16:45:04'),
(340, 'src/php', 'lib', 'scandir_b', '$d', '$r=scandir($d); unset($r[0]); unset($r[1]); return $r;', 0, '2023-10-01 16:45:04'),
(341, 'src/php', 'lib', 'scandir_r', '$d,$r=[]', '$dr=opendir($d);\r\nwhile($f=readdir($dr))if($f!=\'..\' && $f!=\'.\' && $f!=\'_notes\'){$df=$d.\'/\'.$f;\r\n	if(is_dir($df)){$r[]=$df; $r+=scandir_r($df,$r);}}\r\nreturn $r;', 0, '2023-10-01 16:45:04'),
(342, 'src/php', 'lib', 'scanfiles', '$d,$r=[]', '$dr=opendir($d);\r\nwhile($f=readdir($dr))if($f!=\'..\' && $f!=\'.\' && $f!=\'_notes\'){$df=$d.\'/\'.$f;\r\n	if(is_dir($df))$r=scanfiles($df,$r); else $r[]=$df;}\r\nreturn $r;', 0, '2023-10-01 16:45:04'),
(343, 'src/php', 'lib', 'mkdir_r', '$u', '$nu=explode(\'/\',$u); if(count($nu)>10)return;\r\nif(strpos($u,\'Warning\')!==false)return; $f=\'\';\r\nforeach($nu as $k=>$v){$f.=$v.\'/\'; if(strpos($v,\'.\'))$v=\'\';\r\nif(!is_dir($f) && $v){if(!mkdir($f))echo $f.\':not_created \';}}', 0, '2023-10-01 16:45:04'),
(344, 'src/php', 'lib', 'rmdir_r', '$dr', '$dir=opendir($dr); if(!auth(6))return;\r\nwhile($f=readdir($dir)){$drb=$dr.\'/\'.$f;\r\nif(is_dir($drb) && $f!=\'..\' && $f!=\'.\'){rmdir_r($drb); if(is_dir($drb))rmdir($drb);}\r\nelseif(is_file($drb)){unlink($drb); $drb.br();}} if(is_dir($dr))rmdir($dr);', 0, '2023-10-01 16:45:04'),
(345, 'src/php', 'lib', 'curl_get_contents', '$f,$post=[],$json=0', '$c=curl_init(); curl_setopt($c,CURLOPT_URL,$f); $er=\'\';\r\ncurl_setopt($c,CURLOPT_HTTPHEADER,$json?[\'accept: application/json\',\'content-type: application/json\']:[]);\r\nif(is_array($post))$post=http_build_query($post);\r\nif($post){curl_setopt($c,CURLOPT_POST,TRUE); curl_setopt($c,CURLOPT_POSTFIELDS,$post);}\r\ncurl_setopt($c,CURLOPT_USERAGENT,$_SERVER[\'HTTP_USER_AGENT\']);\r\ncurl_setopt($c,CURLOPT_RETURNTRANSFER,1); curl_setopt($c,CURLOPT_FOLLOWLOCATION,1);\r\ncurl_setopt($c,CURLOPT_SSL_VERIFYPEER,0); curl_setopt($c,CURLOPT_SSL_VERIFYHOST,0);\r\ncurl_setopt($c,CURLOPT_REFERER,host()); curl_setopt($c,CURLOPT_CONNECTTIMEOUT,2);\r\ncurl_setopt($c,CURLOPT_ENCODING,\'UTF-8\'); $enc=curl_getinfo($c,CURLINFO_CONTENT_TYPE);\r\n$ret=curl_exec($c); if($ret===false)$er=curl_errno($c);\r\ncurl_close($c); if($er)err($er); else return $ret;', 0, '2023-10-01 16:45:04'),
(346, 'src/php', 'lib', 'getcurl', '$f', 'return curl_get_contents($f);', 0, '2023-10-01 16:45:04'),
(347, 'src/php', 'lib', 'getfile', '$f', 'return file_get_contents($f);', 0, '2023-10-01 16:45:04'),
(348, 'src/php', 'lib', 'putfile', '$f,$d', 'mkdir_r($f); $e=file_put_contents($f,$d,LOCK_EX); opcache($f); if($e!==false)return 1;', 0, '2023-10-01 16:45:04'),
(349, 'src/php', 'lib', 'ftime', '$f,$d=\'\'', 'if(is_file($f))return date($d?$d:\'ymd.His\',filemtime($f));', 0, '2023-10-01 16:45:04'),
(350, 'src/php', 'lib', 'fsize', '$f,$o=\'\'', 'if(is_file($f))return round(filesize($f)/1024,1).($o?\' Ko\':\'\');', 0, '2023-10-01 16:45:04'),
(351, 'src/php', 'lib', 'opcache', '$d', 'if(!cnfg(\'local\'))opcache_invalidate($d);', 0, '2023-10-01 16:45:04'),
(352, 'src/php', 'lib', 'day', '$p=\'\',$d=\'\'', 'return date($p?$p:\'ymd.Hi\',is_numeric($d)?$d:time());', 0, '2023-10-01 16:45:04'),
(353, 'src/php', 'lib', 'sqldate', '', 'return date(\'Y-m-d H:i:s\');', 0, '2023-10-01 16:45:04'),
(354, 'src/php', 'lib', 'time_ago', '$dt', '$dy=time()-$dt; if($dy<86400){$fuseau=3;\r\n$h=intval(date(\'H\',$dy))-$fuseau; $i=intval(date(\'i\',$dy)); $s=intval(date(\'s\',$dy));\r\n$nbh=$h>1?$h.\' h \':\'\'; $nbi=$i>0?$i.\' min \':\'\'; return $nbh.$nbi;} else return day(\'\',$dt);', 0, '2023-10-01 16:45:04'),
(355, 'src/php', 'lib', 'strto', '$v,$s', '$p=mb_strpos($v??\'\',$s); return $p!==false?mb_substr($v,0,$p):$v;', 0, '2023-10-01 16:45:04'),
(356, 'src/php', 'lib', 'struntil', '$v,$s', '$p=mb_strrpos($v??\'\',$s); return $p!==false?mb_substr($v,0,$p):$v;', 0, '2023-10-01 16:45:04'),
(357, 'src/php', 'lib', 'strfrom', '$v,$s', '$p=mb_strpos($v??\'\',$s); return $p!==false?mb_substr($v,$p+mb_strlen($s)):$v;', 0, '2023-10-01 16:45:04'),
(358, 'src/php', 'lib', 'strend', '$v,$s', '$p=mb_strrpos($v??\'\',$s); return $p!==false?mb_substr($v,$p+mb_strlen($s)):$v;', 0, '2023-10-01 16:45:04'),
(359, 'src/php', 'lib', 'split_one', '$s,$v,$n=\'\'', 'if($n)$p=mb_strrpos($v,$s); else $p=mb_strpos($v,$s);\r\nif($p!==false)return [mb_substr($v,0,$p),mb_substr($v,$p+1)]; else return [$v,\'\'];', 0, '2023-10-01 16:45:04'),
(360, 'src/php', 'lib', 'split_right', '$s,$v,$n=\'\'', 'if($n)$p=mb_strrpos($v,$s); else $p=mb_strpos($v,$s);\r\nif($p!==false)return [mb_substr($v,0,$p),mb_substr($v,$p+1)]; else return [\'\',$v];', 0, '2023-10-01 16:45:04'),
(361, 'src/php', 'lib', 'active', '$d,$v', 'return $d==$v?\' active\':\'\';', 0, '2023-10-01 16:45:04'),
(362, 'src/php', 'lib', 'val', '$r,$k', 'return !empty($r[$k])?$r[$k]:\'\';', 0, '2023-10-01 16:45:04'),
(363, 'src/php', 'lib', 'vals', '$r,$ra', 'foreach($ra as $k=>$v)$rb[]=$r[$v]??\'\'; return $rb;', 0, '2023-10-01 16:45:04'),
(364, 'src/php', 'lib', 'valk', '$r,$ra', 'foreach($ra as $k=>$v)$rb[$v]=$r[$v]??\'\'; return $rb;', 0, '2023-10-01 16:45:04'),
(365, 'src/php', 'lib', 'arr', '$r,$n=\'\'', '$rb=[]; $n=$n?$n:count($r); for($i=0;$i<$n;$i++)$rb[]=$r[$i]??\'\'; return $rb;', 0, '2023-10-01 16:45:04'),
(366, 'src/php', 'lib', 'prm', '$p', '$rt=[]; foreach($p as $k=>$v)$rt[]=$k.\'=\'.$v; return implode(\',\',$rt);', 0, '2023-10-01 16:45:04'),
(367, 'src/php', 'lib', 'expl', '$s,$d,$n=2', '$r=explode($s,$d); for($i=0;$i<$n;$i++)$rb[]=$r[$i]??\'\'; return $rb;', 0, '2023-10-01 16:45:04'),
(368, 'src/php', 'lib', 'explode_k', '$d,$a,$b', '$r=explode($b,$d); $rb=[];\r\nforeach($r as $k=>$v){if($v){$ra=split_right($a,$v);\r\nif(!empty($ra[0]))$rb[$ra[0]]=$ra[1]; else $rb[]=$ra[1];}} return $rb;', 0, '2023-10-01 16:45:04'),
(369, 'src/php', 'lib', 'implode_k', '$r,$a,$b', '$rb=[]; foreach($r as $k=>$v)if($v)$rb[]=$k.$a.$v;\r\nif($rb)return implode($b,$rb);', 0, '2023-10-01 16:45:04'),
(370, 'src/php', 'lib', 'implode_j', '$d', '$rb=[]; if(!is_array($d))$r[]=$d; else $r=$d;\r\nforeach($r as $k=>$v)if($v==\'this\' or $v==\'event\')$rb[]=$v; else $rb[]=\'\\\'\'.$v.\'\\\'\';\r\nif($rb)return implode(\',\',$rb);', 0, '2023-10-01 16:45:04'),
(371, 'src/php', 'lib', 'in_array_k', '$d,$r', 'foreach($r as $k=>$v)if($v && $d==$v)return $k;', 0, '2023-10-01 16:45:04'),
(372, 'src/php', 'lib', 'rdiv', '$r', 'return implode(\'\',array_map(\'div\',$r));', 0, '2023-10-01 16:45:04'),
(373, 'src/php', 'lib', 'walk', '$r,$fc', '$rt=[]; foreach($r as $k=>$v)$rt[]=$fc($v); return $rt;', 0, '2023-10-01 16:45:04'),
(374, 'src/php', 'lib', 'alert', '$d,$c=\'blue\',$o=\'\'', 'return div(voc($d).($o?\' \'.$o:\'\'),\'frame-\'.$c);', 0, '2023-10-01 16:45:04'),
(375, 'src/php', 'lib', 'xt', '$d,$o=0', 'return substr(strtolower(strrchr($d??\'\',\'.\')),$o);', 0, '2023-10-01 16:45:04'),
(376, 'src/php', 'lib', 'isimg', '$d', 'if(!$d)return; $d=xt($d); $r=[\'.jpg\',\'.png\',\'.gif\',\'.jpeg\',\'.webp\'];\r\nfor($i=0;$i<5;$i++)if(mb_strpos($d,$r[$i])!==false)return $r[$i];', 0, '2023-10-01 16:45:04'),
(377, 'src/php', 'lib', 'ishttp', '$d', 'return strpos($d,\'://\')?1:0;', 0, '2023-10-01 16:45:04'),
(378, 'src/php', 'lib', 'ishtml', '$d', 'return strpos($d,\'<\')!==false?1:0;', 0, '2023-10-01 16:45:04'),
(379, 'src/php', 'lib', 'imgroot', '$d', 'return ishttp($d)?$d:\'/img/\'.$d;', 0, '2023-10-01 16:45:04'),
(380, 'src/php', 'lib', 'usrroot', '$d', 'return ishttp($d)?$d:\'/usr/\'.$d;', 0, '2023-10-01 16:45:04'),
(381, 'src/php', 'lib', 'nohttp', '$f', 'if($f)return str_replace([\'http://\',\'https://\',\'www.\'],\'\',$f);', 0, '2023-10-01 16:45:04'),
(382, 'src/php', 'lib', 'domain', '$f', '$f=nohttp($f); $p=strpos($f??\'\',\'/\'); return $p?substr($f,0,$p):$f;', 0, '2023-10-01 16:45:04'),
(383, 'src/php', 'lib', 'host', '', 'return \'http://\'.$_SERVER[\'HTTP_HOST\'];', 0, '2023-10-01 16:45:04'),
(384, 'src/php', 'lib', 'uip', '', '$ip=$_SERVER[\'REMOTE_ADDR\']??\'\';\r\nif(strstr($ip,\' \'))return explode(\' \',$ip)[0]; else return gethostbyaddr($ip);', 0, '2023-10-01 16:45:04'),
(385, 'src/php', 'lib', 'voc', '$d', '$r=sesmk(\'json::call\',\'sys/voc\',0); return ucfirst($r[$d]??$d);', 0, '2023-10-01 16:45:04'),
(386, 'src/php', 'lib', 'ico', '$d', '$r=sesmk(\'json::call\',\'sys/ico\',0); return span($r[$d]??\'\',\'ico\');', 0, '2023-10-01 16:45:04'),
(387, 'src/php', 'lib', 'icovoc', '$d,$b=\'\',$c=\'\'', 'return ico($d).thin().span(voc($b?$b:$d),$c);', 0, '2023-10-01 16:45:04'),
(388, 'src/php', 'lib', 'rid', '$p=\'\'', 'return $p.substr(microtime(),2,7);', 0, '2023-10-01 16:45:04'),
(389, 'src/php', 'lib', 'unid', '$p,$n=6', 'return substr(md5($p),2,$n);', 0, '2023-10-01 16:45:04'),
(390, 'src/php', 'lib', 'k', '$k,$v', 'return self::$r[$k]=$v;', 0, '2023-10-01 16:45:04'),
(391, 'src/php', 'lib', 'r', '$k', 'return self::$r[$k]??\'\';', 0, '2023-10-01 16:45:04'),
(392, 'src/php', 'lib', 'z', '$k', 'unset(self::$r[$k]);', 0, '2023-10-01 16:45:04'),
(393, 'src/php', 'lib', 'err', '$v', 'return self::$er[]=$v;', 0, '2023-10-01 16:45:04'),
(394, 'src/php', 'lib', 'usr', '$k', 'return self::$r[\'usr\'][$k]??\'\';', 0, '2023-10-01 16:45:04'),
(395, 'src/php', 'lib', 'cnfg', '$k', 'return self::$r[\'cnfg\'][$k]??\'\';', 0, '2023-10-01 16:45:04'),
(396, 'src/php', 'lib', 'auth', '$n', 'return ses(\'auth\')>=$n?1:0;', 0, '2023-10-01 16:45:04'),
(397, 'src/php', 'lib', 'exc', '$d', 'return shell_exec($d);', 0, '2023-10-01 16:45:04'),
(398, 'src/php', 'lib', 'chmodf', '$f', 'return shell_exec(\'chmod +x \'.$f);', 0, '2023-10-01 16:45:04'),
(399, 'src/php', 'lib', 'p', '$r', 'print_r($r);', 0, '2023-10-01 16:45:04'),
(400, 'src/php', 'lib', 'pr', '$r', 'echo \'<pre>\'.print_r($r,true).\'</pre>\';', 0, '2023-10-01 16:45:04'),
(401, 'src/php', 'lib', 'eco', '$d', 'if(is_array($d))$d=\'<pre>\'.print_r($d,true).\'</pre>\';\r\nelseif(is_object($d))$d=var_dump($d,true);\r\necho textarea(\'\',htmlspecialchars_decode($d),44,12);', 0, '2023-10-01 16:45:04'),
(402, 'src/php', 'lib', 'trace', '', 'pr(debug_backtrace());', 0, '2023-10-01 16:45:04'),
(403, 'src/php', 'lib', 'out', '$r', 'pr($r); exit();', 0, '2023-10-01 16:45:04'),
(404, 'src/php/root', 'admin', 'pub', '$p', '[$id,$b]=vals($p,[\'id\',\'b\']);\r\n$pub=sql::read(\'pub\',$b,\'v\',[\'id\'=>$id]);\r\n$pub2=$pub==1?0:1; if($pub==-1)$pub2=0; if($pub==-2)$pub2=-1;\r\nsql::upd($b,[\'pub\'=>$pub2],[\'id\'=>$id]);\r\nreturn self::btswitch($id,$pub2,$b);', 0, '2023-10-01 16:45:04'),
(405, 'src/php/root', 'admin', 'btswitch', '$id,$pub,$b', '$r=[-1=>\'trash\',0=>\'off\',1=>\'on\']; $bt=voc($r[$pub]);\r\n$r=[-1=>\'btno\',0=>\'btoff\',1=>\'bton\']; $c=$r[$pub];\r\n$ret=bj($b.\'pub\'.$id.\'|admin,pub|id=\'.$id.\',b=\'.$b,$bt,$c);\r\nif($pub==0)$ret=bj($b.\'pub\'.$id.\'|admin,pub|id=\'.$id.\',b=\'.$b,$bt,$c);\r\nreturn $ret;', 2, '2023-10-01 16:45:04'),
(406, 'src/php/root', 'admin', 'bt', '$id,$pub,$b=\'posts\'', 'return span(self::btswitch($id,$pub,$b),\'\',$b.\'pub\'.$id);', 6, '2023-10-01 16:45:04'),
(407, 'src/php/root', 'admin', 'pending_tracks', '', '$r=sql::inner(\'b2.id,name,txt,pub\',\'users\',\'tracks\',\'uid\',\'ra\',[\'_order\'=>\'b2.id desc\']);\r\nforeach($r as $k=>$v){\r\n	$r[$k][\'id\']=bh(\'post/\'.$v[\'id\'],$v[\'id\'],\'btn\');\r\n	$r[$k][\'pub\']=self::bt($v[\'id\'],$v[\'pub\'],\'tracks\');}\r\nreturn build::tabler($r,[\'id\',\'author\',\'txt\',\'pub\']);', 1, '2023-10-01 16:45:04'),
(408, 'src/php/root', 'admin', 'pending_posts', '', '$r=sql::inner(\'b2.id,name,catid,excerpt,pub\',\'users\',\'posts\',\'uid\',\'ra\',[\'_order\'=>\'b2.id desc\']);\r\nforeach($r as $k=>$v){\r\n	$r[$k][\'id\']=bh(\'post/\'.$v[\'id\'],$v[\'id\'],\'btn\');\r\n	$r[$k][\'pub\']=self::bt($v[\'id\'],$v[\'pub\'],\'posts\');}\r\nreturn build::tabler($r,[\'id\',\'author\',\'catid\',\'excerpt\',\'pub\']);', 1, '2023-10-01 16:45:04'),
(409, 'src/php/root', 'admin', 'apps', '', '$r=[\'conn\',\'conv\',\'test\',\'docs\'];\r\nreturn $r;', 1, '2023-10-01 16:45:04'),
(410, 'src/php/root', 'admin', 'appsmenu', '', '$rb=[]; $r=self::apps();\r\nforeach($r as $v)$rb[]=bj(\'japp|\'.$v.\',call\',span($v));\r\nreturn $rb;', 1, '2023-10-01 16:45:04'),
(411, 'src/php/root', 'admin', 'user', '', '//if(!ses(\'uid\'))return;\r\n$id=sql::read(\'id\',\'profile\',\'v\',[\'uid\'=>ses(\'uid\')]);\r\n$rt[\'profile\']=dbedt::call([\'a\'=>\'profile\',\'id\'=>$id]);\r\n$rt[\'socials\']=dbedt::call([\'a\'=>\'socials\',\'id\'=>\'\']);\r\nreturn build::tabs($rt);', 1, '2023-10-01 16:45:04'),
(412, 'src/php/root', 'admin', 'call', '$p', 'if(!auth(6))return alert(\'forbiden\',\'red\');\r\n$rt[voc(\'tracks\')]=h2(voc(\'tracks_moderation\')).div(self::pending_tracks());\r\n$rt[voc(\'posts\')]=h2(voc(\'posts_moderation\')).div(self::pending_posts());\r\n$rt[voc(\'contacts\')]=h2(voc(\'contacts\')).div(contact::read($p));\r\n$rt[\'json\']=h2(\'json\').div(jedt::menu(),\'menu\').div(\'\',\'\',\'jmnu\');\r\nif(auth(6))$rt[\'db\']=h2(\'db\').div(dbedt::call([\'a\'=>\'\']),\'\',\'edt\');\r\n$rt[\'apps\']=h2(\'apps\').div(join(\'\',self::appsmenu()),\'vlist\').div(\'\',\'\',\'japp\');\r\nreturn build::tabs($rt);', 0, '2023-10-01 16:45:04'),
(413, 'src/php/root', 'blocks', 'bkg', '', '$id=ses(\'uid\'); if(!$id)$id=cnfg(\'usrhome\');\r\n$v=sql::read(\'banner\',\'profile\',\'v\',$id);\r\nif(isimg($v??\'\'))$v=\'url(/img/\'.$v.\')\';\r\nreturn $v;', 0, '2023-10-01 16:45:04'),
(414, 'src/php/root', 'blocks', 'banner', '$p', '[$a,$b]=vals($p,[\'a\',\'b\']);\r\n$id=ses(\'uid\'); if(!$id)$id=cnfg(\'usrhome\');\r\n$r=sql::read(\'surname,slogan,banner,logo\',\'profile\',\'a\',$id);\r\nif(!$r)$r=self::$defaults;\r\n$r[\'surname\']=bh(\'home\',$r[\'surname\']);\r\n$ret=view::call(\'banner\',$r);\r\nreturn $ret;', 0, '2023-10-01 16:45:04'),
(415, 'src/php/root', 'blocks', 'footer', '$p', '$bt=lk(\'/\',\'𝓮𝓽𝓬\').\' | \';\r\n$bt.=lk(\'https://github.com/FractalFramework/etc\',\'src\',\'small\');\r\n$ret=div($bt);\r\n$ret.=div(\'@2023 All rights reserved\',\'small\');\r\nreturn $ret;', 0, '2023-10-01 16:45:04'),
(416, 'src/php/root', 'blocks', 'shutter', '$p', 'return;\r\nif(get(\'a\')==\'post\' && is_numeric($p[\'a\']??\'\'))\r\nreturn div(tracks::call($p),\'main\');', 0, '2023-10-01 16:45:04'),
(417, 'src/php/root', 'blocks', 'home', '$p', '$r[\'presentation\']=conns::profile(\'\');\r\n$r[\'socials\']=conns::socials(\'\');\r\n$ret=view::call(\'home\',$r);\r\nreturn $ret;', 0, '2023-10-01 16:45:04'),
(418, 'src/php/root', 'blocks', 'forbidden', '', 'return alert(\'forbiden_access\',\'red\');', 5, '2023-10-01 16:45:04'),
(419, 'src/php/root', 'blocks', 'secure', '$a,$b', '$r=sesmk(\'json::call\',\'cnfg/secur\');\r\n$m=$r[$a][$b]??ses(\'auth\');\r\nif(!auth($m))return 1;', 2, '2023-10-01 16:45:04'),
(420, 'src/php/root', 'blocks', 'call', '$p', '[$a,$b,$c,$d]=vals($p,[\'a\',\'b\',\'c\',\'d\']);\r\nif($a==\'main\')$a=get(\'a\');//root for $main is decided by url\r\nif($a==\'main\')$a=\'\';//discard loop\r\n$p=[\'a\'=>$b,\'b\'=>$c,\'c\'=>$d];//like ajax cmd\r\nif(method_exists(\'blocks\',$a)){\r\n	if(self::secure(\'blocks\',$a))return self::forbidden();\r\n	else return self::$a($p);}\r\nif(method_exists($a,\'call\')){\r\n	if(self::secure($a,\'call\'))return self::forbidden();\r\n	else return $a::call($p);}\r\nreturn match($a){//specific urls to avoid {url}::call\r\n	\'create\'=>auth(4)?posts::create($p):self::forbidden(),\r\n	//\'addnav\'=>auth(4)?nav::create($p):self::forbidden(),\r\n	//\'edit\'=>auth(4)?posts::read($p):self::forbidden(),\r\n	\'user\'=>admin::user($p),\r\n	default=>posts::call($p)};', 1, '2023-10-01 16:45:04'),
(421, 'src/php/root', 'boot', 'cnfg', '', '$r=json::call(\'cnfg/vars\');\r\nses(\'dev\',$r[\'dev\']);\r\nses::$r[\'cnfg\']=$r;', 1, '2023-10-01 16:45:04'),
(422, 'src/php/root', 'boot', 'call', '', 'self::cnfg();\r\n//build::ftpchmod(\'src\',777);\r\nlogin::recognize();\r\nif(cnfg(\'install\'))db::install_all();', 1, '2023-10-01 16:45:04'),
(423, 'src/php/root', 'conns', 'connbt', '$p', '$rt=[];\r\n$r=json::call(\'sys/conn\'); $id=$p[\'id\']??\'\'; $a=$p[\'a\']??0;\r\nforeach($r as $k=>$v){[$t,$o,$b]=arr($v,3); if($o)$o=\'|\'.$o;\r\n	if($a==$b)$rt[]=btj(\'embed\',[\'[\',$o.\':\'.$k.\']\',$id],$k,\'\',[\'title\'=>$t]);}\r\nreturn join(\'\',$rt);', 1, '2023-10-01 16:45:04'),
(424, 'src/php/root', 'conns', 'btedt', '$p', '$id=$p[\'id\']??\'\';\r\n$ret=btj(\'embed\',[\'[\',\']\',$id],\'[ ]\');\r\n$ret.=self::connbt($p);\r\nif($p[\'sav\']??\'\')$ret.=btj(\'editbt\',[\'content\',$id],ico(\'save\'),\'btsav\',[\'id\'=>\'bt\'.$id]);\r\nif($p[\'bt\']??\'\')$ret.=$p[\'bt\'];\r\n$ret.=togj(ico(\'...\'),\'conns,connbt|a=1,id=\'.$id);\r\nreturn div($ret,\'menu\');', 2, '2023-10-01 16:45:04'),
(425, 'src/php/root', 'conns', 'trademark', '$d', 'return img(\'/img/socials/\'.$d.\'.png\',\'16px\');', 1, '2023-10-01 16:45:04'),
(426, 'src/php/root', 'conns', 'lnk_tm', '$u,$t=\'\',$ic=\'\'', 'if($ic)$t=self::trademark($ic).$t; return lk($u,$t?$t:domain($u));', 3, '2023-10-01 16:45:04'),
(427, 'src/php/root', 'conns', 'dl', '$d,$t=\'\'', 'return ico(\'download\').\' \'.($t?$t:domain($d));', 0, '2023-10-01 16:45:04'),
(428, 'src/php/root', 'conns', 'lnk', '$u,$t=\'\'', '$r=[\'twitter\',\'youtube\',\'facebook\',\'linkedin\',\'instagram\'];\r\nforeach($r as $k=>$v)if(strpos($u,$v)){\r\n	//if(method_exists(\'conns\',$v))return self::$v($u,$t); else\r\n	return self::lnk_tm($u,$t,$v);}\r\n$r=[\'mp3\',\'mp4\',\'pdf\',\'epub\',\'svg\',\'txt\',\'md\',\'gz\',\'zip\']; $xt=xt($u,1);\r\nforeach($r as $k=>$v)if($xt==$v)\r\n	//if(method_exists(\'conn\',$v))$d=self::$v($u); else\r\n	return self::lnk_tm($u,$t,\'url\');\r\nreturn lk($u,$t);', 2, '2023-10-01 16:45:04'),
(429, 'src/php/root', 'conns', 'twalter', '$u,$id,$o=\'\'', '$sn=\'\';\r\nif(strpos($u,\'/\')){$ra=explode(\'/\',$u); $sn=$ra[3]??\'\'; $twid=$ra[5]??\'\';} else $twid=$u;//forbidden situation\r\n$ra=[\'name\',\'screen_name\',\'user_id\',\'date\',\'text\',\'media\',\'lang\'];\r\n$r=sql::read(implode(\',\',$ra),\'twit\',\'a\',[\'twid\'=>$twid],0);\r\nif($r && !$o)return self::play($twid,$r,[],0,$id);\r\n$rb=self::r(); foreach($rb as $k=>$v)$rb[$k]=$v==\'int\'||$v==\'bint\'?0:\'\';\r\n$rb[\'twid\']=$twid; if($id)$rb[\'ib\']=$id; $rb[\'date\']=time(); if($sn)$rb[\'screen_name\']=$sn;\r\n$lk=self::lk($sn?$sn:\'unknown\',$twid);\r\n$ret=lkt(\'txtx\',$lk,pictxt(\'url\',$sn));\r\n[$res,$nm,$sn]=self::oembed($lk);\r\n[$txt,$med]=self::clean($res); $med=utmsrc($med);\r\n$rb[\'text\']=$txt; if($nm)$rb[\'name\']=$nm; $rb[\'media\']=$med; $rb[\'screen_name\']=$sn;\r\nif($o && $r)sqlup(\'qdtw\',$rb,[\'twid\'=>$twid],0);\r\nelseif($txt && auth(6) && $id!=\'test\')sqlsav(\'qdtw\',$rb,0,0);\r\nreturn self::play($twid,$rb,[],$o,$id);', 0, '2023-10-01 16:45:04'),
(430, 'src/php/root', 'conns', 'youtube', '$u,$t', 'if($t)return self::lnk_tm($u,$t,\'youtube\');\r\n$ico=ico(\'video\'); $id=strend($u,\'?v=\'); $id=strto($id,\'&\');\r\n$tm=strpos($u,\'t=\')?\'&t=\'.between($u,\'t=\',\'&\'):\'\';\r\n$im=\'https://img.youtube.com/vi/\'.$id.\'/hqdefault.jpg\';\r\nreturn build::iframe(\'https://www.youtube.com/embed/\'.$id.$tm);', 0, '2023-10-01 16:45:04'),
(431, 'src/php/root', 'conns', 'video', '$u,$t', '$r=[\'youtube\',\'vimeo\',\'odysee\',\'vk\'];\r\nforeach($r as $k=>$v)if(strpos($u,$v)){\r\n	if(method_exists(\'conns\',$v))return self::$v($u,$t);}\r\nreturn lnk($u,$t);', 0, '2023-10-01 16:45:04'),
(432, 'src/php/root', 'conns', 'mp3', '$u,$t', 'return audio($u);', 0, '2023-10-01 16:45:04'),
(433, 'src/php/root', 'conns', 'mp4', '$u,$t', 'return video($u);', 0, '2023-10-01 16:45:04'),
(434, 'src/php/root', 'conns', 'list', '$p', '$r=explode(\"\\n\",$p); return build::mkli($r,\'ul\');', 0, '2023-10-01 16:45:04'),
(435, 'src/php/root', 'conns', 'numlist', '$p', '$r=explode(\"\\n\",$p); return build::mkli($r,\'ol\');', 0, '2023-10-01 16:45:04'),
(436, 'src/php/root', 'conns', 'art', '$id,$t=\'\'', 'if(!$t)$t=sql::read(\'title\',\'posts\',\'v\',$id);\r\nreturn bh(\'post/\'.$id,ico(\'url\').thin().$t,\'btn\');', 0, '2023-10-01 16:45:04'),
(437, 'src/php/root', 'conns', 'read', '$id,$o=\'\'', '$d=\'\';\r\nif(!$o)$d=posts::content([\'id\'=>$id]);\r\n$t=sql::read(\'title\',\'posts\',\'v\',$id);\r\n$ret=h3(bg(\'cnt\'.$id.\'|conns,read_content|id=\'.$id,$t,!$o?\'active\':\'\'));\r\n$ret.=div($d,\'\',\'cnt\'.$id);\r\nreturn $ret;', 0, '2023-10-01 16:45:04'),
(438, 'src/php/root', 'conns', 'md', '$d,$o=\'\'', '$d=conv::md2conn($d);\r\n$d=conn::parser($d);\r\nif($o){$d=conn::embed_p($d); $d=nl2br($d);}\r\nreturn $d;', 1, '2023-10-01 16:45:04'),
(439, 'src/php/root', 'conns', 'profile', '$id,$o=\'\'', '$uid=posts::usrart($id); if(!$uid)$uid=cnfg(\'usrhome\'); //if(!$uid)$uid=ses(\'uid\');\r\n$r=sql::inner(\'name,surname,mail,slogan,logo\',\'users\',\'profile\',\'uid\',\'a\',[\'b1.id\'=>$uid]);\r\nif(!$r)return;\r\n$ret=h2($r[\'surname\']);\r\n$ret.=h3($r[\'slogan\']); \r\n$f=imgroot($r[\'logo\']);\r\nif(isimg($r[\'logo\']))$ret.=img($f,\'180px\');\r\nreturn $ret;', 1, '2023-10-01 16:45:04'),
(440, 'src/php/root', 'conns', 'socials', '$id,$o=\'\'', '$rt=[];\r\n$uid=posts::usrart($id); if(!$uid)$uid=cnfg(\'usrhome\');\r\n$r=sql::read(\'url\',\'socials\',\'rv\',[\'uid\'=>$uid]); if(!$r)return;\r\nforeach($r as $k=>$v)$rt[]=self::lnk($v);\r\nreturn rdiv($rt);', 1, '2023-10-01 16:45:04'),
(441, 'src/php/root', 'conns', 'code', '$d', '$d=str_replace([\'\',\'\'],\'\',$d); $d=trim($d);\r\nini_set(\'highlight.comment\',\'gray\');\r\nini_set(\'highlight.default\',\'white\');\r\nini_set(\'highlight.html\',\'red\');\r\nini_set(\'highlight.keyword\',\'orange\');\r\nini_set(\'highlight.string\',\'lightblue\');\r\n$d=highlight_string(\'<\'.\'?php\'.\"\\n\".$d,true);\r\n$d=str_replace([\'&lt;?php\',\'\',\'><br />\'],[\'\',\'\',\'>\'],$d);\r\n$d=trim($d,\'<br />\');\r\nreturn div($d,\'\',\'\',\'overflow:auto; wrap:true; background:#222244; padding:0 20px;\');', 0, '2023-10-01 16:45:04'),
(442, 'src/php/root', 'main', 'read', '$a,$g', '$rb=[];\r\n$r=json::call(\'views/\'.$a);\r\n$ra=view::vars($r); //same names for var and functions \r\n$ra=[\'bkg\',\'banner\',\'nav\',\'main\',\'shutter\',\'footer\'];\r\nforeach($ra as $k=>$v)$rb[$v]=blocks::call([\'a\'=>$v]+$g);\r\n$ret=view::com($r,$rb);\r\nif(ses::cnfg(\'savehtml\'))view::save_html($a);\r\nreturn $ret;', 1, '2023-10-01 16:45:04'),
(443, 'src/php/root', 'main', 'call', '$g', '$ret=self::read(\'index\',$g);\r\nreturn $ret;', 1, '2023-10-01 16:45:04'),
(444, 'src/php/root', 'nav', 'defaults', '', '//$rt[\'home\']=[\'home\',\'home\',0];\r\n//$rt[\'post\']=[\'sarticles\',\'folder\',0];\r\n//$r=sql::inner(\'distinct(category)\',\'cats\',\'posts\',\'catid\',\'rv\',\'where pub>0\');\r\n//foreach($r as $k=>$v)$rt[]=$rt[\'posts/\'.$v]=[$v,\'folder\',0];\r\n//$rt[\'addnav\']=[\'menu\',\'plus\',1];\r\n$rt[0]=[\'\',\'\',0];\r\n$rt[\'contact\']=[\'contact\',\'mail\',0];\r\n//$rt[\'search\']=[\'search\',\'search\',0];\r\n//$rt[\'create\']=[\'create\',\'plus\',1];\r\n$rt[\'login\']=[\'login\',\'login\',0];\r\n$rt[\'user\']=[\'#user\',\'user\',1];\r\n$rt[\'admin\']=[\'admin\',\'admin\',6];\r\nreturn $rt;', 1, '2023-10-01 16:45:04'),
(445, 'src/php/root', 'nav', 'datas', '', '$rt=[]; $g=get(\'a\');\r\n$r=json::call(\'cnfg/nav\'); $ath=ses(\'auth\');\r\n$r+=self::defaults();\r\n//$rt[]=bj(\'pagup|jedt,edit|a=cnfg/nav\',ico(\'edit\'));\r\nforeach($r as $com=>$v){[$bt,$ico,$auth]=$v;\r\n	if($bt)$bt=str_replace(\'#user\',ses(\'usr\'),$bt);\r\n	if(!$bt)$rt[]=div(\'\',\'line\');\r\n	elseif($auth<=$ath)$rt[]=bh($com,ico($ico).span(thin().$bt,\'react\'));}//,active($com,$g)\r\nreturn $rt;', 1, '2023-10-01 16:45:04'),
(446, 'src/php/root', 'nav', 'call', '$p', '$ra=self::datas();\r\n$rb[\'nav\']=join(\'\',$ra);\r\nreturn view::call(\'nav\',$rb);', 3, '2023-10-01 16:45:04'),
(447, 'src/php/sub', 'download', 'gz', '$f', 'header(\'Content-Type: application/x-bzip\');\r\nheader(\'Content-Disposition: attachment; filename=\'.$f);\r\necho bzcompress($f);', 0, '2023-10-01 16:45:04'),
(448, 'src/php/sub', 'download', 'file', '$f,$nmf', 'header(\'Content-type: application/octet-stream\' );\r\nheader(\'Content-Disposition: attachment; filename=\'.$nmf);\r\nflush();//send buffer\r\nreadfile($f);', 1, '2023-10-01 16:45:04'),
(449, 'src/php/sub', 'download', 'eye', '$f', '$r=[\'file\'=>$f,\'date\'=>day(),\'ip\'=>hostname()]; \r\njedt::add(\'\',\'usr/downloads\',$r);', 1, '2023-10-01 16:45:04'),
(450, 'src/php/sub', 'download', 'rednm', '$d', 'if(strrpos($d,\'/\')!==false)$d=substr($d,strrpos($d,\'/\')+1);\r\nreturn str::normalize($d);', 1, '2023-10-01 16:45:04'),
(451, 'src/php/sub', 'download', 'call', '$p', '[$a,$b]=vals($p,[\'a\',\'b\']);\r\n$dir=\'_datas/dl/\'; $f=base64_decode($a);\r\nif(strpos($f,\'cnfg\')===false && is_file($f)){\r\n	$nm=self::rednm($f); $nmf=$nm.\'.txt\';\r\n	if(is_file($dir.$nmf))$nb=getfile($dir.$nmf);\r\n	putfile($dir.$nmf,$nb=$nb?$nb+1:1);\r\n	self::eye($f);\r\n	self::file($f,$nm);}', 0, '2023-10-01 16:45:04');

-- --------------------------------------------------------

--
-- Structure de la table `_progr`
--

CREATE TABLE `_progr` (
  `id` int(11) NOT NULL,
  `parent` varchar(255) NOT NULL DEFAULT '',
  `child` varchar(255) NOT NULL DEFAULT '',
  `up` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `_progr`
--

INSERT INTO `_progr` (`id`, `parent`, `child`, `up`) VALUES
(1, 'contact::save', 'sql::sav', '2023-10-01 16:45:06'),
(2, 'contact::read', 'view::call', '2023-10-01 16:45:06'),
(3, 'contact::read', 'build::tabler', '2023-10-01 16:45:06'),
(4, 'contact::read', 'sql::read', '2023-10-01 16:45:06'),
(5, 'posts::usrart', 'sql::read', '2023-10-01 16:45:06'),
(6, 'posts::catid', 'sql::read', '2023-10-01 16:45:06'),
(7, 'posts::catid', 'sql::sav', '2023-10-01 16:45:06'),
(8, 'posts::content', 'conn::embed_p', '2023-10-01 16:45:06'),
(9, 'posts::content', 'sql::read', '2023-10-01 16:45:06'),
(10, 'posts::del', 'sql::upd', '2023-10-01 16:45:06'),
(11, 'posts::save', 'posts::catid', '2023-10-01 16:45:06'),
(12, 'posts::save', 'posts::read', '2023-10-01 16:45:06'),
(13, 'posts::save', 'sql::sav', '2023-10-01 16:45:06'),
(14, 'posts::update', 'conn::build', '2023-10-01 16:45:06'),
(15, 'posts::update', 'conv::build', '2023-10-01 16:45:06'),
(16, 'posts::update', 'sql::upd', '2023-10-01 16:45:06'),
(17, 'posts::create', 'posts::save', '2023-10-01 16:45:06'),
(18, 'posts::create', 'posts::read', '2023-10-01 16:45:06'),
(19, 'posts::create', 'sql::read', '2023-10-01 16:45:06'),
(20, 'posts::datas', 'sql::inner', '2023-10-01 16:45:06'),
(21, 'posts::read', 'posts::datas', '2023-10-01 16:45:06'),
(22, 'posts::read', 'tracks::call', '2023-10-01 16:45:06'),
(23, 'posts::read', 'view::call', '2023-10-01 16:45:06'),
(24, 'posts::read', 'conn::build', '2023-10-01 16:45:06'),
(25, 'posts::read', 'sql::read', '2023-10-01 16:45:06'),
(26, 'posts::read', 'conns::btedt', '2023-10-01 16:45:06'),
(27, 'posts::stream', 'posts::datas', '2023-10-01 16:45:06'),
(28, 'posts::stream', 'view::call', '2023-10-01 16:45:06'),
(29, 'posts::stream', 'sql::read', '2023-10-01 16:45:06'),
(30, 'posts::call', 'posts::read', '2023-10-01 16:45:06'),
(31, 'posts::call', 'posts::stream', '2023-10-01 16:45:06'),
(32, 'test::md', 'conn::build', '2023-10-01 16:45:06'),
(33, 'test::md', 'conv::md2conn', '2023-10-01 16:45:06'),
(34, 'test::call', 'test::md', '2023-10-01 16:45:06'),
(35, 'test::call', 'test::jajax', '2023-10-01 16:45:06'),
(36, 'test::call', 'build::ftpchmod', '2023-10-01 16:45:06'),
(37, 'tracks::del', 'sql::upd', '2023-10-01 16:45:06'),
(38, 'tracks::edit', 'view::call', '2023-10-01 16:45:06'),
(39, 'tracks::edit', 'sql::read', '2023-10-01 16:45:06'),
(40, 'tracks::register', 'login::uid', '2023-10-01 16:45:06'),
(41, 'tracks::register', 'login::identify', '2023-10-01 16:45:06'),
(42, 'tracks::register', 'sql::sav', '2023-10-01 16:45:06'),
(43, 'tracks::save', 'posts::usrart', '2023-10-01 16:45:06'),
(44, 'tracks::save', 'tracks::register', '2023-10-01 16:45:06'),
(45, 'tracks::save', 'tracks::read', '2023-10-01 16:45:06'),
(46, 'tracks::save', 'sql::sav', '2023-10-01 16:45:06'),
(47, 'tracks::read', 'view::call', '2023-10-01 16:45:06'),
(48, 'tracks::read', 'sql::inner', '2023-10-01 16:45:06'),
(49, 'tracks::stream', 'view::call', '2023-10-01 16:45:06'),
(50, 'tracks::stream', 'sql::inner', '2023-10-01 16:45:06'),
(51, 'tracks::call', 'tracks::form', '2023-10-01 16:45:06'),
(52, 'tracks::call', 'tracks::stream', '2023-10-01 16:45:06'),
(53, 'tracks::call', 'view::call', '2023-10-01 16:45:06'),
(54, 'tracks::call', 'sql::read', '2023-10-01 16:45:06'),
(55, 'str::clean_mail', 'str::clean_lines', '2023-10-01 16:45:06'),
(56, 'str::clean_br', 'str::clean_lines', '2023-10-01 16:45:06'),
(57, 'view::vars', 'view::file', '2023-10-01 16:45:06'),
(58, 'view::vars', 'view::vars', '2023-10-01 16:45:06'),
(59, 'view::vars', 'view::trigger', '2023-10-01 16:45:06'),
(60, 'view::vars', 'view::save', '2023-10-01 16:45:06'),
(61, 'view::vars', 'view::save_html', '2023-10-01 16:45:06'),
(62, 'view::vars', 'view::build', '2023-10-01 16:45:06'),
(63, 'view::vars', 'view::com', '2023-10-01 16:45:06'),
(64, 'view::vars', 'json::file', '2023-10-01 16:45:06'),
(65, 'view::vars', 'json::call', '2023-10-01 16:45:06'),
(66, 'view::trigger', 'view::file', '2023-10-01 16:45:06'),
(67, 'view::trigger', 'json::file', '2023-10-01 16:45:06'),
(68, 'view::save', 'view::trigger', '2023-10-01 16:45:06'),
(69, 'view::save_html', 'view::save', '2023-10-01 16:45:06'),
(70, 'view::save_html', 'view::build', '2023-10-01 16:45:06'),
(71, 'view::save_html', 'json::call', '2023-10-01 16:45:06'),
(72, 'view::build', 'view::build', '2023-10-01 16:45:06'),
(73, 'view::com', 'view::build', '2023-10-01 16:45:06'),
(74, 'view::call', 'view::save_html', '2023-10-01 16:45:06'),
(75, 'view::call', 'view::com', '2023-10-01 16:45:06'),
(76, 'view::call', 'json::call', '2023-10-01 16:45:06'),
(77, 'build::playr', 'build::playr', '2023-10-01 16:45:06'),
(78, 'build::tree', 'build::playr', '2023-10-01 16:45:06'),
(79, 'build::csvfile', 'build::writecsv', '2023-10-01 16:45:06'),
(80, 'build::btpages', 'build::btpages_nb', '2023-10-01 16:45:06'),
(81, 'build::audio', 'build::download', '2023-10-01 16:45:06'),
(82, 'build::ftpchmod', 'build::ftp', '2023-10-01 16:45:06'),
(83, 'conn::poc', 'conn::cprm', '2023-10-01 16:45:06'),
(84, 'conn::parser', 'conn::parser', '2023-10-01 16:45:06'),
(85, 'conn::connectors', 'conn::poc', '2023-10-01 16:45:06'),
(86, 'conn::connectors', 'conns::lnk', '2023-10-01 16:45:06'),
(87, 'conn::build', 'conn::parser', '2023-10-01 16:45:06'),
(88, 'conn::build', 'conn::embed_p', '2023-10-01 16:45:06'),
(89, 'conn::call', 'conns::btedt', '2023-10-01 16:45:06'),
(90, 'conv::tags', 'img::b64img', '2023-10-01 16:45:06'),
(91, 'conv::tags', 'img::getim', '2023-10-01 16:45:06'),
(92, 'conv::recursearch', 'conv::ecart', '2023-10-01 16:45:06'),
(93, 'conv::recursearch', 'conv::recursearch', '2023-10-01 16:45:06'),
(94, 'conv::parse', 'conv::tags', '2023-10-01 16:45:06'),
(95, 'conv::parse', 'conv::ecart', '2023-10-01 16:45:06'),
(96, 'conv::parse', 'conv::recursearch', '2023-10-01 16:45:06'),
(97, 'conv::parse', 'conv::parse', '2023-10-01 16:45:06'),
(98, 'conv::build', 'str::clean_n', '2023-10-01 16:45:06'),
(99, 'conv::build', 'conv::cleanhtml', '2023-10-01 16:45:06'),
(100, 'conv::build', 'conv::cleanconn', '2023-10-01 16:45:06'),
(101, 'conv::build', 'conv::parse', '2023-10-01 16:45:06'),
(102, 'conv::build', 'str::clean_punctuation', '2023-10-01 16:45:06'),
(103, 'conv::build', 'str::clean_lines', '2023-10-01 16:45:06'),
(104, 'css::trigger', 'css::file', '2023-10-01 16:45:06'),
(105, 'css::trigger', 'json::file', '2023-10-01 16:45:06'),
(106, 'css::save', 'css::trigger', '2023-10-01 16:45:06'),
(107, 'css::read', 'css::read', '2023-10-01 16:45:06'),
(108, 'css::build', 'css::file', '2023-10-01 16:45:06'),
(109, 'css::build', 'css::save', '2023-10-01 16:45:06'),
(110, 'css::build', 'css::read', '2023-10-01 16:45:06'),
(111, 'css::build', 'json::call', '2023-10-01 16:45:06'),
(112, 'db::jsoncolfromattr', 'sql::qr', '2023-10-01 16:45:06'),
(113, 'db::modifjsonvar', 'sql::qr', '2023-10-01 16:45:06'),
(114, 'db::modifjsonvar', 'sql::mkq', '2023-10-01 16:45:06'),
(115, 'db::cols', 'sql::call', '2023-10-01 16:45:06'),
(116, 'db::type_cols', 'db::cleanup', '2023-10-01 16:45:06'),
(117, 'db::type_cols', 'db::cols', '2023-10-01 16:45:06'),
(118, 'db::trigger', 'db::type_cols', '2023-10-01 16:45:06'),
(119, 'db::trigger', 'sql::drop', '2023-10-01 16:45:06'),
(120, 'db::trigger', 'sql::backup', '2023-10-01 16:45:06'),
(121, 'db::create', 'db::create_cols', '2023-10-01 16:45:06'),
(122, 'db::create', 'db::trigger', '2023-10-01 16:45:06'),
(123, 'db::create', 'sql::qr', '2023-10-01 16:45:06'),
(124, 'db::create', 'sql::drop', '2023-10-01 16:45:06'),
(125, 'db::create', 'sql::unikey', '2023-10-01 16:45:06'),
(126, 'db::table', 'json::call', '2023-10-01 16:45:06'),
(127, 'db::cols_k', 'db::cols_r', '2023-10-01 16:45:06'),
(128, 'db::cols_s', 'db::cols_k', '2023-10-01 16:45:06'),
(129, 'db::install_all', 'json::call', '2023-10-01 16:45:06'),
(130, 'dbedt::upd2', 'sql::read', '2023-10-01 16:45:06'),
(131, 'dbedt::upd2', 'sql::upd', '2023-10-01 16:45:06'),
(132, 'dbedt::upd', 'db::cols_k', '2023-10-01 16:45:06'),
(133, 'dbedt::upd', 'sql::upd', '2023-10-01 16:45:06'),
(134, 'dbedt::play', 'build::tabler', '2023-10-01 16:45:06'),
(135, 'dbedt::play', 'build::editable', '2023-10-01 16:45:06'),
(136, 'dbedt::play', 'db::cols_k', '2023-10-01 16:45:07'),
(137, 'dbedt::play', 'sql::read', '2023-10-01 16:45:07'),
(138, 'dbedt::read', 'build::editable', '2023-10-01 16:45:07'),
(139, 'dbedt::read', 'db::cols_r', '2023-10-01 16:45:07'),
(140, 'dbedt::read', 'dbedt::play', '2023-10-01 16:45:07'),
(141, 'dbedt::read', 'dbedt::entries', '2023-10-01 16:45:07'),
(142, 'dbedt::read', 'sql::read', '2023-10-01 16:45:07'),
(143, 'dbedt::entries', 'sql::read', '2023-10-01 16:45:07'),
(144, 'dbedt::menu', 'sql::call', '2023-10-01 16:45:07'),
(145, 'dbedt::call', 'dbedt::read', '2023-10-01 16:45:07'),
(146, 'dbedt::call', 'dbedt::menu', '2023-10-01 16:45:07'),
(147, 'docs::doc', 'sql::read', '2023-10-01 16:45:07'),
(148, 'docs::iter2', 'docs::iter', '2023-10-01 16:45:07'),
(149, 'docs::see2', 'build::tree', '2023-10-01 16:45:07'),
(150, 'docs::see2', 'docs::iter2', '2023-10-01 16:45:07'),
(151, 'docs::see2', 'sql::read', '2023-10-01 16:45:07'),
(152, 'docs::iter', 'docs::iter', '2023-10-01 16:45:07'),
(153, 'docs::see', 'build::tree', '2023-10-01 16:45:07'),
(154, 'docs::see', 'docs::iter', '2023-10-01 16:45:07'),
(155, 'docs::see', 'sql::read', '2023-10-01 16:45:07'),
(156, 'docs::vue', 'build::tabler', '2023-10-01 16:45:07'),
(157, 'docs::vue', 'build::csvfile', '2023-10-01 16:45:07'),
(158, 'docs::vue', 'sql::read', '2023-10-01 16:45:07'),
(159, 'docs::save2', 'sql::sav', '2023-10-01 16:45:07'),
(160, 'docs::arbo', 'docs::find', '2023-10-01 16:45:07'),
(161, 'docs::mktree', 'docs::iter', '2023-10-01 16:45:07'),
(162, 'docs::mktree', 'docs::save2', '2023-10-01 16:45:07'),
(163, 'docs::mktree', 'docs::unused', '2023-10-01 16:45:07'),
(164, 'docs::mktree', 'docs::arbo', '2023-10-01 16:45:07'),
(165, 'docs::mktree', 'docs::state', '2023-10-01 16:45:07'),
(166, 'docs::mktree', 'sql::read', '2023-10-01 16:45:07'),
(167, 'docs::funcsee', 'docs::iter', '2023-10-01 16:45:07'),
(168, 'docs::functree', 'docs::arbo', '2023-10-01 16:45:07'),
(169, 'docs::save', 'sql::sav', '2023-10-01 16:45:07'),
(170, 'docs::save', 'sql::trunc', '2023-10-01 16:45:07'),
(171, 'docs::find_func', 'build::tabler', '2023-10-01 16:45:07'),
(172, 'docs::find_func', 'docs::doc', '2023-10-01 16:45:07'),
(173, 'docs::find_func', 'docs::see2', '2023-10-01 16:45:07'),
(174, 'docs::find_func', 'docs::see', '2023-10-01 16:45:07'),
(175, 'docs::find_func', 'docs::vue', '2023-10-01 16:45:07'),
(176, 'docs::find_func', 'docs::mktree', '2023-10-01 16:45:07'),
(177, 'docs::find_func', 'docs::funcsee', '2023-10-01 16:45:07'),
(178, 'docs::find_func', 'docs::functree', '2023-10-01 16:45:07'),
(179, 'docs::find_func', 'docs::save', '2023-10-01 16:45:07'),
(180, 'docs::find_func', 'docs::find_func', '2023-10-01 16:45:07'),
(181, 'docs::find_func', 'docs::funcnt', '2023-10-01 16:45:07'),
(182, 'docs::find_func', 'docs::funclist', '2023-10-01 16:45:07'),
(183, 'docs::find_func', 'docs::count_cases', '2023-10-01 16:45:07'),
(184, 'docs::find_func', 'docs::occurrences', '2023-10-01 16:45:07'),
(185, 'docs::find_func', 'docs::funcount', '2023-10-01 16:45:07'),
(186, 'docs::find_func', 'docs::analys', '2023-10-01 16:45:07'),
(187, 'docs::find_func', 'docs::capture', '2023-10-01 16:45:07'),
(188, 'docs::find_func', 'docs::rapport', '2023-10-01 16:45:07'),
(189, 'docs::find_func', 'docs::build', '2023-10-01 16:45:07'),
(190, 'docs::find_func', 'docs::state', '2023-10-01 16:45:07'),
(191, 'docs::find_func', 'docs::menu', '2023-10-01 16:45:07'),
(192, 'docs::find_func', 'sql::read', '2023-10-01 16:45:07'),
(193, 'docs::funcnt', 'docs::save', '2023-10-01 16:45:07'),
(194, 'docs::funcnt', 'docs::find_func', '2023-10-01 16:45:07'),
(195, 'docs::funclist', 'docs::funcnt', '2023-10-01 16:45:07'),
(196, 'docs::count_cases', 'build::tabler', '2023-10-01 16:45:07'),
(197, 'docs::count_cases', 'docs::doc', '2023-10-01 16:45:07'),
(198, 'docs::count_cases', 'docs::see2', '2023-10-01 16:45:07'),
(199, 'docs::count_cases', 'docs::see', '2023-10-01 16:45:07'),
(200, 'docs::count_cases', 'docs::vue', '2023-10-01 16:45:07'),
(201, 'docs::count_cases', 'docs::mktree', '2023-10-01 16:45:07'),
(202, 'docs::count_cases', 'docs::funcsee', '2023-10-01 16:45:07'),
(203, 'docs::count_cases', 'docs::functree', '2023-10-01 16:45:07'),
(204, 'docs::count_cases', 'docs::funclist', '2023-10-01 16:45:07'),
(205, 'docs::count_cases', 'docs::count_cases', '2023-10-01 16:45:07'),
(206, 'docs::count_cases', 'docs::occurrences', '2023-10-01 16:45:07'),
(207, 'docs::count_cases', 'docs::funcount', '2023-10-01 16:45:07'),
(208, 'docs::count_cases', 'docs::analys', '2023-10-01 16:45:07'),
(209, 'docs::count_cases', 'docs::capture', '2023-10-01 16:45:07'),
(210, 'docs::count_cases', 'docs::rapport', '2023-10-01 16:45:07'),
(211, 'docs::count_cases', 'docs::build', '2023-10-01 16:45:07'),
(212, 'docs::count_cases', 'docs::state', '2023-10-01 16:45:07'),
(213, 'docs::count_cases', 'docs::menu', '2023-10-01 16:45:07'),
(214, 'docs::count_cases', 'sql::read', '2023-10-01 16:45:07'),
(215, 'docs::occurrences', 'docs::count_cases', '2023-10-01 16:45:07'),
(216, 'docs::funcount', 'docs::occurrences', '2023-10-01 16:45:07'),
(217, 'docs::\')!==false)$rf[]=between', 'docs::analys', '2023-10-01 16:45:07'),
(218, 'docs::\')!==false)$rf[]=between', 'docs::capture', '2023-10-01 16:45:07'),
(219, 'docs::capture', 'docs::analys', '2023-10-01 16:45:07'),
(220, 'docs::capture', 'docs::capture', '2023-10-01 16:45:07'),
(221, 'docs::rapport', 'build::tabler', '2023-10-01 16:45:07'),
(222, 'docs::build', 'docs::funcsee', '2023-10-01 16:45:07'),
(223, 'docs::build', 'docs::functree', '2023-10-01 16:45:07'),
(224, 'docs::build', 'docs::funclist', '2023-10-01 16:45:07'),
(225, 'docs::build', 'docs::funcount', '2023-10-01 16:45:07'),
(226, 'docs::build', 'docs::capture', '2023-10-01 16:45:07'),
(227, 'docs::build', 'docs::rapport', '2023-10-01 16:45:07'),
(228, 'docs::build', 'docs::state', '2023-10-01 16:45:07'),
(229, 'docs::state', 'sql::read', '2023-10-01 16:45:07'),
(230, 'docs::read', 'docs::doc', '2023-10-01 16:45:07'),
(231, 'docs::read', 'docs::see2', '2023-10-01 16:45:07'),
(232, 'docs::read', 'docs::see', '2023-10-01 16:45:07'),
(233, 'docs::read', 'docs::vue', '2023-10-01 16:45:07'),
(234, 'docs::read', 'docs::mktree', '2023-10-01 16:45:07'),
(235, 'docs::read', 'docs::build', '2023-10-01 16:45:07'),
(236, 'docs::call', 'docs::state', '2023-10-01 16:45:07'),
(237, 'docs::call', 'docs::menu', '2023-10-01 16:45:07'),
(238, 'edit::save', 'db::cols_k', '2023-10-01 16:45:07'),
(239, 'edit::save', 'sql::sav', '2023-10-01 16:45:07'),
(240, 'edit::update', 'db::cols_k', '2023-10-01 16:45:07'),
(241, 'edit::update', 'sql::upd', '2023-10-01 16:45:07'),
(242, 'edit::create', 'db::cols_r', '2023-10-01 16:45:07'),
(243, 'edit::create', 'form::call', '2023-10-01 16:45:07'),
(244, 'edit::create', 'sql::read', '2023-10-01 16:45:07'),
(245, 'edit::edit', 'db::cols_r', '2023-10-01 16:45:07'),
(246, 'edit::edit', 'form::call', '2023-10-01 16:45:07'),
(247, 'edit::edit', 'sql::read', '2023-10-01 16:45:07'),
(248, 'edit::play', 'build::tabler', '2023-10-01 16:45:07'),
(249, 'edit::play', 'db::cols_k', '2023-10-01 16:45:07'),
(250, 'edit::play', 'sql::read', '2023-10-01 16:45:07'),
(251, 'edit::read', 'edit::entries', '2023-10-01 16:45:07'),
(252, 'edit::read', 'edit::menu', '2023-10-01 16:45:07'),
(253, 'edit::entries', 'db::cols_r', '2023-10-01 16:45:07'),
(254, 'edit::entries', 'sql::read', '2023-10-01 16:45:07'),
(255, 'edit::list', 'sql::call', '2023-10-01 16:45:07'),
(256, 'edit::call', 'edit::read', '2023-10-01 16:45:07'),
(257, 'edit::call', 'edit::list', '2023-10-01 16:45:07'),
(258, 'form::call', 'form::build', '2023-10-01 16:45:07'),
(259, 'head::json', 'json::call', '2023-10-01 16:45:07'),
(260, 'head::relod', 'head::jscode', '2023-10-01 16:45:07'),
(261, 'head::run', 'head::html', '2023-10-01 16:45:07'),
(262, 'head::page', 'head::run', '2023-10-01 16:45:07'),
(263, 'head::call', 'head::build', '2023-10-01 16:45:07'),
(264, 'head::get', 'head::build', '2023-10-01 16:45:07'),
(265, 'img::imgthumb', 'img::thumb', '2023-10-01 16:45:07'),
(266, 'img::getim', 'img::thumb', '2023-10-01 16:45:07'),
(267, 'img::thumb', 'img::scale', '2023-10-01 16:45:07'),
(268, 'img::thumb', 'img::alpha', '2023-10-01 16:45:07'),
(269, 'jedt::addnew', 'json::file', '2023-10-01 16:45:07'),
(270, 'jedt::update', 'json::file', '2023-10-01 16:45:07'),
(271, 'jedt::create', 'form::call', '2023-10-01 16:45:07'),
(272, 'jedt::modif', 'jedt::update', '2023-10-01 16:45:07'),
(273, 'jedt::modif', 'json::call', '2023-10-01 16:45:07'),
(274, 'jedt::addrow', 'build::editable', '2023-10-01 16:45:07'),
(275, 'jedt::addrow', 'json::call', '2023-10-01 16:45:07'),
(276, 'jedt::edit', 'build::editable', '2023-10-01 16:45:07'),
(277, 'jedt::edit', 'jedt::artype', '2023-10-01 16:45:07'),
(278, 'jedt::edit', 'jedt::editxt', '2023-10-01 16:45:07'),
(279, 'jedt::edit', 'json::call', '2023-10-01 16:45:07'),
(280, 'jedt::savext', 'json::file', '2023-10-01 16:45:07'),
(281, 'jedt::editxt', 'json::file', '2023-10-01 16:45:07'),
(282, 'jedt::itermenu', 'jedt::itermenu', '2023-10-01 16:45:07'),
(283, 'jedt::menu', 'jedt::itermenu', '2023-10-01 16:45:07'),
(284, 'jedt::call', 'jedt::menu', '2023-10-01 16:45:07'),
(285, 'json::err', 'json::file', '2023-10-01 16:45:07'),
(286, 'json::err', 'json::error', '2023-10-01 16:45:07'),
(287, 'json::build', 'json::err', '2023-10-01 16:45:07'),
(288, 'json::call', 'json::file', '2023-10-01 16:45:07'),
(289, 'json::call', 'json::err', '2023-10-01 16:45:07'),
(290, 'login::uid', 'sql::read', '2023-10-01 16:45:07'),
(291, 'login::register', 'login::hash', '2023-10-01 16:45:07'),
(292, 'login::register', 'login::uid', '2023-10-01 16:45:07'),
(293, 'login::register', 'login::firstuser', '2023-10-01 16:45:07'),
(294, 'login::register', 'login::identify', '2023-10-01 16:45:07'),
(295, 'login::register', 'sql::sav', '2023-10-01 16:45:07'),
(296, 'login::firstuser', 'sql::read', '2023-10-01 16:45:07'),
(297, 'login::response', 'login::vrfpsw', '2023-10-01 16:45:07'),
(298, 'login::response', 'login::identify', '2023-10-01 16:45:07'),
(299, 'login::response', 'sql::read', '2023-10-01 16:45:07'),
(300, 'login::identify', 'sql::inner', '2023-10-01 16:45:07'),
(301, 'login::resetip', 'sql::read', '2023-10-01 16:45:07'),
(302, 'login::resetip', 'sql::upd', '2023-10-01 16:45:07'),
(303, 'login::recognize2', 'login::identify', '2023-10-01 16:45:07'),
(304, 'login::recognize2', 'sql::read', '2023-10-01 16:45:07'),
(305, 'login::recognize', 'login::identify', '2023-10-01 16:45:07'),
(306, 'login::call', 'login::form', '2023-10-01 16:45:07'),
(307, 'login::call', 'login::response', '2023-10-01 16:45:07'),
(308, 'login::call', 'login::loged', '2023-10-01 16:45:07'),
(309, 'login::port_register', 'login::register', '2023-10-01 16:45:07'),
(310, 'login::port_register', 'nav::call', '2023-10-01 16:45:07'),
(311, 'login::port_logout', 'login::logout', '2023-10-01 16:45:07'),
(312, 'login::port_logout', 'nav::call', '2023-10-01 16:45:07'),
(313, 'login::port', 'login::call', '2023-10-01 16:45:07'),
(314, 'login::port', 'nav::call', '2023-10-01 16:45:07'),
(315, 'sql::__construct', 'sql::dbq', '2023-10-01 16:45:07'),
(316, 'sql::rq', 'sql::dbq', '2023-10-01 16:45:07'),
(317, 'sql::qr', 'sql::rq', '2023-10-01 16:45:07'),
(318, 'sql::sqcl', 'db::cols_s', '2023-10-01 16:45:07'),
(319, 'sql::mkq', 'sql::where', '2023-10-01 16:45:07'),
(320, 'sql::prep', 'sql::rq', '2023-10-01 16:45:07'),
(321, 'sql::prep', 'sql::see', '2023-10-01 16:45:07'),
(322, 'sql::prep', 'sql::bind', '2023-10-01 16:45:07'),
(323, 'sql::read', 'sql::format', '2023-10-01 16:45:07'),
(324, 'sql::read', 'sql::where', '2023-10-01 16:45:07'),
(325, 'sql::read', 'sql::sqcl', '2023-10-01 16:45:07'),
(326, 'sql::read', 'sql::fetch', '2023-10-01 16:45:07'),
(327, 'sql::read', 'sql::prep', '2023-10-01 16:45:07'),
(328, 'sql::read2', 'sql::rq', '2023-10-01 16:45:07'),
(329, 'sql::read2', 'sql::format', '2023-10-01 16:45:07'),
(330, 'sql::read2', 'sql::sqcl', '2023-10-01 16:45:07'),
(331, 'sql::read2', 'sql::mkq', '2023-10-01 16:45:07'),
(332, 'sql::read2', 'sql::fetch', '2023-10-01 16:45:07'),
(333, 'sql::alex', 'db::cols_k', '2023-10-01 16:45:07'),
(334, 'sql::alex', 'sql::read', '2023-10-01 16:45:07'),
(335, 'sql::combine', 'db::cols_k', '2023-10-01 16:45:07'),
(336, 'sql::combine', 'sql::cols', '2023-10-01 16:45:07'),
(337, 'sql::integrity', 'db::cols_r', '2023-10-01 16:45:07'),
(338, 'sql::sav', 'sql::mkv', '2023-10-01 16:45:07'),
(339, 'sql::sav', 'sql::prep', '2023-10-01 16:45:07'),
(340, 'sql::sav', 'sql::alex', '2023-10-01 16:45:07'),
(341, 'sql::sav', 'sql::combine', '2023-10-01 16:45:07'),
(342, 'sql::sav', 'sql::integrity', '2023-10-01 16:45:07'),
(343, 'sql::sav', 'sql::complete', '2023-10-01 16:45:07'),
(344, 'sql::sav2', 'sql::mkv', '2023-10-01 16:45:07'),
(345, 'sql::sav2', 'sql::mkvq', '2023-10-01 16:45:07'),
(346, 'sql::sav2', 'sql::prep', '2023-10-01 16:45:07'),
(347, 'sql::upd', 'sql::where', '2023-10-01 16:45:07'),
(348, 'sql::upd', 'sql::mkvk', '2023-10-01 16:45:07'),
(349, 'sql::upd', 'sql::prep', '2023-10-01 16:45:07'),
(350, 'sql::inner', 'sql::qr', '2023-10-01 16:45:07'),
(351, 'sql::inner', 'sql::format', '2023-10-01 16:45:07'),
(352, 'sql::inner', 'sql::where', '2023-10-01 16:45:07'),
(353, 'sql::inner', 'sql::sqcl', '2023-10-01 16:45:07'),
(354, 'sql::inner', 'sql::see', '2023-10-01 16:45:07'),
(355, 'sql::inner', 'sql::fetch', '2023-10-01 16:45:07'),
(356, 'sql::inner', 'sql::prep', '2023-10-01 16:45:07'),
(357, 'sql::call', 'sql::qr', '2023-10-01 16:45:07'),
(358, 'sql::call', 'sql::format', '2023-10-01 16:45:07'),
(359, 'sql::call', 'sql::fetch', '2023-10-01 16:45:07'),
(360, 'sql::call2', 'sql::rq', '2023-10-01 16:45:07'),
(361, 'sql::call2', 'sql::fetch', '2023-10-01 16:45:07'),
(362, 'sql::com', 'sql::rq', '2023-10-01 16:45:07'),
(363, 'sql::cols', 'sql::call', '2023-10-01 16:45:07'),
(364, 'sql::ex', 'sql::read', '2023-10-01 16:45:07'),
(365, 'sql::backup', 'sql::qr', '2023-10-01 16:45:07'),
(366, 'sql::backup', 'sql::drop', '2023-10-01 16:45:07'),
(367, 'sql::backup', 'sql::ex', '2023-10-01 16:45:07'),
(368, 'str::eradic_acc', 'str::acc', '2023-10-01 16:45:07'),
(369, 'str::normalize', 'str::eradic_acc', '2023-10-01 16:45:07'),
(370, 'str::normalize', 'str::normalize_alpha', '2023-10-01 16:45:07'),
(371, 'str::normalize', 'str::normalize_ext', '2023-10-01 16:45:07'),
(372, 'str::clean_punctuation', 'str::clean_acc', '2023-10-01 16:45:07'),
(373, 'str::clean_punctuation', 'str::nicequotes', '2023-10-01 16:45:07'),
(374, 'str::nicequotes', 'str::clean_acc', '2023-10-01 16:45:07'),
(375, 'str::nicequotes', 'str::add_nbsp', '2023-10-01 16:45:07'),
(376, 'str::lowcase', 'str::acc', '2023-10-01 16:45:07'),
(377, 'str::lowercase', 'str::letcase', '2023-10-01 16:45:07'),
(378, 'str::clean_lines', 'str::clean_whitespaces', '2023-10-01 16:45:07'),
(379, 'str::clean_lines', 'str::trim', '2023-10-01 16:45:07'),
(380, 'str::trim', 'str::clean_whitespaces', '2023-10-01 16:45:07'),
(381, 'admin::pub', 'sql::read', '2023-10-01 16:45:07'),
(382, 'admin::pub', 'sql::upd', '2023-10-01 16:45:07'),
(383, 'admin::pub', 'admin::btswitch', '2023-10-01 16:45:07'),
(384, 'admin::bt', 'admin::btswitch', '2023-10-01 16:45:07'),
(385, 'admin::pending_tracks', 'build::tabler', '2023-10-01 16:45:07'),
(386, 'admin::pending_tracks', 'sql::inner', '2023-10-01 16:45:07'),
(387, 'admin::pending_tracks', 'admin::bt', '2023-10-01 16:45:07'),
(388, 'admin::pending_posts', 'build::tabler', '2023-10-01 16:45:07'),
(389, 'admin::pending_posts', 'sql::inner', '2023-10-01 16:45:07'),
(390, 'admin::pending_posts', 'admin::bt', '2023-10-01 16:45:07'),
(391, 'admin::appsmenu', 'admin::apps', '2023-10-01 16:45:07'),
(392, 'admin::user', 'build::tabs', '2023-10-01 16:45:08'),
(393, 'admin::user', 'dbedt::call', '2023-10-01 16:45:08'),
(394, 'admin::user', 'sql::read', '2023-10-01 16:45:08'),
(395, 'admin::call', 'contact::read', '2023-10-01 16:45:08'),
(396, 'admin::call', 'build::tabs', '2023-10-01 16:45:08'),
(397, 'admin::call', 'dbedt::call', '2023-10-01 16:45:08'),
(398, 'admin::call', 'jedt::menu', '2023-10-01 16:45:08'),
(399, 'admin::call', 'admin::pending_tracks', '2023-10-01 16:45:08'),
(400, 'admin::call', 'admin::pending_posts', '2023-10-01 16:45:08'),
(401, 'blocks::bkg', 'sql::read', '2023-10-01 16:45:08'),
(402, 'blocks::banner', 'view::call', '2023-10-01 16:45:08'),
(403, 'blocks::banner', 'sql::read', '2023-10-01 16:45:08'),
(404, 'blocks::shutter', 'tracks::call', '2023-10-01 16:45:08'),
(405, 'blocks::home', 'view::call', '2023-10-01 16:45:08'),
(406, 'blocks::home', 'conns::profile', '2023-10-01 16:45:08'),
(407, 'blocks::home', 'conns::socials', '2023-10-01 16:45:08'),
(408, 'blocks::call', 'blocks::forbidden', '2023-10-01 16:45:08'),
(409, 'blocks::call', 'blocks::secure', '2023-10-01 16:45:08'),
(410, 'boot::cnfg', 'json::call', '2023-10-01 16:45:08'),
(411, 'boot::call', 'db::install_all', '2023-10-01 16:45:08'),
(412, 'boot::call', 'login::recognize', '2023-10-01 16:45:08'),
(413, 'conns::connbt', 'json::call', '2023-10-01 16:45:08'),
(414, 'conns::btedt', 'conns::connbt', '2023-10-01 16:45:08'),
(415, 'conns::lnk_tm', 'conns::trademark', '2023-10-01 16:45:08'),
(416, 'conns::lnk', 'conns::lnk_tm', '2023-10-01 16:45:08'),
(417, 'conns::twalter', 'sql::read', '2023-10-01 16:45:08'),
(418, 'conns::youtube', 'build::iframe', '2023-10-01 16:45:08'),
(419, 'conns::youtube', 'conns::lnk_tm', '2023-10-01 16:45:08'),
(420, 'conns::list', 'build::mkli', '2023-10-01 16:45:08'),
(421, 'conns::numlist', 'build::mkli', '2023-10-01 16:45:08'),
(422, 'conns::art', 'sql::read', '2023-10-01 16:45:08'),
(423, 'conns::read', 'posts::content', '2023-10-01 16:45:08'),
(424, 'conns::read', 'sql::read', '2023-10-01 16:45:08'),
(425, 'conns::md', 'conn::parser', '2023-10-01 16:45:08'),
(426, 'conns::md', 'conn::embed_p', '2023-10-01 16:45:08'),
(427, 'conns::md', 'conv::md2conn', '2023-10-01 16:45:08'),
(428, 'conns::profile', 'posts::usrart', '2023-10-01 16:45:08'),
(429, 'conns::profile', 'sql::inner', '2023-10-01 16:45:08'),
(430, 'conns::socials', 'posts::usrart', '2023-10-01 16:45:08'),
(431, 'conns::socials', 'sql::read', '2023-10-01 16:45:08'),
(432, 'conns::socials', 'conns::lnk', '2023-10-01 16:45:08'),
(433, 'main::read', 'view::vars', '2023-10-01 16:45:08'),
(434, 'main::read', 'view::save_html', '2023-10-01 16:45:08'),
(435, 'main::read', 'view::com', '2023-10-01 16:45:08'),
(436, 'main::read', 'json::call', '2023-10-01 16:45:08'),
(437, 'main::read', 'blocks::call', '2023-10-01 16:45:08'),
(438, 'main::call', 'main::read', '2023-10-01 16:45:08'),
(439, 'nav::defaults', 'sql::inner', '2023-10-01 16:45:08'),
(440, 'nav::datas', 'json::call', '2023-10-01 16:45:08'),
(441, 'nav::datas', 'nav::defaults', '2023-10-01 16:45:08'),
(442, 'nav::call', 'view::call', '2023-10-01 16:45:08'),
(443, 'nav::call', 'nav::datas', '2023-10-01 16:45:08'),
(444, 'download::rednm', 'str::normalize', '2023-10-01 16:45:08'),
(445, 'download::call', 'download::rednm', '2023-10-01 16:45:08');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `cats`
--
ALTER TABLE `cats`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `profile`
--
ALTER TABLE `profile`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `socials`
--
ALTER TABLE `socials`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `tracks`
--
ALTER TABLE `tracks`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `twit`
--
ALTER TABLE `twit`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `_prog`
--
ALTER TABLE `_prog`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `_progr`
--
ALTER TABLE `_progr`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `cats`
--
ALTER TABLE `cats`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pour la table `contact`
--
ALTER TABLE `contact`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pour la table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT pour la table `profile`
--
ALTER TABLE `profile`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pour la table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `socials`
--
ALTER TABLE `socials`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `tracks`
--
ALTER TABLE `tracks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT pour la table `twit`
--
ALTER TABLE `twit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `_prog`
--
ALTER TABLE `_prog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=452;

--
-- AUTO_INCREMENT pour la table `_progr`
--
ALTER TABLE `_progr`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=446;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
