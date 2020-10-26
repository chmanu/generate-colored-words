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

Puis les mots sont créées ; la couleur du fond est, quant à elle, générée aléatoirement à partir d'une liste (qui peut être personnalisée dans le haut du script).

L'option -bg (à placer avant le texte à générer) permet d'éviter la recréation des lettres mais de ne regénérer que les mots (et leur fond) ; ceci permet notamment de modifier le fond lorsque le tirage aléatoire ne convient pas (plusieurs mots consécutifs avec la même couleur).
