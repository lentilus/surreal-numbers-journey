#import "template.typ": *
#import "hackenbush.typ": *
#show: template

= Sehr coole Sachen \ _Mixed Games_

== Jetzt aber wirklich RGB
#comment[
  TODO: Hier ist noch viel zu tun: Wie kommen wir jetzt von G-Hackenbush zu einer systematischen Theorie ueber RGB-Hackenbush? Maybe hier schon connection zu cooling processes aufzeigen.
]
Kommen wir von _G-Hackenbush_ zurueck zu _RGB-Hackenbush_.


#puzzle[Omega-Cube][
  #comment[Hier muss man noch sehr genau ueberlegen wie man dieses Raetse stellt damit man das ueberhaupt ausgerechnet bekommt]
][]

#puzzle[Blume mit vielen Blaetter][
  Wie ist der Wert dieser Blumen mit genau $omega$ vielen Blaettern?
  $
  limits(#directed_hackenbush(((
    "G", "B", "B", "B", "B", "B", "B", "B", "B", "B", "...B"
  ),)))_"(a)"

  limits(#directed_hackenbush(((
    "G", "R", "R", "R", "R", "R", "R", "R", "R", "R", "...R"
  ),)))_"(b)"

  limits(#directed_hackenbush((
    ("G", "B", "B", "B", "B", "B", "B", "B", "B", "B", "...B"),
    ( "G", "R", "R", "R", "R", "R", "R", "R", "R", "R", "...R")
  ),))_"(a) + (b)"
  
  $
][
  #comment[Notes sagen a und b waeren up bzw down, aber not so sure about that if I am honest]


  In der Summe (a) + (b) ist es fuer keinen Spieler von Vorteil, einen der Staemme abzuschneiden. Im naechsten Zug wuerde der andere Spieler den uebrigen Stamm kappen, und das Spiel gewinnen. Die Spieler beschneiden also bin in alle Ewigkeit die Blueten ihrer Blume.
  In anderen Worten: Die Summe endlicher Spiele kann unendlich sein.
]


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
