---
name: veille
description: Faire un tour de veille techno sur les sujets de sources.md et écrire le rapport du jour dans veille/. À utiliser quand [Prénom] demande sa veille ou quand le heartbeat l'appelle.
---

# Veille

Repère ce qui a changé et qui mérite l'attention de [Prénom] sur les sujets de `sources.md`. Peu, mais juste : 3 à 5 items, jamais de remplissage. S'il n'y a rien de notable, dis-le en une ligne.

1. Relis `sources.md`.
2. Lis les rapports des 7 derniers jours dans `veille/` pour ne pas répéter un sujet déjà traité.
3. Cherche avec WebSearch et WebFetch. Préfère les sources primaires : changelog, release notes, blog officiel, RFC.
4. Écris `veille/AAAA-MM-JJ.md`. Pour chaque item :
   - **Titre**, avec le lien vers la source primaire
   - Ce qui change, en une phrase.
   - Pourquoi ça le concerne, en une phrase, ou « à surveiller » si c'est trop tôt pour le dire.
5. Envoie à [Prénom] une notification push avec les titres des items.
