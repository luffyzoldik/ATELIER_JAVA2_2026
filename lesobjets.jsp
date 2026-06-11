<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>
<title>Les objets</title>
</head>
<body bgcolor=white>
<h1>Exercices sur les objets</h1>
<form action="#" method="post">
    <p>Saisir un nom : <input type="text" name="nom">
    <p>Saisir un âge : <input type="text" name="age">
    <p><input type="submit" value="Créer la personne">
</form>

<%-- Déclaration de toutes les classes Java --%>
<%!
    // Exercice 1 : La classe Voiture
    class Voiture {
        String marque;
        String modele;
        int annee;
    }

    // Exercice 2 : La classe Personne standard (sans encapsulation)
    class Personne {
        String nom;
        int age;

        public String seDecrire() {
            return "Je m'appelle " + nom + " et j'ai " + age + " ans.";
        }
    }

    // Exercice 3 : La classe Rectangle
    class Rectangle {
        double longueur;
        double largeur;

        public double calculerSurface() {
            return longueur * largeur;
        }
    }

    // Exercice 4 : La classe CompteBancaire
    class CompteBancaire {
        double solde;

        public void deposer(double montant) {
            solde += montant;
        }

        public void retirer(double montant) {
            solde -= montant;
        }
    }

    // Exercice 5 : La classe Personne modifiée avec encapsulation
    class PersonneEncapsulee {
        // Attributs privés
        private String nom;
        private int age;

        // Getters et Setters
        public String getNom() { return nom; }
        public void setNom(String nom) { this.nom = nom; }
        public int getAge() { return age; }
        public void setAge(int age) { this.age = age; }
    }
%>

<%-- Récupération des valeurs du formulaire --%>
<% 
    String nom = request.getParameter("nom"); 
    String age = request.getParameter("age"); 
%>

<% if (nom != null && age != null && !nom.isEmpty() && !age.isEmpty()) { %>

<h2>Exercice 1 : La classe Voiture</h2>
<p>Créer une classe <code>Voiture</code> avec les attributs <code>marque</code>, <code>modele</code> et <code>annee</code>.</br>
Instancier une voiture, lui affecter des valeurs et afficher ses caractéristiques.</p>
<%
    Voiture v = new Voiture();
    v.marque = "Peugeot";
    v.modele = "208";
    v.annee = 2022;
%>
<p>Affichage : Voiture de marque <%= v.marque %>, modèle <%= v.modele %>, sortie en <%= v.annee %>.</p>

<h2>Exercice 2 : Ajouter une méthode à la classe Personne</h2>
<p>Ajouter à la classe <code>Personne</code> une méthode <code>seDecrire()</code> qui retourne une chaîne du type :</br>
"Je m'appelle Marie et j'ai 25 ans".</br>
Appeler cette méthode sur l'objet <code>p</code> et afficher le résultat.</p>
<% 
    // Instanciation de la classe Personne de l'exercice 2 (accès direct aux attributs)
    Personne p = new Personne(); 
    p.nom = nom; 
    p.age = Integer.parseInt(age); 
%>
<p>Affichage : <%= p.seDecrire() %></p>

<h2>Exercice 3 : La classe Rectangle</h2>
<p>Créer une classe <code>Rectangle</code> avec les attributs <code>longueur</code> et <code>largeur</code>.</br>
Ajouter une méthode <code>calculerSurface()</code> qui retourne la surface du rectangle.</br>
Créer un rectangle de 5 par 3 et afficher sa surface.</p>
<%
    Rectangle rect = new Rectangle();
    rect.longueur = 5;
    rect.largeur = 3;
%>
<p>Affichage : La surface du rectangle (5 x 3) est de : <%= rect.calculerSurface() %></p>

<h2>Exercice 4 : Le compte bancaire</h2>
<p>Créer une classe <code>CompteBancaire</code> avec un attribut <code>solde</code>.</br>
Ajouter deux méthodes : <code>deposer(double montant)</code> et <code>retirer(double montant)</code>.</br>
Créer un compte, déposer 100€, retirer 30€, puis afficher le solde final.</p>
<%
    CompteBancaire compte = new CompteBancaire();
    compte.solde = 0;
    compte.deposer(100);
    compte.retirer(30);
%>
<p>Affichage : Solde final après opérations : <%= compte.solde %> €</p>

<h2>Exercice 5 : L'encapsulation</h2>
<p>Modifier la classe <code>Personne</code> pour rendre les attributs <code>privés</code>.</br>
Ajouter les getters et setters correspondants : <code>getNom()</code>, <code>setNom(...)</code>, <code>getAge()</code>, <code>setAge(...)</code>.</br>
Adapter ensuite le code de la page pour utiliser ces accesseurs au lieu d'accéder directement aux attributs.</p>
<%
    // Instanciation de la nouvelle classe encapsulée dédiée à l'exercice 5
    PersonneEncapsulee pEncaps = new PersonneEncapsulee();
    pEncaps.setNom(nom);
    pEncaps.setAge(Integer.parseInt(age));
%>
<p>Affichage : Utilisation des méthodes d'accès -> Nom : <strong><%= pEncaps.getNom() %></strong>, Âge : <strong><%= pEncaps.getAge() %> ans</strong>.</p>

<% } %>
<p><a href="index.html">Retour au sommaire</a></p>
</body>
</html>
