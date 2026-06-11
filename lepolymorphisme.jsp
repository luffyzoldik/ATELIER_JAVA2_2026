<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>
<title>Le polymorphisme</title>
</head>
<body bgcolor=white>
<h1>Exercices sur le polymorphisme</h1>
<form action="#" method="post">
    <p>Saisir le nom d'un chien : <input type="text" name="chien">
    <p>Saisir le nom d'un chat : <input type="text" name="chat">
    <p><input type="submit" value="Faire crier les animaux">
</form>

<%!
    interface Affichable {
        String afficher();
    }

    class Animal implements Affichable {
        String nom;
        public Animal(String nom) { this.nom = nom; }
        public String crier() { return "..."; }
        
        @Override
        public String toString() {
            return "Animal nommé " + nom;
        }

        public String afficher() {
            return "Affichage : " + toString();
        }
    }

    class Chien extends Animal {
        public Chien(String nom) { super(nom); }
        public String crier() { return "Wouf wouf !"; }
        
        @Override
        public String toString() {
            return "Chien nommé " + nom;
        }
    }

    class Chat extends Animal {
        public Chat(String nom) { super(nom); }
        public String crier() { return "Miaou !"; }
        
        @Override
        public String toString() {
            return "Chat nommé " + nom;
        }
    }

    class Oiseau extends Animal {
        public Oiseau(String nom) { super(nom); }
        public String crier() { return "Cui cui !"; }
        
        @Override
        public String toString() {
            return "Oiseau nommé " + nom;
        }
    }

    abstract class Forme {
        public abstract double aire();
    }

    class Cercle extends Forme {
        double rayon;
        public Cercle(double rayon) { this.rayon = rayon; }
        public double aire() { return Math.PI * rayon * rayon; }
    }

    class Carre extends Forme {
        double cote;
        public Carre(double cote) { this.cote = cote; }
        public double aire() { return cote * cote; }
    }
%>

<% 
    String chien = request.getParameter("chien"); 
    String chat = request.getParameter("chat"); 
%>

<% if (chien != null && chat != null && !chien.isEmpty() && !chat.isEmpty()) { %>

    <% Animal[] animaux = { new Chien(chien), new Chat(chat), new Oiseau("Pipou") }; %>

    <p>Démonstration du polymorphisme :</br>
    Le tableau est déclaré <code>Animal[]</code>, mais c'est bien la méthode <code>crier()</code> de la sous-classe (Chien ou Chat) qui est appelée à l'exécution.</p>

    <% for (Animal a : animaux) { %>
        <p><%= a.nom %> dit : <%= a.crier() %></p>
    <% } %>

<h2>Exercice 1 : Redéfinir toString()</h2>
<p>Ajouter à la classe <code>Animal</code> et à ses sous-classes <code>Chien</code> et <code>Chat</code> une méthode <code>toString()</code> qui retourne par exemple :</br>
"Chien nommé Rex" ou "Chat nommé Felix".</br>
Afficher <code>a.toString()</code> pour chaque animal du tableau.</p>
<% for (Animal a : animaux) { %>
    <p><%= a.toString() %></p>
<% } %>

<h2>Exercice 2 : La classe abstraite Forme</h2>
<p>Créer une classe abstraite <code>Forme</code> avec une méthode abstraite <code>aire()</code>.</br>
Créer deux sous-classes :</br>
- <code>Cercle</code> avec un attribut <code>rayon</code>,</br>
- <code>Carre</code> avec un attribut <code>cote</code>.</br>
Implémenter <code>aire()</code> dans chacune. Créer un tableau de <code>Forme</code> contenant les deux et afficher leurs aires.</p>
<%
    Forme[] formes = { new Cercle(5.0), new Carre(4.0) };
%>
<% for (Forme f : formes) { %>
    <p>L'aire de cette forme est : <%= f.aire() %></p>
<% } %>

<h2>Exercice 3 : L'interface Affichable</h2>
<p>Créer une interface <code>Affichable</code> avec une méthode <code>afficher()</code>.</br>
Faire implémenter cette interface par <code>Chien</code> et <code>Chat</code>.</br>
Stocker un Chien et un Chat dans un tableau <code>Affichable[]</code> et appeler <code>afficher()</code> sur chacun.</p>
<%
    Affichable[] elements = { new Chien("Rex"), new Chat("Felix") };
%>
<% for (Affichable e : elements) { %>
    <p><%= e.afficher() %></p>
<% } %>

<h2>Exercice 4 : Ajouter un Oiseau</h2>
<p>Créer une nouvelle sous-classe <code>Oiseau</code> qui hérite de <code>Animal</code> et redéfinit <code>crier()</code> par "Cui cui !".</br>
L'ajouter dans le tableau d'animaux ci-dessus, <strong>sans modifier la boucle d'affichage</strong>.</br>
Constater que le code de la boucle continue de fonctionner : c'est tout l'intérêt du polymorphisme.</p>
<p>L'oiseau "Pipou" a été ajouté directement dans le tableau global <code>animaux</code> tout en haut de la page. Sa sortie s'affiche sans erreur dans la première boucle de démonstration.</p>

<h2>Exercice 5 : L'opérateur instanceof</h2>
<p>Dans la boucle qui parcourt les animaux, utiliser <code>instanceof</code> pour afficher un message spécifique :</br>
- "C'est un chien" si l'animal est un <code>Chien</code>,</br>
- "C'est un chat" si l'animal est un <code>Chat</code>,</br>
- "Autre animal" dans tous les autres cas.</p>
<% for (Animal a : animaux) { %>
    <p><%= a.nom %> : 
        <% if (a instanceof Chien) { %>
            C'est un chien
        <% } else if (a instanceof Chat) { %>
            C'est un chat
        <% } else { %>
            Autre animal
        <% } %>
    </p>
<% } %>

<% } %>
<p><a href="index.html">Retour au sommaire</a></p>
</body>
</html>
