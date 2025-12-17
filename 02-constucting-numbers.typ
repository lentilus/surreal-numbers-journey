#import "template.typ": *
#show: template

= Konstruktionen bekannter Zahlenraeume

Wir haben jetzt Spiele gesehen und ihnen Zahlen zugeordnet.
Sind auf seltsame Dinge gestoßen (Grün?)
Und auch diese unendlichen hohen Türme und wollen das jetzt etwas formalisieren.

Fangen wir am zur Wiederholung mal die "normalen Zahlen zu definieren" (also N, Z, Q, R)
Vorallem um ein Gefühl dafür zu bekommen, wie Definitionen für sowas aussehen können, wenn ihr das noch nie gemacht habt 

Habt ihr das schonmal gesehen?
=> Wenn nicht, nicht schlimm, nicht sooo wichtig. Aber ganz nett.

== Natürliche Zahlen (Peano)

Natürliche Zahlen...
haben 0
und wenn n eine natürliche Zahl ist, dann kann man den Nachfolger s(n) "=" n+1 bilden
und wir haben

s(n) != s(m) fall n != m
s(n) != 0

Also können wir eine natürliche Zahlen eindeutig darstellen als
s(....s(0))
Oder als Abkürzung:
xxxxxxxxxxxx (12)
(freier Monoid in einer Variable)


Jetzt können wir den Zahlen Namen geben...
1, 2, ...

Wir haben eine strikte Ordnung auf den Zahlen

Jetzt brauchen wir Addition..
Wir sagen

n + 0 = 0
n + 1 = s(n)
n + s(m) = s(n) + m

Und das ist wohldefiniert
=> Glaubt ihr das?

Wir können jetzt damit Induktionen machen:

Eine Aussage gilt für alle natürlichen Zahlen g.d.w. sie für 0 gilt und wenn sie für n gilt, gilt sie auch für s(n).
(Bild)
Weil genau Definition.
Wir können das auch anders sagen:
Eine Aussage gilt für alle n, g.d.w. wenn sie für alle m < n folgt die Aussage für m

Kommt euch das bekannt vor?
(Dann evt.) Beispiel:

Question: Sum_k=1^n k = 1 + 2 + ... = n(n+1)/2
Question: Könnt ihr mit diesem Bild einen grafischen Beweis finden (Halbes Rechteck)

Multiplikation:
```
m * 0 = 0
m * 1 = m
m * s(n) = m * n + m
```

== Ganze Zahlen

Wir wollen negative Zahlen einführen, Minus rechnen.
Aber wenn wir 7-11 rechnen, haben wir ein Problem, weil wir keine natürliche Zahl mehr haben.
Idee: Identifiziere Zahlen mit solchen Rechnungen, wir wollen also

7-11 "=" -4
und
11-7 "=" 4

=> Die ganzen Zahlen definieren wir als N x N / \equiv
(Also tupel (n,n) sodass wir bestimmte Tupel identifizieren)

(7, 11) "=" (2,6)
7-11 "=" 2-6

Idee, wie wir das defnieren können mit Sachen die wir mit nat. Zahlen machen können?
=> 11+2 = 7+6
Evt. Q: Wie würdet ihr Addition und Multiplikation definieren?


== Rationale Zahlen

Q: Wie ist das mit rationale Zahlen?

A: (a, b) (b != 0)
=> Wir benutzen sogar die Notation.

== Reelle Zahlen

Jetzt machen wir etwas interessanteres. Wisst ihr was die reellen Zahlen sind?
=> Basically "alle" Zahlen auf dem Zahlenstrahl
- pi, e, wurzel 2, jede Kommazahl

Es gibt bei Q ganz viele Lücken. Also zB keine Zahl die zum Quadrat 2 hat (!)
(Interessante Übungsaufgabe)

Schauen wir uns zB die Zahl
0.110100100010000...
an. Sie ist nicht rational
(Interessante Übungsaufgabe)

Aber wir wissen genau, wo sie hin kommt. Zwischen die Menge.. und die Menge ..
Beachte: Die linke Menge reicht aus.
=> Machen das zur Definition

Ein Dedekind Schnitt ist ...
Wir definieren relle Zahlen als Menge aller Dedekind Schnitte.

Q: Dedekind Schnitt für Wurzel 2?
A: ... x^2 < 2, sign ... x^2 >= 2, sign

Rmk: Seht wie rationale Zahlen eingebettet werden?
Q: Wie ist Mult/ Addition definiert?

```
===============
Pause
===============
```

== Ordinals
Wir haben bei Hackenbush immer mehr Striche aufeinander gesetzt. Und irgendwann waren das (abzählbar) unendlich viele.
Und dann haben wir noch einen Strich oben drauf gesetzt? Was haben wir eigentlich da gemacht?
Wie können wir Infty + 1 rechnen, sodass es Sinn ergibt?

Implizit haben wir die Ordinal Numbers benutzt.
[Everything is fine meme, dog in fire, "alles in Ordnung"]
[Bishofe der Mathematik / kleine Brüder von Kardinälen]
[Schön aufgereiht aber sehr viele]

Wie wollen zählen und um das mathematisch zu machen ordnen wir jeder Zahl eine Menge zu.

0 = {}
1 = {0}
2 = {0, 1}
...

Das tolle dabei ist, die Kardinalität der Zahl entspricht der Zahl.
Teilbarkeit entspricht der Ordnungsrelation.

Wir können definieren n + 1 = {...n , n}
=> Modell für natürliche Zahlen

Und wir haben n \subset m für n \in m

Formal Def: Eine Ordinal number, ist eine Menge, die diese Eigenschaft erfüllt.

(aber uns genügt es einfach weiter mit der Konstruktion zu machen und ein Gefühl dafür zu bekommen)

Wir können uns jetzt die Menge aller natürlichen anschauen
{0, ..., n , ...}
die nennen wir Omega. Hat wieder die Ordinal number property. Und es ist nicht n +1 für ein n
=> Nennen wir Limit Ordinal
Aber wir können wieder +1 rechnen!
{...N, N}

Wenn wir so weiter machen können wir ganz viele Zahlen konstruieren, und zwar

a) Successer ordinals
b) Limit ordinals = Ordinal Property + Nicht successor ordinal

{...N,  ...N+N} = 2N
{...N,  ...2N} = NN
{...NN, ...NN^NN, ..NN^NN^NN, ...NN^NN^NN^NN} = ...

Ordinal numbers sind
- Total geordnet (Teilbarkeit)
- Sehr foundational (für jede Kardinal gibt es ein Ordinal === Axiom of Choice)

Wir können mit Ordinals coole Induktion machen, erstmal ein Beispiel:

Jede absteigende Folge von Ordinals terminiert. 
Proof: 
Angenommen es gibt eine eine unendliche tiefe absteigende Folge. Wegen well-foundedness gibt es keine unendlich tiefen Mengen
=> Wdspr.
(Wenn ihr den Beweis nicht mögt => könnt das einfach annehmen.)

=== Jede nicht-leere Sammlung an Ordinals hat ein Minimum
Nimm eine absteigende Folge an Ordinals => Terminiert

=== Transfinite Induktion
Angenommen P(X) ist eine Eigenschaft von Ordinals. Wenn
P(Y) für alle Y < X => P(X)
Dann gilt die Aussage P(X) für alle Ordinals. 
Sonst gibt es kleinstes für das das nicht gilt.

Q: Every infinite ordinal can be uniquely written as the sum of a limit ordinal and a finite ordinal

Wir können das Prinzip von transfiniter Induktion auch umdrehen und rekursiv Dinge definieren.

Bsp: Konstruktion einer Basis einer Vektorraums mittels Choice, für jeden Ordinal einen Vektor der nicht schon gespannt wird.

Das wichtigste Beispiel für uns kommt aber mit den Surrealen Zahlen


Q: Ein paar Spiele/Positionen überlegen, anschauen
