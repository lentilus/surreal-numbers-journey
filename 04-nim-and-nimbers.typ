#import "template.typ": *
#import "hackenbush.typ": *
#show: template

= Getting Nimble with Nimbers

~ Es folgt kleine Wiederholung von Schiene 1 ~

== Regeln fuer RGB-Hackenbush
- Wir erweitern die bekannten RB-Hackenbush-Regeln.
- Es gibt jetzt auch _gruene_ Striche. Diese duerfen von beiden Spieler*innen entfernt werden

Wir haben in der ersten Schiene gesehen, dass wir nicht wirklich wissen was der Wert von
$#directed_hackenbush((("G", "B"),))$ ist.

Als wir das erste mal Addition fuer surreale Zahlen eingefuehrt haben,
haben Werte von Spielen bestimmt, indem wir zu anderen Spielen addiert haben,
sodass das die Summe ein $0$-Spiel ist. Darueber konnten wir Rueckschlueese auf
den Wert Spiels schliessen. Vielleicht koennen wir so den gruenen Stengel versuchen
zu verstehen.

#let single-green = directed_hackenbush((("G"),))
#let double-green = directed_hackenbush((("G"),("G")),)
#puzzle[Dem Gruenling auf die Schliche kommen][
  Wie kann man unseren mysterioesen gruenen Freund in eine Summe stecken, dessen Wert wir klar bestimmen kennen?
  $
  limits(#single-green)_"Der Gruenling"
  $
][
  Wir sehen, dass 2 _Gruenlinge_ 0 ergeben.
  $
  #double-green = 0
  $
]

Man koennte jetzt sagen, wenn zwei _Gruenlinge_ 0 ergeben, sollte der einzelne
_Gruenling_ auch 0 sein. Das wollen wir aber nicht, denn wir haben ja gesagt, dass
genau die 0-Spiele den Wert 0 haben sollen. Wenn man den _Gruenling_ aber ausspielt,
ist direkt klar, dass es sich hier nicht um ein 0-Spiel handelt.


Der _Gruenling_ pass also nicht ohne weiteres in unsere Vorstellung der Arithmetik surrealer Zahlen,
die wir letzte Schiene studiert haben. Die Idee ist, wir studieren jetzt erstmal
wie gruenes Hackenbush sich unter unserer Definition von Addition und Multiplikation verhaelt.
Dann koennen wir uns spaeter der etwas schwierigeren Aufgabe widmen, beide zusammen zu bringen
um zum Beipiel das Raetsel um die _Felix-Blume_ zu lueften.


Wir greifen jetzt auf die Strichnation zurueck, und sehen.

$
"Gruenling" = { 0 | 0}
$

Hier faellt uns direkt schon etwas auf, was bei RB-Hackenbush nicht so war.
Naemlich ist das, was links steht, nicht mehr strikt kleiner als das was rechts steht.
In diesem Detail liegt schon sehr viel der Struktur, die RGB-Hackenbush besonders macht verborgen.
Aber dazu spaeter mehr.

Jetzt schauen wir uns erstmal an was fuer Verwandte des Gruenlings es so gibt.

#let two-snake = directed_hackenbush((("G", "G"),))
#let three-snake = directed_hackenbush((("G", ("G", ("G"))),))
#let n-snake = directed_hackenbush((("G", ("G", ("...G", "G"))),))
$

  limits(... ... ... ...)_"0-Schlange"
  .. limits(#single-green)_("1-Schlange" \ "(Gruenling)")
  .. limits(#two-snake)_"2-Schlange"
  .. limits(#three-snake)_"3-Schlange"
  .. limits(#n-snake)_"n-Schlange"
$

Guecken wir uns gruene $n$-Schlangen an, erkennen wir den _Gruenling_ direkt als
$1$-Schlange und die $0$ als $0$-Schlange. Damit wir nicht mehr so viel Schreib-Arbeit haben,
schreiben fuehren wir Notation fuer $n$-Schlangen ein.
$
**0 &:= { " " | " "} = 0 \
**1 &:= { **0 | **0} = 0 \
**2 &:= { **0, **1 | **0, **1 } = 0 \
& dots.v \
**n &:= { **0, **1, ... , **(n-1) | **0, **1, ..., **(n-1) } = 0
$

Fuer $**1$ schreiben wir auch einfach nur $**$.


#puzzle[Rechnen, rechnen, rechnen][
  Was sind die Ergebnisse der folgenden Summen? Tipp: Am besten benutzt ihr direkt die _Strichnotation_, dass ist einfacher, als wenn ihr die Spiele spielt.
  $
    ** + **2, .. **3 + **5, .. **3 + **6, .. **5 + **6
  $
][
  $
    ** + **2 = **3, .. **3 + **5 = **6, .. **3 + **6 = **5, .. **5 + **6 = **3
  $
]

#puzzle[Gruene Induktion][
  Die Notation fuer $n$-Schlangen suggeriert, dass wir den Zahlenraum der
  $n$-Schlangen induktiv/rekursiv definieren koennen. Solche Objekte schreien nach Induktion.
  In Schiene 2 haben wir Induktion in verschiedenen Kontexten gesehen.
  Ueberlegt euch, wie ein Inuktionsbeweis fuer eine Aussage ueber $n$-Schlangen aussehen muesste
  und zeigt damit die folgenden Aussagen.
  - #comment[Hier fehlen jetzt ein paar lustige Aussagen]
  - #comment[...]
][
  - TODO 
]

Raetsel: Blume mit einem gruenen Staengel unten und unendlich vielen roten/blauen Blaettern.
A: Up / Down

Ratsel: Blume + Blume
Takeaway: Summe endlicher Spiele kann unendlich sein.

Nimber sind also irgendwie komisch, aber woran liegt das?
Was waren eure Strategien um die Werte der Summen auszurechnen?

~ Vielleicht ist allen schon klar, dass _something_ + _something_ = 0 ~
~ Dann kann man das naechste skippen ~

Raetsel: Was ist mit *16 + *4? A: 0.

Takeaway (nicht formal gezeigt): Nimbers sind Koerper mit Charakteristik 2.

Ein Beispiel fuer ein Spiel wo Nimber auftauchen ist Nim:
Nim: Mehrere Stapel mit Muenzen.

Regeln (so grob)
------
1. Abwechselnde Zuege beider Spieler
2. Ein Zug ist: Einen Stapel um beliebige Anzahl Muenzen kleiner machen
3. Wer nicht ziehen kann verliert.

~ Leute kurz Nim spielen lassen, damit sie sehen, dass es genau wie G-Hackenbush ist ~

Nimber tauchen ueberall auf, wo beide Spieler die gleichen Zuege machen koennen.
Nimb-Arithmetik erlaubt uns solche Spiele, oder solche Teile von Spielen zu untersuchen.

~ Hier moeglicherweise noch mehr Spiele Erwaehnen, die Nimber beherbergen ~

Noch ein Nim Raetsel
Raetsel: (\*Omega)³ = \*2 (ansonsten analoges raetsel)
Note: Omega^3 haben wir nicht definiert, stattdessen denke an Omega-Cube aus "Spiel".

Wir untersuchen jetzt systematisch Baeume

```
Raetsel: Wie ist der Wert von
    G G
  G G G
    G
 ___G___?
```
Antwort: Muss nachrechnen.

Siehe auch
- https://math.stackexchange.com/questions/4834066/what-cut-should-be-made-in-a-green-hackenbush-game-after-solving-its-correspondi
- Winning Ways p. 191

Noch offen : Circle collapsing und Fusion Principle (Winning Ways p. 193)
