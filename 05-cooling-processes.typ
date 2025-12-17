#import "template.typ": *
#show: template

= Sehr coole Sachen

Motivation:
Wir haben Strategien gesehen um in RB und G Hackenbush den besten Zug zu finden. Aber wie sieht es aus, wenn wir die Spiele mischen?

Wir wollen jetzt herausfinden, wie sehr ein Zug dem jeweiligen Spieler hilft.

Aendert L durch seinen Zug die Spielposition von G zu G^L, dann aendert sich die Spielposition um G^L-G.
Umgekehrt kann R die Spielposition um G-G^R aendern. G^L-G jetzt _Vorteil_ fuer L. (Opportunity Cost)
TODO: Wir brauchen ein besseres Wort 

Raetsel: Berechnet den Vorteil einiger Zuege in Spielen die Zahlen sind.
Takeaway: Der Vorteil ist stehts negativ.

-> Der Grund dafuer ist, dass fuer x gilt x^L < x < x^R.

```
Raetsel: Berechnet den Vorteil einer Zuege in *3
Takeaway: Der Vorteil ist stehts positiv.
```

Theorem: DON'T MOVE IN A NUMBER UNLESS THERE'S NOTHING ELSE TO DO!


Weil niemand in der Zahl ziehen moechte, koennen wir im allgemeinen zu einem Spiel x addieren indem wir {G^L | G^R} + x = {G^L+x | G^R+x}
--> Das nennen wir _translation principle_.

Wir gucken uns das Spiel {2| -1} an.
TODO: hier vielleicht ein passendes RGB-Hackbush  finden.

{2 | -1}

~ Hier Wolken malen ~
TODO
  Stops sind die Enden der Wolke
  Warum funktioniert Cooling um den Mean zu finden?
