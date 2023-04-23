# MyGest_IOnR
Bonjour et bienvenu dans la présentation de notre projet MyGest_Ion’R.
Premièrement, nous allons expliquer les grandes lignes du projet, puis nous rentreront plus en détail sur le fonctionnement du groupe et enfin, nous parleront de l’utilité du projet.

Le but du projet était de faciliter la vie des techniciens réseaux en concevant un outil capable de faire une partie du travail à notre place.
Dans ce projet, il est possible de consulter des informations sur le parc informatique, comme le nom, l’id ou l’adresse mac des machines par exemple.
Il est aussi possible de tester des adresses IP, des ports TCP ou encore de consulter les IP actives. 
Enfin, il est possible d’installer les outils utiles à un technicien réseau, comme le SSH ou le FTP, en appuyant sur une seule touche, sans connaître chaque commande et sans utiliser l’invité de commande ou le shell.
Ce projet nous sera utile, en tant qu’élève, mais aussi en tant que technicien confirmé, dans le futur.


Le fonctionnement du groupe

Avec Tristan Jodry, nous avons décidé de s’attribuer les taches en fonction des facilités de chacun, tout en respectant un équilibre, en faisant 50%-50% du travail.
Pour cela, voici notre répartition des taches :

Valentin Kaldé :

Partie 1, Mission 3
Partie 2, Mission 1, 2, 3
Partie 4 
Partie 5 
Tristan Jodry :

Partie 1, Mission 1, 2, 4
Partie 2, Mission 4
Partie 3
Partie 5 

De mon côté, j’ai réalisé une bonne partie des outils réseaux, mais peu de base de donnée.
Du sien, c’est plutôt l’inverse.

A cela s’ajoutent les personnalisations, que j’ai moi même réalisé, en réorganisant l’hygiène des dossiers, en ajoutant des titres en couleur, en affichant des messages d’informations et des conseils pour l’utilisateur qui lancerait pour la première fois MyGest_Ion’R.

S’ajoute aussi l’automatisation du lancement des outils, réalisée par Tristan, utile pour faire gagner du temps à l’utilisateur.   

La plus grosse partie de mon travail s’est faite dans la réalisation de programmes permettant l’installation de logiciels ou de fonctionnalités utiles à l’utilisateur et indispensables à un administrateur réseau, comme Putty, Wireshark, SSH, FTP.

Enfin, j’ai moi-même réalisé ce fichier texte, qui a pour but de présenter le projet. 


L’utilité du projet.

Imaginons. Vous êtes technicien réseau, responsable d’un parc informatique de 50 machines 
Après une heure de travail, on vient vous avertir qu’une machine est déconnectée d’internet, vous devez donc trouver le souci et le régler en peu de temps, afin de ralentir au minimum le travail des salariés.
Si vous aviez cet outil et que vous l’aviez lancé en arrivant au matin, vous auriez détecté la panne en quelques clics, et cela vous aurait laissé le temps de trouver le souci et de le régler, sans ralentir le travail des employés. A vrai dire, ils ne l’auraient même pas remarqué étant donné qu’il aurait été réglé avant même leur arrivée. 

Cet exemple en est un parmi tant d’autres, les possibilités de ce projet sont infinies et les mises à jour continues contenant des nouveaux outils font de lui un excellent support pour le technicien informatique, aussi bien novice que confirmé.  


--------------------------------------------------------------------------------------------------------------------------------------------------------------------


# VOICI LES FONCTIONNALITÉS que j'ai moi même développé :


# Pour commencer, en entrant dans myGest_IonR, il est possible d’accéder aux outils réseaux. Ces outils proposent les fonctionnalités suivantes : 
- Tester une adresse IP
- Tester un port TCP
- Consulter les IP actives dans le parc informatique ( préalablement renseigné )
- Générer un fichier texte a partir de la base de donnée

![image](https://user-images.githubusercontent.com/129487278/233841060-702497b3-1e17-473f-ba94-2ce3712c2454.png)

# Voici un test d’adresse IP. On rentre une adresse, l’outil envoie une requête. Si l’adresse répond au ping, « L’adresse IP répond aux pings » s’affiche. Sinon, « L’adresse IP ne répond pas aux pings » s’affiche.

![image](https://user-images.githubusercontent.com/129487278/233841086-fae6a32d-6915-4a02-96ca-fd335e7e0f36.png)

# Voici un test de port. Ici, on rentre une IP, puis un port TCP. L’outil envoie une requête. 
Si le port est ouvert sur l’adresse IP renseignée, «Le port TCP est ouvert sur l’adresse IP» s’affiche. Sinon, « Le port TCP est fermé sur l’adresse IP » s’affiche.

![image](https://user-images.githubusercontent.com/129487278/233841103-f549d47f-0666-48f4-9af3-962482d12e98.png)

# Ici, on va afficher les IP actives dans le parc informatique. Pour cela, il faut renseigner les adresses IP du parc informatique dans la base de donnée. Une fois cela fait, il reste à sélectionner l’option 3 des outils réseaux et celui-ci va tester les IP actives.
Si une adresse est active, elle va s’afficher en vert. Si elle est inactive, elle s’affichera en rouge.

![image](https://user-images.githubusercontent.com/129487278/233841124-f32be8af-a45e-4c6f-b28a-24d064073a8d.png)

# Pour terminer avec les outils réseaux, on peut afficher le contenu de la base de donnée, avec les filtres sélectionnés ( l’ID, le nom ou l’IP par exemple).
Pour cela, on sélectionne l’option 4 et un tableau de la base de donnée s’affiche.

![image](https://user-images.githubusercontent.com/129487278/233841161-6cbeb951-743a-40ef-9a41-6b32e9c28430.png)

# A part les outils réseau, il est possible d’installer des extensions, des logiciels et des protocoles essentiels à l’administrateur réseau : Parmi eux, on peut citer le FTP, le SSH, Wireshark ou encore Putty.

![image](https://user-images.githubusercontent.com/129487278/233841170-c94125fc-41af-4fc6-8452-0f683112ea46.png)

# Pour toutes ces fonctionnalités, c’est la même démarche : On sélectionne l’outil voulu, et le logiciel se charge d’installer les paquets adéquats :

![image](https://user-images.githubusercontent.com/129487278/233841212-ad46b10e-2bed-4bae-bf81-54fb139fda4f.png)

![image](https://user-images.githubusercontent.com/129487278/233841218-2283249c-65e9-43e3-93cb-405b0e72ed91.png)

![image](https://user-images.githubusercontent.com/129487278/233841222-1b53e5fe-d8ab-4f85-9c61-bfd0301d0654.png)

# Enfin, on peut simplement choisir de quitter l’outil en sélectionnant l’option 0.

![image](https://user-images.githubusercontent.com/129487278/233841232-30b5555f-96e2-4a82-9fd0-48b51985a842.png)







