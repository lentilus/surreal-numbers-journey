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
    Nein! Sei $G$ ein Spiel und $G'$ ein Spiel was aus $G$ folgt, nachdem $G$ einen Zug gemacht hat. Schauen wir uns $G' - G$ an. Wenn Blau anfängt kann es mit dem ersten Zug $-G$ in $-G'$ überführen und gewinnt damit als nun zweiter Spieler die Position $G' - G'$ durch einfach kopieren von Rots zügen. Wenn nun Rot anfängt, kann Blau immer entweder den vorherigen Zug von Rot kopieren, oder den aktuellen Zug von Rot kopieren. Sobald der zweite Fall erreicht wird, gewinnt Blau offensichtlich. Wenn die ganze Zeit der erste Fall bleibt, kann man sich durch überlegen, das blau auch gewinnen kann, da immer von Rot einen Zug machen kann, Blau auch einen Zug machen kann - also Rot zuerst dran ist ohne einen Zug machen zu können.

    Also ist $G' <= G$.
  ],
)

#puzzle(
  [],
  [
    Gibt es eine Position sodass es Rot egal ist, ob es zuerst einen Zug macht?
  ],
  [
    Ja! Zum Beispiel folgende Position mit $omega$ roten Strichen nebeneinander:

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

Dieses letzte Spiel, nennen wir es $delta$ sieht etwas problematisch aus. Wir haben nämlich $delta - delta = "DUD"$ (Death of the Universe Draw). Wir erinnern und, dass letzteres kein Spiel ist, da jedes Spiel nach einer endlichen Anzahl Zügen vorbei sein muss. Wir können damit folgende Einschränkung machen:

Ab jetzt interessieren uns nur noch die Spiele, wo wenn nur ein Spieler immer Züge macht, er irgendwann keinen Zug mehr machen kann. Insbesondere ist es dann für Rot immer schlechter einen Zug zu machen als keinen Zug zu machen.

== Surreale Zahlen

Wir wollen jetzt induktiv definieren, was surreale Zahlen sind. Dafür benutzten wir unsere Ergebnisse über Hackenbush. Tatsächlich wird jede surreale Zahl auch eine zugehörige Hackenbush-Position haben.

Spiele sollen nur endlich lange dauern, egal wer anfängt. In der Tat sollen sie nur endlich lange dauern, wenn nur ein einziger Spieler spielt. Auf der anderen Seite, wollen wir auch Zahlen wie $omega$ zulassen:

#hackenbush(
  ((0, 0), (0, 1), (0, 2), (0, 3)),
  ((0, 1, red), (1, 2, red), (2, 3, red, "dashed")),
)

Es sind zwar unendlich viele Zeige, aber jeder Zug von Rot führt das Spiel auf ein kleineres Spiel zurück - eines mit endlich vielen Zweigen. Sowas haben wir ja schonmal bei den Ordinalzahlen gesehen!

Für jeden Tag (indiziert bei Ordinalzahlen) definieren wir eine Menge an surrealen Zahlen, die bis zu diesem Tag entstanden sind wiefolgt:

#axiom[
  Eine surreale Zahl $x$ besteht (bis auf Äquivalenz) aus zwei Mengen $x = {X_L | X_R}$  von surrealen Zahlen, die an einem früheren Tag entstanden sind, sodass alle Elemente aus der linken Menge $X_L$ kleiner sind als alle Elemente aus der rechten Menge $X_R$.

  $ forall l in X_L forall r in X_R : l < r $
]

#axiom[
  Eine surreale Zahl $x = { X_L | X_R }$ ist kleiner-gleich einer surrealen Zahl $y = { Y_L | Y_R }$ genau dann, wenn kein Element aus $X_L$ größer-gleich $y$ ist und keinem Element aus $Y_R$ kleiner-gleich $x$ ist:

  $ (forall l in X_L: not (l <= y)) and forall (r in Y_R : (not r <= x)) $

  Wir sagen $x = y$, falls $x <= y <= x$.
]

Am Tag $0$ ist damit die einzige surreale Zahl
$ 0 = { emptyset | emptyset } = {|}. $

Diese Definition ist ziemlich kompliziert, bzw. führt sehr leicht zu Kopfzerbrechen. Deswegen experimentieren wir erstmal ein bisschen herum, wie denn die ersten surrealen Zahlen aussehen:

#puzzle([Kleine Kinder], [Welche surreale Zahlen entstehenn bis zu Tag $1$ bzw. $2$?], [
  Wir wissen bereits, dass an Tag $0$ nur $0$ entsteht:
  $ 0 = {|}. $

  An Tag $1$ entstehen dann folgende Zahlen:
  $ 1 = {0|}, -1 = {|1} $

  An Tag $2$ entstehen weiter folgende Zahlen:
  $ 0 = {|}, quad 1 = {0|}, quad -1 = {|1} quad {1|} $
  $ {-1|} quad {0,1|} quad {0, -1|} quad {-1,1|} $
  $ {-1, 0, 1|} quad {|1} quad {|-1} quad {|0,1} $
  $ {|0,-1} quad {|-1,1} quad {|-1,0,1} quad {-1|0} $
  $ {-1|1} quad {-1|0} quad {0|1} quad {-1,0|1} $
])

#puzzle(
  [Vergleiche],
  [
    Was ist die richtige Reihenfolge der folgenden Zahlen:
    $ {|}, quad {-1|}, quad {-1, 0, 1|}, quad {0|}, quad {-1,0|1}, quad {0|1} $
  ],
  [
    $ {|} = {-1|} < {0 | } < {-1, 0|1} = {0|1} < {-1, 0, 1 | } $

    Wir können auf der linken Seite oBdA. die größte Zahl nehmen und auf der rechten oBdA die kleinste Zahl für Vergleiche. Wenn auf einer Seite die leere Menge steht müssen wir nichts vergleichen.

    Ihr könnt auch (zunächst) heuristisch überlegen, welche Hackenbush-Position die gewünschten Werte hätte. (Es gibt aber nicht immer eine.)
  ],
)

#puzzle(
  [Zahlen],
  [
    Welche (rationalen) Zahlen würdet ihr den obigen Werten zuordnen?
  ],
  [
    $ 0 = 0 < 1/2 = 1/2 < 1 < 2 $
  ],
)

Die Axiomatisierung von Surrealen Zahlen sieht vielleicht etwas Suspekt aus. Schließlich interagieren sie sehr stark miteinander. Deshalb schauen wir uns das kurz genauer an:

#definition[
  Der erste Tag an dem eine surreale Zahl entsteht heißt ihr _Geburtstag_. Wir sagen $x$ ist _einfacher_ als $y$, fallst $x$ einen früheren Geburtstag hat.
]

#thm[
  Die surrealen Zahlen, sowie ihre Ordnung, sind wohldefiniert.
]

#proof[
  Wir zeigen, dass
  $ P(omega) = "Alle Zahlen mit Geburtstag " <= omega "und ihre Vergleiche sind wohldefiniert." $

  die Bedingung
  $ (forall alpha < omega: P(alpha)) => P(omega) $
  erfüllt. Wohldefiniertheit folgt direkt aus der Aussage für kleinere Ordinalzahlen, da dann je zwei mögliche Elemente beider Hälfte wohdefiniert und vergleichbar sind.

  Sei $x = {X_L | X_R}$ eine surreale Zahl die an Tag $omega$ entstanden ist. Es genügt zu zeigen dass
  $ Q(omega', x) = "Alle Zahlen mit Geburtstag " <= omega' " sind mit " x "vergleichbar" $
  eine induktive Aussage bzgl. $omega' <= omega$ ist.

  Sei $y = {Y_L | Y_R}$ eine Zahl mit Geburtstag $omega' <= omega$. Dann ist nach Definition $y <= x$, falls für alle $y_l in Y_L$ gilt $not (y_l >= x)$ und für alle $x_r in X_r$ gilt $not (y >= x_r)$:

  $ forall y_l in Y_L: not (y_l <= x) $
  $ forall x_r in X_r: not (x_r <= y) $

  Aussagen der ersten Art sind wohldefiniert wegen $Q(alpha_l, x)$ für den Geburtstag $alpha_l < omega$ von $y_l$. Aussagen der zweiten Art sind wohldefiniert wegen $P(beta_r)$ für den Geburtstag $beta_r < omega$ von $x_r$.
]

Wir können mit dieser Technik noch viele weitere Dinge über Surreale Zahlen beweisen:

#thm[
  Es gilt mit transfiniter Induktion:

  - $<=$ ist total. Also für alle Zahlen $x,y$ ist $x<=y$ oder $y <= x$.
  - $<=$ ist transitiv: Aus $x <= y$ und $y <= z$ folgt $x <= z$
  - $<=$ ist reflexiv: $x <= x$

  - Für $x = {X_L | X_R}$ ist $X_L <x < X_R$
]

Wir könnten diese Notation sehr leicht direkt so für Hackenbush benutzen. Wir können den anfänglichen Spielen diese Positionen zuordnen:

$
  limits(#directed_hackenbush(("R",))) = {0 | } = 1
$

$
  limits(#directed_hackenbush(("B",))) = {| 0} = -1
$

Transfinit induktiv können wir nun jedem Spiel eine surreale Zahl zurordnen. Man kann leicht prüfen, dass unsere Definitionen von $x = 0$ und $x <= y$ von Spielen miteinander übereinstimmen.
Insbesondere können wir damit zeigen, dass zwei surreale Zahlen gleich sind, wenn wir jeweils eine Position für sie finden. Bevor wir mit unserer Intuition für Hackenbush den surrealen Spielen mehr Struktur geben können brauchen wir noch das nächste Resultat. Wir haben gesehen, das ganz viele verschiedenen Hackenbush Positonen denselben Wert haben können. Es wäre praktisch, wenn wir eine regel hätten um für eine bestimmte Darstellung $x = {X_L, X_R}$ eine kanonische leichteste Darstellung hätten.

#thm[
  (Einfachkeitssatz) Sei $y = {Y_L, Y_R}$ eine surreale Zahl. Dann ist $y = x$ für eine surreale Zahl mit dem kleinsten Geburtstag mit $ Y_L < x < Y_R. $
]

#proof[
  Angenommen $y = {Y_L|Y_R}$ ist eine surreale Zahl und $x={X_L, X_R}$ eine kleinste surreale Zahl sodass $Y_L < x < Y_R$.
  Betrachte $z = {X_L uu Y_L | X_R uu Y_R}$. Wir haben $z <= x$, da $X_L, Y_L < x$ und $z < X_R uu Y_R => z < X_R$. Similarly $z >= x$.

  Jetzt ist $y <= z$, da $Y_L < x <= z$ und $y < Y_R <= Z_R$. Analog ist $y >= z$.

  Also ist
  $x = z = y.$
]

#puzzle(
  [Tisch],
  [
    Welchen Wert haben die Tische?

    $
      #hackenbush(((0, 0), (0, 1), (1, 1), (2, 1), (2, 0)), ((0, 1, red), (1, 2, blue), (2, 3, blue), (3, 4, red)))
      #hackenbush(((0, 0), (0, 1), (1, 1), (2, 1), (3, 1), (4, 1), (4, 0)), (
        (0, 1, red),
        (1, 2, blue),
        (2, 3, blue),
        (3, 4, blue),
        (4, 5, blue),
        (5, 6, red),
      ))
    $
  ],
  [
    Diese Rätsel lässt sich durch austesten lösen, oder durch unsere bisherigen Ergebnisse.
    Wir erinnern uns an die Binärdarstellungen für Türme. Ein roter Zwei mit $n$ blauen Zweigen darüber hat den Wert $1/2^n$. Damit haben die Spiele die surrealen Zahlen zugeordnet:


    $
      #hackenbush(((0, 0), (0, 1), (1, 1), (2, 1), (2, 0)), ((0, 1, red), (1, 2, blue), (2, 3, blue), (3, 4, red))) = {1/4| 3/2} \
      #hackenbush(((0, 0), (0, 1), (1, 1), (2, 1), (3, 1), (4, 1), (4, 0)), (
        (0, 1, red),
        (1, 2, blue),
        (2, 3, blue),
        (3, 4, blue),
        (4, 5, blue),
        (5, 6, red),
      )) = {1/16| 9/8, 3/4} = {1/16 | 3/4}
    $

    Die erste Zahl die zwischen $1/4$ und $3/2$ entsteht ist $1$. Die erste Zahl die zwischen $1/16$ und $3/4$ entsteht ist $1/2$.
  ],
)

- ratsel, wie sehen spiele aus mit der zahl ...
- inklusive Zahl die kein Spiel hat..
- was ware die zahl für dieses spiel ...

- geburtstag
- es ist alles wohldefiniert
- Addition?
- eventually: Multiplikation

// #puzzle([Normales Hackenbush], [Welche Spiele gibt es, wo jeder Spieler maximal $0$, $1$ oder $2$ Züge machen kann?], [
//   Mit $0$ Zügen gibt es nur das leere Hackenbushspiel $0$:
//
//   #align(center, [#hackenbush(((0, 0),), ())])
//
//   Mit einem Zug gibt es die Spiele:
//
//   #directed_hackenbush(("B",))
//   #directed_hackenbush(("R",))
//   #directed_hackenbush(("R", "B"))
//
//   Mit zwei Zügen die neuen Spiele:
//
//   #directed_hackenbush(("B", "B"))
//   #directed_hackenbush(("B", "B", "R"))
//   #directed_hackenbush(("B", "B", "R", "R"))
//   #directed_hackenbush(("B", "R"))
//   #directed_hackenbush(("R", "B"))
//   ...
// ])



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
