#import "template.typ": *
#import "hackenbush.typ": *
#show: template

= Konstruktion der Surrealen Zahlen

Wir bleiben erstmal bei Red-Blue Hackenbush.

#question[
  Wenn ihr eine Position habt, wie habt ihr herausgefunden, wer gewinnt? Also wer gewinnt zum Beispiel bei folgenden Spielen:

  #align(center, [
    #hackenbush(
      (
        (0, 0),
        (0, 1),
        (1, 1),
        (1, 0),
        (2, 1),
        (2, 0),
      ),
      (
        (0, 1, blue),
        (2, 3, blue),
        (1, 2, red),
        (4, 5, red),
      ),
    )
    #directed_hackenbush((("B", ("B", "R")), ("R", "B", "R"), ("B", "R", "R", "R")))
  ])
]

Wir bestimmen das Ergebnis rekursiv dadurch, indem wir schauen auf welche Spiele wir es zurück führen können. In welche Spielsituation kann der eine das Spiel überführen und in welche der andere?

Tatsächlich können wir den Wert einer Position komplett dadurch beschreiben, was die beiden Spieler machen können! Das heißt zwei Spiele, die man in dieselben Spiele überführen kann durch einen Zug subtrahieren sich zu $0$.

#example[
  Die Position $omega$

  #align(center, [#directed_hackenbush((("R", ("R", ("R", "...R"))),))])

  ist jene, welche Rot in eine Position des Wertes $n in NN$ umformen kann und wo Blau keinen Zug hat.
]

Zudem haben wir die folgende Eigenschaft:

#puzzle(
  [],
  [
    Git es eine Position für (oBdA.) Rot in der es vorteilhaft ist erst einen extra Zug zu machen und dann mit der neuen Position zu spielen als direkt anzufangen zu Spielen?
  ],
  [
    Nein! Sei $G$ ein Spiel und $G'$ ein Spiel was aus $G$ folgt, nachdem $G$ einen Zug gemacht hat. Schauen wir uns $G' - G$ an. Wenn blau anfängt kann es mit dem ersten Zug $-G$ in $-G'$ überführen und gewinnt damit als nun zweiter Spieler die Position $G' - G'$ durch einfach kopieren von Rots zügen. Also ist $G' <= G$ (angenommen unsere Arithmetik ergibt Sinn.)
  ],
)

#puzzle(
  [],
  [
    Gibt es eine Position sodass es Rot egal ist, ob es zuerst einen Zug macht?
  ],
  [
    Ja! Zum Beispiel folgende Position:

    #align(center, [

      #hackenbush(
        (
          (0, 0),
          (0, 1),
          (1, 0),
          (1, 1),
          (2, 0),
          (2, 1),
          (2.5, 0),
          (2.5, 1),
          (2.8, 0),
          (2.8, 1),
          (3, 0),
          (3, 1),
          (3.2, 0),
          (3.2, 1),
        ),
        (
          (0, 1, blue),
          (2, 3, red),
          (4, 5, red),
          (6, 7, red),
          (8, 9, red),
          (10, 11, red),
          (12, 13, red, "dashed"),
        ),
      )
    ])
  ],
)

- was ist ein Spiel?
- diese Spiele haben ein Problem: Summe von 2 SPielen ist kein Spiel
- wir wollen iterativ Spiele herstellen, wo wenn ein Spieler alleine sie spielen würde, dass sie irgendwann vorbei wären. Das heißt er maximal 0 dann 1, dann 2, ... dann omega..
- => wollen, dass es strikt besser ist keinen Zug zu machen (Summe...)


===

mit komplexität omega.. ... als...
definieren Induktiv.. ist wohldefiniert

Ordinalzahlen betten ein durch... {ordinal kleiner | größer }

Damit können wir surreal numbers wiefolgt definieren:

Jede surreale zahl ist einer Zahl X = { left | right }, sodass left und right Mengen von Surrealen zahlen sind, die früher entstanden sind.
sodass alles aus left < alles aus right

Eine Zahl ist kleiner gleich als eine andere Zahl, wenn alle linken zahlen des ersten kleiner gleich sind als die zweite Zahl und alle rechten des zweiten (echt) größer als die erste Zahl.
Zwei Zahlen sind gleich, falls jeweils <=

Beispiele: 0, 1, -1
Direkt zu Hackenbush mappen
Beispiel: 2 = ..
Beispiel: -1, 1

Man kann sich das auch formaler mit rekusiver Definition vorstellen:

Am ersten Tag entsteht 0
Am zweiten Tag entsteht dann -+1
Am dritten Tag ...
Was ist mit {1, -1}
Was ist mit {-1, 1}

Und am Omega Tag gibt es zB...
=> Die rellen Zahlen werden an Tag Omega geboren.

https://www.whitman.edu/Documents/Academics/Mathematics/Grimm.pdf

Rmk/Question: <= Transitiv

Wie definiert ihr Addition?
Und additive Inverse?

Question: Ein Paar positionen für surreale Zahlen finden

Rmk/Question: <= XL <= X <= XR
Finding the correct number is simplicity itself?
=> Die erste Zahl die entsteht die kleiner links und größer rechts ist.
Beweis?

Jetzt wollen wir un Multiplikation anschauen.

Erstmal an Hackenbush positionen
Q: Wie rechne ich ... mal drei? ... mal -1?

Wenn wir mehr machen wollen, müssen wir erstmal arbeiten. Aber wir schauen uns erstmal Stacks an:
Q: Jetzt habe ich so einen Stack.. welchen Wert hat der (3/4). Wie kann ich daraus einen Stack machen mit dem wert 3/8?
=> Stacks halbieren, mal vielfache rechnen..
A: Was passiert, wenn ich oben einer in einer Farbe drauf tue? (pm 1/2^n)

Q: Was ist Omega/2 in Hackenbush?
Q: Wie sieht Omega/2 als Surreale Zahl aus?

Aber im allgemeinen Zahlen mulitplizieren oder Teilen ist sehr schwer. Z.b 3*1 = 3, aber 1/3 ist sehr schlimm.
Also müssen wir uns den formalismus genauer anschauen.

Welche eigenschaften muss so eine Multiplikation haben?
- distributiv
- kommutativ
- unit
- 0
- sollte allgemeine Multiplikation verallgemeinern
- invertierbar
- wohldefiniert

Q: Herum experimentieren:
- vlt grafisch?
- vlt mit kleinen Zahlen?
- relle Zahlen ist auch doof

```
Q: Was ist Omega * epsilon?
(Als positionen)
A: 1!!!
```

Rmk: Es gibt auch inverse und wir bekommen einen Körper, aber Inverse sind so doof wie multiplikation.. Siehe reelle Zahlen.

Dieser Körper ist sehr groß (eine echte Klasse.) (Tatsächlich lässt sich jeder geordnete Körper - basierend auf einer Menge) - darin einbetten.
- wenn man ihn versteht, versteht man alle
- wenn man etwas für ih definiert, definiert man es für alle
- ...
- universelle Konstruktion

Wir wollen uns mal ein bisschen mit lustigen Unterkörpern beschäftigen. Fangen an mit
Hyperreals

Wir haben ja dieses Epsilon und wollen damit jetzt Dinge machen.


Warum machen wir das? Motivation: Ermoeglicht Rechnen mit Zahlen groesser als Omega, die konsistent mit uns bekannter multiplikation ist.
andere Motivation: Wir konnten nicht nur die reellen Zahlen in den surrealen recovern, sondern auch noch ihre struktur.
--> Haben also einen groesseren Zahlenraum geschaffen ohne Struktur zu verlieren (Sternchen: kein Kontinuum mehr)
Antworten:
- Objekte kennen lernen; damit andere Spiele analysieren können
- Transfinite Induktion => Anwenden auf konkrete Probleme, wie zB Nim Kreise (Multiplikation definieren)
-
DAS ist Mathematk. Wir nehmen irgendwelche Spielregeln. Und spielen.
=> Wir sollten das irgendwie noch benutzen

```
Rätsel: Epsilon * Omega (sehr toll)
?? Rätsel: Finde ein Bild für Omega x Omega
?? Rätsel: Find ein Bild für 1/2 Omega

=> Wir können damit Alles einbettern, Analysis machen, etc.
(Einziges Problem: Sehr viele Zahlen -> nicht die optimale Menge für manche Dinge)
```

zB: Hyperreals, Analysis
R + Epsilon => Definiere Limits, ...
Frage: Verallg. Reelle Zahlen?
- Addition, Negation (Fokus auf Herstellung aus vorher entstandenen Zahlen)
- Multiplikation... mit natürlichen /ganzen Zahlen
Raetsel: Binärdarstellung Stack
Raetsel: Wie teilt man einen Stack durch 2?
=> Es gibt keine tolle grafische Regel (units und nachkommastellen und separat)
- Formale Definition (mit transfiniter Induktion)
- evt. prüfen, dass es Definition erfüllt
- Zu tedious -- nicht machen: (Raetsel : Finde zu allg. Zahl ein inverses.)
- Es gibt Inverse => Körper; aber nicht schön

Warum machen wir das? Motivation: Ermoeglicht Rechnen mit Zahlen groesser als Omega, die konsistent mit uns bekannter multiplikation ist.
andere Motivation: Wir konnten nicht nur die reellen Zahlen in den surrealen recovern, sondern auch noch ihre struktur.
--> Haben also einen groesseren Zahlenraum geschaffen ohne Struktur zu verlieren (Sternchen: kein Kontinuum mehr)
Antworten:
- Objekte kennen lernen; damit andere Spiele analysieren können
- Transfinite Induktion => Anwenden auf konkrete Probleme, wie zB Nim Kreise (Multiplikation definieren)
-
DAS ist Mathematk. Wir nehmen irgendwelche Spielregeln. Und spielen.
=> Wir sollten das irgendwie noch benutzen

```
Rätsel: Epsilon * Omega (sehr toll)
?? Rätsel: Finde ein Bild für Omega x Omega
?? Rätsel: Find ein Bild für 1/2 Omega
```

=> Wir können damit Alles einbettern, Analysis machen, etc.
(Einziges Problem: Sehr viele Zahlen -> nicht die optimale Menge für manche Dinge)

zB: Hyperreals, Analysis
R + Epsilon => Definiere Limits, ...
