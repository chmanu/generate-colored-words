# generate-colored-words

Ce script permet de générer des images colorées à partir d'un texte :

```
  ./generate-colored-words.sh "HELLO WORLD AND CREATE NICE IMAGES"
```

donne :

![Hello](doc/word-1-HELLO.png)

![WORLD](doc/word-2-WORLD.png)

![AND](doc/word-3-AND.png)

![CREATE](doc/word-4-CREATE.png)

![NICE](doc/word-5-NICE.png)

![IMAGES](doc/word-6-IMAGES.png)


Dans les détails :
---

Chaque lettres est créée en lui apposant le motif, dans l'ordre des motifs (puis revient au premier motif).

Puis les mots sont créées ; la couleur du fond est, quant à elle, générée aléatoirement à partir d'une liste (qui peut être personnalisée dans le haut du script) ; ainsi, si la même couleur se suit, il est possible de relancer le script, vous aurez alors une autre combinaison concernant les couleurs de fond.

