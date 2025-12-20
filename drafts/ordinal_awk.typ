#import "../template.typ": *

== Ordinalzahlen

#image("../assets/allesInOrdnung.jpg")

Wir haben jetzt einige wichtige Zahlräume abgefrühstückt und ein paar Ideen gelernt die wir auch im Folgenden brauchen werden. Ab jetzt schauen wir, wie man diese gängigen Ideen erweitern oder modifizieren kann um über Hackenbush zu reden.

Bei Hackenbush immer mehr Striche aufeinander gesetzt. Und irgendwann waren das (abzählbar) unendlich viele. Und dann haben wir noch einen Strich oben drauf gesetzt. Was haben wir eigentlich da gemacht?
Wie können wir $infinity + 1$ rechnen, sodass es Sinn ergibt?

Implizit haben wir die Ordinalzahlen benutzt. Wohingegen Kardinalzahlen angeben wie groß eine Menge ist, so haben Ordinalzahlen etwas mit Reihenfolge und Zählen zu tun.

#example[
  Im Deutschen gibt es die Unterscheidung
  #align(center, ["Drei Äpfel" $<->$ "Der dritte Apfel"])
]

#definition[
  Eine *Kardinalzahl* $kappa$ ist eine Isomorphieklasse von Mengen. Kardinalzahlen haben eine offensichlichen Ordnung.
]

#definition[
  Eine transitive Menge $M$, ist eine Menge sodass jedes Element von $M$ eine Teilmenge ist:

  $ forall A in M : A subset M $
]

Diese Definition ist am besten zu verstehen wenn man sich ein paar Beispiele anschaut. Die einfachste transitive Menge ist
$ 0 := emptyset = {}. $
Hier gilt die obige Aussage, weil es kein Element gibt, für welches man sie prüfen muss. Hier sind noch ein paar weitere Beispiele:
$ 1 :={0} $
$ 2 := {0,1} $

#definition[
  Die _Von-Neumann Konstruktion_ gibt ein Modell für die natürlichen Zahlen wie wir sie oben eingeführt haben durch die Definitionen
  $ 0 := emptyset $
  $ s(n) := n uu { n } $
]

#rmk[
  Eine nützliche Eigenschaft an dieser Konstruktion ist, dass
  $ |n| = n $
  wobei wir links die Kardinalität von $n in NN$ als Menge meinen und rechts die (abstrakte) natürliche Zahl $n$.
]

Allerdings sind transitive Mengen noch nicht gut genug strukturiert um mit ihnen zu zählen.
#puzzle(
  [Schlechte transitive Mengen],
  [Findest du ein Beispiel für eine endliche transitive Menge, die keine natürliche Zahl nach Von-Neumann ist?],
  [
    $ {{}, {0}, {0,1}, {1}} $
  ],
)

In einem gewissen Sinne hat die obige Menge zu viele Elemente, dafür wir viele Zahlen sie benutzt ($0,1,2$).

#definition[
  Eine transitive Menge $X$ heißt _Ordinalzahl_ falls jede echte transitive Teilmenge von $X$ ein Element von $X$ ist.
]

Die natürlichen Zahlen nach Von-Neumann sind damit auch Ordinalzahlen. Das Beispiel aber nicht; die Menge ${1}$ ist zu viel - oder sie sollte eine $3 = {0,1,2}$ sein.

Es gibt aber nicht nur endliche Ordinalzahlen:

#example[
  Die Menge $NN = { 0, 1, ...}$ ist zum Beispiel eine Ordinalzahl! Hierbei sehen wir wieder $n in NN$ als Menge an. Wir nennen $NN$ mit dieser Interpretation auch $omega$.
]

Immer wenn wir eine Ordinalzahl $alpha$ haben, können wir aus ihr eine neue Ordinalzahl konstruieren:

#definition[
  Sei $alpha$ eine Ordinalzahl. Wir nennen $s(alpha) = alpha uu { alpha }$ ihren _Nachfolger_. Falls $alpha = s(beta)$, so nennen wir $alpha$ eine _Nachfolger-Ordinalzahl_.
]

#proof[
  Um das Verständnis zu verbessern zeigen wir kurz, dass dabei immer eine Ordinalzahl rauskommt. Offensichtlich ist $s(alpha)$ transitiv. Betrachten wir nun eine transitive Teilmenge $X subset s(alpha)$. Falls $alpha !in X$, so ist $X subset alpha$. Wenn $X = alpha$ ist per Konstruktion $X in s(alpha)$. Andernfalls ist es eine echte Teilmenge von $alpha$ und somit $X in alpha subset s(alpha)$. Falls nun $alpha in X$, so ist auch $alpha subset X$, da $X$ transitiv ist. Also $X = alpha uu {alpha} = s(alpha)$ ist keine echte Teilmenge.
]

Mit dieser Definition haben wir auch die natürlichen Zahlen konstruiert!

#question[Ist $omega$ eine Nachfolger-Ordinalzahl?]

Allerdings können wir $omega$ anders mittels kleinerer Ordinalzahlen darstellen:

#definition[
  Eine Ordinalzahl $alpha$ is eine _Limit-Ordinalzahl_, falls
  $ alpha = uuu_(beta < alpha) beta $
]

#example[
  Die natürlichen Zahlen sind die Menge ${0, 1, 2, ...}$. Wir können sie durch die Teilmengen $0 = {}, 1 = {0}, 2 = {0,1}, "usw."$ komplett ausschöpfen. Dies steht im Gegensatz zu z.B. $2 = {0,1}$, da $0 uu 1 = 1$.
]

Ein vielleicht hilfreicher Gedanke beim Verständnis ist der Folgende: Die Definition, dass eine Ordinalzahl eine Limit-Ordinalzahl ist, ist ein Test und weniger einer Konstruktion. Das heißt, ich gebe euch eine Ordinalzahl, (die ich irgendwie anders konstruiert habe) und ich könnt damit prüfen, ob es eine Limit-Ordinalzahl ist.

#thm[Elemente von Ordinalzahlen sind Ordinalzahlen]

#proof[
  Sei $alpha$ eine Ordinalzahl. Angenommen es existiert ein $beta in alpha$ welches nicht transitiv ist. ObdA sind alle Elemente von $beta$ transitiv. (Sonst könnten wir stattdessen ein Element von $beta subset alpha$ betrachten, welches nicht transitiv ist. Dieser Prozess der Ersetzung von $beta$ muss Enden, da es keine unendlich verschachtelten Mengen gibt. (Fundierungsaxiom))

  Seien
  $ gamma in beta in alpha $
  $3$ Mengen. Dann ist
  $ beta subset alpha => gamma in alpha => gamma subset alpha $
]

#thm[Jede Ordinalzahl ist entweder eine Nachfolger-Ordinalzahl oder eine Limit-Ordinalzahl]

#proof[
  Sei $alpha$ eine Ordinalzahl. Betrachte
  $ alpha' = uuu_(beta in alpha) beta $
  Angenommen $alpha != alpha'$.

  Die Menge $alpha'$ ist transitiv, da
  $ x in alpha' => exists beta in alpha: x in beta => exists beta in alpha : x subset beta => x subset alpha'. $
  Also ist $alpha' in alpha$.

  Sei $alpha'' = s(alpha')$. Diese Menge ist wieder transitiv. Angenommen $alpha != alpha''$, dann ist $alpha'' in alpha$. Aber dann ist $alpha' supset alpha'' in.rev alpha'$ nach Konstruktion, ein Wiederspruch. (Nach dem Fundierungsaxiom darf keine Menge sich selbst beinhalten.)
]

Ordinalzahlen haben viele tolle Eigenschaft. Die wichtigste für uns ist die Folgende:

#thm[Sein $alpha$, $beta$ zwei Ordinalzahlen. Dann ist $alpha subset beta$ oder $beta subset alpha$.]

#question[Kennt ihr das Lemma von Zorn?]

#axiom[
  (Lemma von Zorn)
  Sei $M$ eine partiell geordnete Menge. Angenommen jede (total geordnete) Kette
  $ a_0 <= a_1 <= ... <= a_n <= ... $
  in $M$ hat eine obere Schranke $x$
  $forall n in NN : a_n <= x,$


]


#proof[
  Zuerst betrachen wir eine Ordinalzahl $alpha$.

  Wir wissen, dass $beta in alpha$ eine echte Teilmenge von $alpha$ ist.


  Seien $alpha, alpha'$ zwei Ordinalzahlen.
]

- Entweder a < b oder b < a
- Infinite descent
- Induction
- descent proof
- rmk: Zorn <-> Choice

#question[Why will $omega + 1$ never become pope? Because it isn't a kardinal.]

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
