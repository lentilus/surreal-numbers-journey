#import "template.typ": *
#import "hackenbush.typ": *
#show: template

= Sehr coole Sachen \ _Mixed Games_

#orga[
  In dieser Schiene wollen wir endlich unsere Ueberlegungen zu _G-Hackenbush_ und _RB-Hackebush_
  zusammenfuehren. Dafuer werden viele neue Begriffe einfuehren. In diesem Abschnitt orientieren wir uns ziemlich nah an
  _Winning Ways for your mathematical Plays_. Offebar hatten die Authoren grossen Spass
  bei der Bennenung der Objekte in diesem Kapitel unserer Reise!

  Wenn ihr mal vergessen habt, was jetzt nochmal genau _Steuern_ waren und wie wir die _Temperatur_ von einem Spiel messen -- fragt wie immer einfach nach!
]

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

== Where do I move?

Wie sieht es jetzt mit Spielen aus, die die Summe verschiedener Arten von Spielen sind? Also z.B. RGB-Hackenbush als zusammensetzung von RB- und G-Hackenbush.
Gehen wir einen Schritt zurueck und erinnern uns, wie wir RB-Hackenbush formal beschrieben haben. Wenn $x$ der Wert eines RB-Hackenbush-Spiels ist, dann ist $x$ durch _Simplicity_ eindeutig durch $x^L$ und $x^R$ bestimmt. Insbesondere ist $x^L < x < x^R$. Zieht ein Spieler in dem RB-Teil kann sich der Wert von $x$ also nur verschlechtern.

Das motiviert das _Number Avoidance Theorem_
#quote(attribution: [Conway])[
  DON'T MOVE IN A NUMBER UNLESS THERE'S NOTHING ELSE TO DO!
]

Wir werden jetzt haeufiger Spiele dessen Werte surreale Zahlen sind, _Zahlen_,
oder numerische Spiele nennen, um sie von Spielen mit _fuzzy_ Werten abzugrenzen.

Wir wollen jetzt herausfinden, wie sehr ein Zug dem jeweiligen Spieler hilft.
Aendert L durch seinen Zug die Spielposition von $G$ zu $G^L$, dann aendert sich die Spielposition um $G^L-G$.
Umgekehrt kann R den Wert des Spiels um $G-G^R$ aendern.

#definition[
  Wir nennen $G^L-G$ jetzt _Links-Anreiz_ und
  $G-G^R$ _Rechts-Anreiz_ von $G$
  In der Literatur heisst der Anreiz _Incentive_.
]

#puzzle[][
  Was faellt euch auf bei Anreizen in RB-Hackenbush-Spielen?
][
  Sie sind alle negativ.
]

Wir koennen jetzt fuzzy-Spiele um eine Zahl "verschieben".

#thm[
  Ist $G = {G^L | G^R }$ keine Zahl, aber $x$ schon, dann ist
  $
    {G^L|G^R} + x = {G^L + x | G^R +x}
  $

  *Beweis.* Wir wissen, dass
  $
  G +x = {G^L + x, G + x^L | G^R + x, G + x^R}
  $
  Wegen des _Number-Avoidance-Theorems_ wissen wir, dass $G^L +x$ und $G^R +x$ dominieren.
]

== Stops and Confusion

Wir spielen jetzt Spiele bis alle Komponenten Zahlen sind.
Wir sagen dann, das Spiel stoppt.

Wir definieren jetzt die _Stops_ eines Spiels $G$ anhand dieses Beispiels.

Gucken wir uns $G = { {3 | 2} | -1, 0, 1}$

Faengt $L$ an, stoppt das Spiel bei dem Wert $2$,
und $L$ waere jetzt am Zug, dann schreiben wir
$
 L(G) = L(2).
$

Faengt $R$ an, stoppt das Spiel bei dem Wert $0$ und $L$ waere als naechstes am Zug, wir schreiben
$
 R(G) = L(0).
$

#orga[
  Hier kann man jetzt wunderbar eine Wolke mit den entsprechenden Stopps an das Flipchart malen.
]

Die Wolke zeigt uns welches Intervall an Zahlen mit $G$ verwechselt wird.

#let down = $arrow.b$
#let starr = $**$
#let up = $arrow.t$

#puzzle[][
   Wie sind die Stopps dieser Spiele
   $
     down = { {0 | 0} | 0} .. .. starr = {0 | 0} .. .. up = { 0 | {0 | 0}}
   $
][
  $
  L(down) = R(down) = L(0); .. L(starr) = R(0), R(starr) = L(0); .. L(up) = R(up) = R(0)
  $

  Das ist irgendwie spannend, denn die Intervalle mit denen die obigen Spiele verwechselt werden haben verschwindende "Laenge".
]

#definition[
  Solche Spiele nennen wir jetzt _infinitesimal_.
  verwechselsungsintervalle mit nicht-verschwindender Laenge nennen wir _large_.
]

== Cooling and Taxing

Spiele, die mit einem _large_ Interval verwechselt werden nennen wir jetzt hot.

Wir wollen jetzt heisse Spiele abkuehlen, damit wir sie besser anfassen koennen.

- mean and temperature

== Thermographs
#todo[use screenshots from winning ways here?]

== Comparing Games
- compare games by mean and temperature



NOTES
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


