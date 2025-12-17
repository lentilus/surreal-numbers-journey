#import "template.typ": *
#show: template

= Konstruktion der Surrealen Zahlen

Wir bleiben erstmal bei Red-Blue Hackenbush.
Wenn ihr eine Position habt, wie habt ihr deren Wert bestimmt? Also wie bestimmt ihr den Wert von 3/4?
=> Was kann der eine machen, was kann der andere machen?
Das heißt ein Spiel ist beschrieben dadurch, was für Positionen jeder spieler daraus ableiten kann.

Und wir haben folgende Eigenschaft:
Q: Wenn L einen Zug macht ist es immer besser für ??, als wenn R einen Zug macht.
Jeden Zug den du machst wird das Spiel für dich schlechter und für den anderen nicht unbedingt
Heuristisch: Stacks anschauen

Wenn rot einen Zug macht ist es danach schlechter für Rot, als wenn blau einen Zug gemacht hätte
[Entweder heuristisch, oder Argument ausdenken]

Zudem sind Spiele sind ja endlich. Wenn wir also alle möglichen Werte durchnummerieren wollen, dann können wir einfach nach Maximalanzahl der Züge gehen.


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
