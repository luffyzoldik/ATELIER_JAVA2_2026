<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>
<title>Les constructeurs</title>
</head>
<body bgcolor=white>
<h1>Exercices sur les constructeurs</h1>
<form action="#" method="post">
    <p>Saisir un titre de livre : <input type="text" name="titre">
    <p>Saisir un auteur : <input type="text" name="auteur">
    <p><input type="submit" value="Créer les livres">
</form>

<%!
    class Livre {
        String titre;
        String auteur;

        public Livre() {
            this.titre = "Titre inconnu";
            this.auteur = "Auteur inconnu";
        }

        public Livre(String titre, String auteur) {
            this.titre = titre;
            this.auteur = auteur;
        }
    }

    class Etudiant {
        String nom;
        double note;

        public Etudiant() {
            this("Anonyme", 10);
        }

        public Etudiant(String nom) {
            this.nom = nom;
            this.note = 10;
        }

        public Etudiant(String nom, double note) {
            this.nom = nom;
            this.note = note;
        }

        public Etudiant(Etudiant autreEtudiant) {
            this.nom = autreEtudiant.nom;
            this.note = autreEtudiant.note;
        }
    }

    class Produit {
        double prix;

        public Produit(double prix) {
            if (prix < 0) {
                this.prix = 0;
            } else {
                this.prix = prix;
            }
        }
    }
%>

<% 
    String titre = request.getParameter("titre"); 
    String auteur = request.getParameter("auteur"); 
%>

<% if (titre != null && auteur != null) { %>

    <% 
        Livre livreVide = new Livre(); 
        Livre livrePlein = new Livre(titre, auteur); 
    %>

    <p>Livre créé via le constructeur par défaut :</p>
    <p>Titre : <%= livreVide.titre %> - Auteur : <%= livreVide.auteur %></p>

    <p>Livre créé via le constructeur avec paramètres :</p>
    <p>Titre : <%= livrePlein.titre %> - Auteur : <%= livrePlein.auteur %></p>

<h2>Exercice 1 : Le constructeur par défaut</h2>
<p>Créer une classe <code>Etudiant</code> avec un constructeur par défaut qui initialise :</br>
- l'attribut <code>nom</code> à "Anonyme"</br>
- l'attribut <code>note</code> à 10.</br>
Instancier un étudiant avec ce constructeur et afficher ses informations.</p>
<%
    Etudiant e1 = new Etudiant();
%>
<p><strong>Résultat :</strong> Étudiant 1 -> Nom : <%= e1.nom %>, Note : <%= e1.note %>/20</p>

<h2>Exercice 2 : La surcharge de constructeurs</h2>
<p>Ajouter à la classe <code>Etudiant</code> deux autres constructeurs :</br>
- un constructeur prenant uniquement le <code>nom</code> en paramètre (la note vaut 10 par défaut),</br>
- un constructeur prenant le <code>nom</code> et la <code>note</code> en paramètres.</br>
Créer 3 étudiants avec les 3 constructeurs et afficher leurs informations.</p>
<%
    Etudiant exo2_e1 = new Etudiant(); 
    Etudiant exo2_e2 = new Etudiant("Lucas"); 
    Etudiant exo2_e3 = new Etudiant("Marie", 15); 
%>
<ul>
    <li>Étudiant avec constructeur par défaut : Nom = <%= exo2_e1.nom %>, Note = <%= exo2_e1.note %></li>
    <li>Étudiant avec constructeur (nom) : Nom = <%= exo2_e2.nom %>, Note = <%= exo2_e2.note %></li>
    <li>Étudiant avec constructeur (nom, note) : Nom = <%= exo2_e3.nom %>, Note = <%= exo2_e3.note %></li>
</ul>

<h2>Exercice 3 : Chaîner les constructeurs avec this()</h2>
<p>Dans la classe <code>Etudiant</code>, modifier le constructeur sans paramètre pour qu'il appelle le constructeur à deux paramètres avec <code>this("Anonyme", 10)</code>.</br>
Cela évite la duplication du code d'initialisation.</p>
<p><strong>Résultat :</strong> Validé. Le constructeur par défaut de la classe <code>Etudiant</code> utilise le chaînage <code>this("Anonyme", 10)</code> pour déléguer sa logique au troisième constructeur.</p>

<h2>Exercice 4 : Le constructeur de copie</h2>
<p>Ajouter à la classe <code>Etudiant</code> un constructeur qui prend en paramètre un autre objet <code>Etudiant</code> et recopie ses attributs.</p>
<%
    Etudiant source = new Etudiant("Marie", 15);
    Etudiant copie = new Etudiant(source);
%>
<p><strong>Résultat :</strong> L'étudiant copié possède les mêmes données. Nom : <%= copie.nom %>, Note : <%= copie.note %>/20.</p>

<h2>Exercice 5 : Valider les paramètres dans le constructeur</h2>
<p>Créer une classe <code>Produit</code> avec un attribut <code>prix</code> (double).</br>
Dans le constructeur, refuser un prix négatif : si <code>prix &lt; 0</code>, forcer la valeur à 0.</br>
Tester avec un produit créé à -50€ et afficher son prix réel.</p>
<%
    Produit monProduit = new Produit(-50.0);
%>
<p><strong>Résultat :</strong> Prix saisi : -50€ -> Prix final enregistré dans l'objet : <strong><%= monProduit.prix %> €</strong></p>

<% } %>
<p><a href="index.html">Retour au sommaire</a></p>
</body>
</html>
