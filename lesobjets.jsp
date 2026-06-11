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

<%-- Déclaration de toutes les classes Java requises --%>
<%!
    // Classe Voiture (Exercice 1)
    class Voiture {
        String marque;
        String modele;
        int annee;
    }

    // Classe Personne modifiée avec encapsulation (Exercice 2 & 5)
    class Personne {
        private String nom;
        private int age;

        // Méthode de description (Exercice 2)
        public String seDecrire() {
            return "Je m'appelle " + nom + " et j'ai " + age + " ans.";
        }

        // Accesseurs Getters et Setters (Exercice 5)
        public String getNom() { return nom; }
        public void setNom(String nom) { this.nom = nom; }
        public int getAge() { return age; }
        public void setAge(int age) { this.age = age; }
    }

    // Classe Rectangle (Exercice 3)
    class Rectangle {
        double longueur;
        double largeur;

        public double calculerSurface() {
            return longueur * largeur;
        }
    }

    // Classe CompteBancaire (Exercice 4)
    class CompteBancaire {
        double solde;

        public void deposer(double montant) {
            solde += montant;
        }

        public void retirer(double montant) {
            solde -= montant;
        }
    }
%>

<%-- Récupération des données du formulaire --%>
<% 
    String nom = request.getParameter("nom"); 
    String age = request.getParameter("age"); 
%>

<% if (nom != null && age != null && !nom.isEmpty() && !age.isEmpty()) { %>

    <%-- Création de l'objet principal Personne avec les setters --%>
    <% 
        Personne p = new Personne(); 
        p.setNom(nom); 
        p.setAge(Integer.parseInt(age)); 
    %>
    <p><em>Objet Personne de base initialisé avec succès via le formulaire.</em></p>

<h2>Exercice 1 : La classe Voiture</h2>
<p>Créer une classe <code>Voiture</code> avec les attributs <code>marque</code>, <code>modele</code> et <code>annee</code>.</br>
Instancier une voiture, lui affecter des valeurs et afficher ses caractéristiques.</p>
<%
    Voiture maVoiture = new Voiture();
    maVoiture.marque = "Peugeot";
    maVoiture.modele = "208";
    maVoiture.annee = 2022;
%>
<p><strong>Résultat :</strong> Voiture créée -> Marque : <%= maVoiture.marque %>, Modèle : <%= maVoiture.modele %>, Année : <%= maVoiture.annee %></p>

<h2>Exercice 2 : Ajouter une méthode à la classe Personne</h2>
<p>Ajouter à la classe <code>Personne</code> une méthode <code>seDecrire()</code> qui retourne une chaîne du type :</br>
"Je m'appelle Marie et j'ai 25 ans".</br>
Appeler cette méthode sur l'objet <code>p</code> et afficher le résultat.</p>
<p><strong>Résultat :</strong> <%= p.seDecrire() %></p>

<h2>Exercice 3 : La classe Rectangle</h2>
<p>Créer une classe <code>Rectangle</code> avec les attributs <code>longueur</code> et <code>largeur</code>.</br>
Ajouter une méthode <code>calculerSurface()</code> qui retourne la surface du rectangle.</br>
Créer un rectangle de 5 par 3 et afficher sa surface.</p>
<%
    Rectangle monRectangle = new Rectangle();
    monRectangle.longueur = 5;
    monRectangle.largeur = 3;
%>
<p><strong>Résultat :</strong> La surface d'un rectangle de 5x3 est de <%= monRectangle.calculerSurface() %></p>

<h2>Exercice 4 : Le compte bancaire</h2>
<p>Créer une classe <code>CompteBancaire</code> avec un attribut <code>solde</code>.</br>
Ajouter deux méthodes : <code>deposer(double montant)</code> et <code>retirer(double montant)</code>.</br>
Créer un compte, déposer 100€, retirer 30€, puis afficher le solde final.</p>
<%
    CompteBancaire monCompte = new CompteBancaire();
    monCompte.solde = 0;
    monCompte.deposer(100);
    monCompte.retirer(30);
%>
<p><strong>Résultat :</strong> Après un dépôt de 100€ et un retrait de 30€, le solde final est de <%= monCompte.solde %> €</p>

<h2>Exercice 5 : L'encapsulation</h2>
<p>Modifier la classe <code>Personne</code> pour rendre les attributs <code>privés</code>.</br>
Ajouter les getters et setters correspondants : <code>getNom()</code>, <code>setNom(...)</code>, <code>getAge()</code>, <code>setAge(...)</code>.</br>
Adapter ensuite le code de la page pour utiliser ces accesseurs au lieu d'accéder directement aux attributs.</p>
<p><strong>Résultat :</strong> Les attributs de la classe <code>Personne</code> ont été passés en <code>private</code>. L'accès aux données de l'objet <code>p</code> en haut de page s'effectue bien via <code>p.getNom()</code> (Valeur actuelle : <%= p.getNom() %>) et <code>p.getAge()</code> (Valeur actuelle : <%= p.getAge() %> ans).</p>

<% } %>
<p><a href="index.html">Retour au sommaire</a></p>
</body>
</html>
