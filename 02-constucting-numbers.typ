#import "template.typ": *
#import "@preview/cetz:0.4.2"
#show: template

= Graf Zahl und sein Vermaechtnis \ _Konstruktionen bekannter Zahlenräume_

Wir haben jetzt Spiele gesehen und ihnen Zahlen zugeordnet. Dabei sind wir auf sehr seltsame Dinge gestoßen:

- Wie funktionieren unendlich hohe Türme genau?
- Was machen diese grünen Zweige?

In diesem und dem folgenden Abschnitt schauen wir uns an, wie wir Spiele richtig formalisieren können. Zur Motivation konstruieren wir dafür erstmal die uns schon bekannten Zahlräume und werden dabei schon einigen interessanten Techniken begegnen.

#question[Habt ihr das schonmal gesehen?]

== Natürliche Zahlen

Die natürlichen Zahlen kennen wir alle. Es ist einfach die Menge

$ { 0, 1, 2, 3, 4, ... }. $

Allerdings hat diese Definition ein großes Problem: Was bedeutet "$...$"?

#question[Was ist euer erster Impuls, wenn ihr probieren wollt das zu formalisieren?]

Jede Definiton von natürlichen Zahlen sollte das folgende erfüllen:

- $0$ ist eine natürliche Zahl.
- Der Nachfolger einer natürlichen Zahl ist eine natürliche Zahl.
- $0$ ist die einzige natürliche Zahl die nicht Nachfolger einer anderen natürlichen Zahl ist.
- Aus $s(n) = s(m)$ folgt $n = m$.

#definition([
  Ein $NN$-Objekt ist eine Menge $M$ mit einem besonderen Element $0 in M$ und einer Nachfolgerfunktion $s: M -> M$ sodass

  $ not exists n in M : s(n) = 0 $
  $ forall n,m in M : s(n) = s(m) -> m = n. $
])

#puzzle([], [Gibt es $NN$-Objekte die nicht $NN$ sind?], [
  $NN union.sq ZZ$. Allgemeiner $NN union.sq G$ mit einem Automorphismus $G -> G$.
])

#rmk[Es gibt keine Menge an logischen Formeln erster Ordnung, welche genau von $NN$ erfüllt wird.]

Wie finden wir aber nun unser $NN$?

#definition(
  [
    $NN$ ist bis auf Isomorphie das eindeutig bestimmte $NN$-Objekt, welches kein  $NN$-Unterobjekt besitzt.
  ],
)

#rmk[
  Es gibt eine Kategorie von $NN$-Objekten. $NN$ ist das initiale $NN$-Objekt.
]

#rmk[
  Sobald wir zeigen, dass es so ein Objekt gibt, dann beschreibt die obige Eigenschaft es vollkommen und wir brauchen theoretisch keine explizite Konstruktion mehr um damit zu arbeiten. (vgl. Tensorprodukt)
]

#construction[
  (Nach Peano)

  Eine natürliche Zahl ist ein Symbol der Form
  $
    0, s(0), s compose s(0), s compose s compose s(0), ...
  $
  Wir können dies abkürzen als
  $
    0, x, x x, x x x, ...
  $
  Die Menge aller solchen Symbole nennen wir $NN$.
]

Man sieht intuitiv (und damit je nach den Axiomen mit denen man arbeitet leicht), dass diese Konstruktion die universellen Eigenschaften der natürlichen Zahlen hat.

#rmk[Mit dieser Darstellung (und der späteren Addition) sieht man, dass $NN$ der freie Monoid in einer Variable ist.]

Mit die wichtigste Eigenschaft der natürlichen Zahlen ist, dass man mit ihnen Induktion machen kann:

#thm[
  Sei $P: NN -> {T,F}$ eine Aussage die jeder natürlichen Zahl einen Wahrheitswert zuordnet. Wenn gilt:

  $ P(0) $
  $ forall n : P(n) => P(s(n)) $

  Dann gilt $P(n)$ für alle $n in NN$. (Man könnte auch sagen, dass $P$ konstant ist, aber wer würde das tun?)
]

#proof[
  Die $n in NN$ für die $P$ gilt bilden eine induktive Menge. Aber die einzige iduktive Teilmenge von $NN$ ist $NN$.
]

#rmk[
  Unsere Definition von $NN$ kann man mit dem Prinzip der Induktion in Logik zweiter Ordnung formalisieren, da $(NN, s, 0)$ die eindeutige Struktur ist mit

  $ not exists n in M : s(n) = 0 $
  $ forall n,m in M : s(n) = s(m) -> m = n. $
  $ forall P: M -> {T,F}: (P(0) = T and (P(n) = T -> P(s(n)) = T)) -> (forall n in NN: P(n)) $
]

#puzzle(
  [
    Euler Formel
  ],
  [Zeige dass für $n in NN$
    $ sum_(k=0)^n k = 1+ ... + n= frac(n(n+1), 2) $
  ],
  [
    Die Aussage gilt für $n=0$. Wenn sie für ein festes $n$ gilt, dann ist

    $ sum_(k=0)^(n+1) k = sum_(k=0)^n k + (n+1) = frac(n(n+1), 2) + (2(n+1))/2 = ((n+1)(n+2))/2. $
  ],
)

Eine weitere wichtige Eigenschaft von natürlichen Zahlen ist _Addition_. Tatsächlich haben wir Addition noch nicht definiert.

#definition[
  Seien $n$ und $m$ zwei natürliche Zahlen. Definiere
  $ n + 0 = n $
  $ n + s(m) = s(n + m) $
]

#thm[Für alle $m$ und $n$ ist $m+n$ wohl definiert. (Also die Rekusion terminiert.)]

#proof[Für $m=0$ haben wir es definiert. Für $m = n+1$ ist es wohldefiniert, falls es für $n$ wohldefiniert ist.]

#rmk[Induktive Definitionen werden später noch wichtig sein. Denkt gerne immer wieder an dieses Beispiel zurück.]

Aus dieser Definition können wir Kommutativität und Assoziativität und so herleiten. Das ersparen wir euch (;

#puzzle([Multiplikation], [Wie würdet ihr Multiplikation definieren?], [
  $ m * 0 = 0 $
  $ m * s(n) = m * n + m $
])

Zuletzt brauchen wir eine Ordnung auf den natürlichen Zahlen.

#puzzle([Ordnung], [Wie würdet ihr $x <= y$ definieren?], [
  $ x <= y :<=> exists n in NN: x + n = y $
])

#rmk[
  Wenn euch sowas Spaß macht und ihr damit spannendere Dinge machen wollt, dann mögt ihr mathematische Logik. Wenn man das richtig aufzieht kann man z.B. solche Dinge beweisen wie:

  // #thm[
  //   Jede Aussage in Logik erster Ordnung in der Sprache $op("Fld")$ (also mit Symbolen $forall, exists, not, times,plus, 0, 1$, Variablen und logischen Ausdrücken) ist genau dann in $QQ$ wahr, wenn sie in $FF_p$ wahr ist für hinreichend große Primzahlen $p$. Insbesondere kann man damit gut über Polynome reden.
  // ]
  #thm[(Ax's theorem)
    Jede injektive Polynomfunktion $f: CC^n -> CC^n$ is auch surjektiv.
  ]
  #proof[
    (Sketch)
    Wir können diese Aussage für ein bestimmtes $f$ als logische Formel erster Ordnung in der Sprache $op("CFld")_0$ (algebraisch abgeschlossene Körper mit Charakteristik $p=0$) aufschreiben. Wir brauchen folgende Schritte:

    1. Für jede logische Formel $phi$ in $op("CFld")_p$ ist entweder $phi$ oder $-phi$ aus den Axiomen herleitbar. ($op("CFld")_p$ ist eine vollständige Theorie.)
    2. Die Aussage gilt für endliche Körper.
    3. Die Aussage gilt für den angebraischen Abschluss endlicher Körper. Folgt mit $2.$ aus
    $ K = uuu_{F subset K | F text("endlich")} F. $

    Sei $phi$ die Formel die für ein injektives $f$ beschreibt, dass es injektiv ist. Dann ist sie mit $1.$ beweisbar aus den Axiomen von $op("CFld")_0$. Ein solcher Beweis ist endlich und benutzt daher nur endlich viele Axiome der Form $1+1+...+1 != 0$. Deshalb funktioniert er auch für $op("CFld")_p$ für hinreichend großes $p$. Sei nun $psi$ die Formel die beschreibt, dass $f$ nicht surjektiv ist. Analog ist $psi$ beweisbar für hinreichend großes $p$ und damit $f$ nicht surjektiv für hinreichend großes $p$. Ein Wiederspruch nach $3.$.
  ]
]


== Ganze Zahlen

Mit natürlichen Zahlen können wir additive Gleichungen aufstellen:

$ 7 + x = 11 $
$ 11 + x = 7 $

Manche diese Gleichungen haben aber keine Lösungen. Um das zu lösen führen wir negative Zahlen ein.

#rmk[
  Wir können dieso Motivation auch etwas anders darstellen. Wir hätten zum Beispiel gerne, dass für feste $n, m$ jede Aussage
  $ exists x : n + x = m $
  wahr wird.

  Alternativ halten wir fest das Gruppen toll sind. Diese sind auch Monoide. Es gibt also einen Funktor $op("Grp") -> op("Mnd")$ der Inverse vergisst. Wir suchen einen adjungierten Funktor.
]

Die Gleichung $n + x = m$ für feste $n$ und $m$ charakterisiert $x$ schon komplett. (Zumindest wenn wir einen größeren Zahlraum hätten.) Wir würden gerne sagen
$
  x approx (n+x = m).
$
Etwas kürzer:
$
  x approx (n, m) in NN
$
Das einzige Problem dabei ist, dass z.B.

$ 11 + x = 7 $
$ 5 + x = 1 $

dieselbe Zahl beschreiben sollen.

#puzzle(
  [Equivalenzrelation],
  [Wie können wir mit den Mitteln der natürlichen Zahlen beschreiben, wann $(n+x = m) approx (p + x = q)$, kurz $(n,m) approx (p,q)$ gelten sollte?],
  [
    $ n + q = m + p $
  ],
)

Dies ist eine Äquivalenzrelation und erfüllt unsere Erwartungen, wie sich die Gleichungen verhalten sollten.

#definition[
  #comment[Soll hier ZZ stehen?]
  Die natürlichen Zahlen sind die Menge $NN^2 \/ ~$ wobei
  $ (n,m) ~ (p,q) :<=> n+q = m+p $
]

x = m - n
y = q - p
xy = (np + mq) - (mp + nq)


#puzzle([Rechenregeln], [Wie würdet ihr Addition/Multiplikation und Subtraktion definieren?], [
  $ [(n,m)] + [(p,q)] = [(n+p, m+q)] $
  $ [(n,m)] - [(p,q)] = [(n+q, m+p)] $
  $ [(n,m)] + [(p,q)] = [(m p + n q, m q + n p)] $

  Das ist alles wohldefiniert. (Unabhängig vom Repräsentanten.)
])

#rmk[
  $ NN arrow.r.hook ZZ "via" n |-> [(0, n)] $
]

#rmk[
  Diese Konstruktion gibt einen Funktor $op("Mnd") -> op("Grp")$.
]

== Rationale Zahlen

#puzzle([Rationale Zahlen], [Wie definiert ihr rationale Zahlen und ihre Rechenoperationen?], [

  #definition([
    Die rationalen Zahlen sind die Menge
    $ QQ = ZZ xx (ZZ - {0}) \/ ~ $
    mit
    $ (p,q) ~ (r,s) :<=> p s = r q. $
    Die Körperoperationen sind gegeben durch:

    $ 0 = [(0,1)] $
    $ 1 = [(1,1)] $
    $ [(p,q)] * [(r,s)] = [(p r,q s)] $
    $ [(p,q)] + [(r,s)] = [(p s + q r,q s)] $
    $ - [(p,q)] = [(-p, q)] $
    $ [(p,q)]^(-1) = [(q, p)] $
  ])
])

== Reelle Zahlen

#question([Wisst ihr, was die rellen Zahlen sind?])

Die Grundidee ist die Folgende: Wenn wir nur den Zahlenstrahl mit $QQ$ haben, dann haben wir ganz ganz viele Lücken. Immer wenn wir beschränkte, monotone Folge $(a_n)_(n in NN)$ von (rationalen) Zahlen haben

$
  #cetz.canvas({
    import cetz.draw: *


    line((-5.5, 0), (5.5, 0), stroke: (paint: black, thickness: 1pt))

    let tiks = range(-5, 6)
    for tik in tiks {
      line((tik, -0.1), (tik, 0.1))
      content((tik, -0.5), [#tik])
    }

    let nodes = (-4.2, -2.3, -0.8, 0.2, 0.5, 0.7, 0.9, 1.1, 1.141)

    for node in nodes { circle((node, 0), fill: blue, stroke: (thickness: 0pt), radius: 2pt) }
  })
$

hätten wir gerne, dass diese gegen eine relle Zahl konvergiert. Also dass ein $x in RR$ existiert mit

$ forall QQ in.rev epsilon > 0 exists N in NN forall n in NN, n <= N: |a_n - x| < epsilon. $

#example[
  Jede Dezimalzahl
  $ a_n a_(n-1) ... a_1 . b_(-1) b_(-2) b_(-3) ... ", mit" a_i, b_i in { 0, ..., 9}, (n = 0 "oder" a_n != 0) $
  sollte eine (reelle) Zahl sein.
]

#rmk(
  [Man kann leicht zeige, dass genau die Dezimalzahlen rationale Zahlen darstellen, deren Nachkommadarstellung irgendwann periodisch wird.],
)

Wir wollen also informell eine relle Zahl mit den Äquivalenzklassen aller (monoton von unten) gegen sie konvergierenden Zahlen beschreiben. Eine Möglichkeit das zu tun ist über die folgende Definition:

#definition[
  Ein *Dedekind Schnitt* ist eine Aufteilung der rationalen Zahlen in zwei disjukte Mengen
  $ QQ = L union.sq R $
  mit $L, R != emptyset$ und
  $ forall x in L exists y in L : x < y $
  $ forall x in L forall y in R : x < y. $
  Also $L$ "liegt links" von $R$ und hat kein größtes Element. Wir identifizieren einen Dedekind Schnitt $(L, R)$ im folgenden mit $L$.
]

#definition[
  Die reellen Zahlen $RR$ sind als Menge genau die Dedekind-Schnitte.
]

#example[
  Wir können $QQ$ durch
  $ q in QQ |-> { r | r < q} = L in RR $
  in $RR$ einbetten.
]

#question[
  Wie würdet ihr $sqrt(2) in RR$ definieren?
]

#puzzle(
  [Körperoperationen],
  [
    Wie würdet ihr Addition, Multiplikation, Additive und Multiplikative Inverse und Ordnung auf $RR$ definieren?
  ],
  [
    $ 0 = 0 in QQ subset RR $
    $ 1 = 1 in QQ subset RR $
    $ L_1 + L_2 = { r + s | r in L_1, s in L_2} $
    $ - L = { -r | r in QQ - L, exists s in Q-L : s < r} $
    $ L_1 <= L_2 :<=> forall r in L_1 exists s in L_2: r <= s $

    Bei Multiplikation braucht man irgendwo Fallunterscheidungen. Wenn $L_1, L_2 <= 0$ können wir das Produkt definieren als
    $ L_1 * L_2 = { p in QQ | forall r in L_1 forall s in L_2 exists q in QQ: p < q < r s} $
    Für positive $L_1$ oder $L_2$ können wir durch additives Invertieren die definition von $L_1 * L_2$ darauf zurück führen.

    Zuletzt ist für $L != 0$
    $ 1/ L = { q in QQ_(-) | forall l in L: l q < 1}. $
  ],
)

Man kann leicht prüfen, dass damit gilt:

- $RR$ ist ein Körper.
- $QQ arrow.hook RR$ in eine Einbettung geordneter Körper.
- $sqrt(2) * sqrt(2) = 2$

Mit die wichtigste Eigenschaft von $RR$, der Grund warum wir es konstruiert haben ist, dass es _vollständig_ ist, also dass jede Cauchy-Folge konvergiert. Für unsere Zwecke genügt uns diese äquivalente Aussage:

#thm[Jede nach oben beschränkte Menge $A$ in $RR$ hat ein Supremum, also eine kleinste obere Schranke $s in RR$:
  $ (forall a in A : a < s) and (forall r in RR : (forall a in A: a < r) -> s <= r) $
]

#proof[
  Falls $A subset QQ subset RR$, so ist
  $ L = { q in QQ | exists a in A: q < a} $
  das Supremum von $A$. Andernfalls betrachte
  $ B := {b in QQ | exists a in A : b < a} subset QQ. $
  Dann ist $ op("sup") A = op("sup") B $ und wir gewinnen.
]

== Ordinalzahlen

#image("assets/allesInOrdnung.jpg")

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
  Eine *Ordinalzahl $M$* ist eine Menge sodass jedes Element von $M$ eine Teilmenge ist und $M$ bezüglich der Mengeninklusion total geordnet ist:

  $ forall A in M : A subset M $
  $ forall x,y in M : x in y or x = y or y in x $
]

Diese Definition ist am besten zu verstehen wenn man sich ein paar Beispiele anschaut. Die einfachste Ordinalzahl ist
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

Es gibt aber nicht nur endliche Ordinalzahlen:

#example[
  Die Menge $NN = { 0, 1, ...}$ ist zum Beispiel eine Ordinalzahl! Hierbei sehen wir wieder $n in NN$ als Menge an. Wir nennen $NN$ mit dieser Interpretation auch $omega$.
]

Immer wenn wir eine Ordinalzahl $alpha$ haben, können wir aus ihr eine neue Ordinalzahl konstruieren:

#definition[
  Sei $alpha$ eine Ordinalzahl. Wir nennen $s(alpha) = alpha uu { alpha }$ ihren _Nachfolger_. Falls $alpha = s(beta)$, so nennen wir $alpha$ eine _Nachfolger-Ordinalzahl_.
]

#proof[
  Um das Verständnis zu verbessern zeigen wir kurz, dass dabei immer eine Ordinalzahl rauskommt.

  Offensichtlich ist $s(alpha)$ transitiv. Um die totale Ordnung zu prüfen, müssen wir uns nur vergleiche mit $alpha$ anschauen. Aber für $alpha != beta in s(alpha)$ ist $beta in alpha$.
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

#thm[
  Folgende Dinge sind leicht zu verifizieren (oder glauben):

  1. Jedes Element einer Ordinalzahl ist eine Ordinalzahl
  2. Jede beschränkte Menge einer Ordinalzahl hat ein Supremum

  Ein _initialer Abschnitt_ einer Ordinalzahl $alpha$ sei eine Teilmenge $M subset alpha$ mit

  $ forall x in alpha : ( exists m in M : x <= m ) -> x in M $

  3. Für jeden initialen Abschnitt $M$ einer Ordinalzahl $alpha$ gilt
  $ M = alpha or M in alpha $
]
Es ist leicht zu sehen, dass Elemente von Ordinalzahlen wieder Ordinalzahlen sind. Damit können wir zeigen:

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

Ordinalzahlen haben viele tolle Eigenschaft. Mit die wichtigste für uns ist die Folgende:

#thm[Sein $alpha$, $beta$ zwei Ordinalzahlen. Dann ist $alpha subset beta$ oder $beta subset alpha$.(\* Je nach Axiomensystem bis auf sehr starke Isomorphie.)]

#question[Kennt ihr das Lemma von Zorn?]

#axiom[
  (Lemma von Zorn)
  Sei $M$ eine nicht-leere partiell geordnete Menge. Angenommen jede (total geordnete) Kette
  $ a_0 <= a_1 <= ... <= a_n <= ... $
  in $M$ hat eine obere Schranke $x$
  $forall n in NN : a_n <= x,$
  dann hat $M$ ein maximales Element.
]

#rmk[Dieses Axiom is äquivalent zum Auswahlaxiom (engl. Choice wie in ZFC):]

// #axiom[
//   (Auswahlaxiom)
//
//   Sei $M$ eine Menge nichtleerer Mengen. Dann gibt es eine Funktion
//
//   $ F: M -> uuu_(X in M) X $
//
//   genannt _Auswahlfunktion für M_, die jedem Elmenet $X in M$ ein element $F(X) in X$ zuordnet.
// ]

#axiom[
  (Auswahlaxiom)

  Sei $f : A -> B$ eine Surjektion von Mengen. Dann gibt es eine Funktion $j : B -> A$ mit $ f compose j = id_A. $
]

#proof[
  Sein $alpha$ und $beta$ zwei Ordinalzahlen. Betrachte die Menge $M$ von Mengen die sowohl initiale Abschnitte von $alpha$ als auch von $beta$ sind. OBdA. sind $alpha, beta != 0$, also $M$ nicht leer.

  Sei ${m_i}_{i in NN}$ eine aufsteigende Folge (bzgl. der totalen Ordnung $in$) von initialen Abschnitten in $alpha$ und $beta$. Dann ist auch $m = uuu_(i in NN) m_i$ ein initialer Abschnitt in $alpha$ und $beta$.

  Nach dem Lemma von Zorn hat $M$ damit ein maximales Element $gamma subset alpha, beta$. Nehmen wir an $alpha != gamma$ und $alpha != beta$. Dann ist $gamma in alpha, beta$. Das ist ein Wiederspruch zur Maximalität von $gamma$.
]

Damit können wir also jede zwei beliebigen Ordinalzahlen vergleichen! Wir bekommen direkt die folgende Eigenschaft geschenkt:

#thm[Jede absteigende Folge $(a_n)_(n in NN)$ von Ordinalzahlen terminiert.
  $ exists N in NN forall n > N: a_n = a_(n+1) $
]
#proof[
  Alle Ordinalzahlen $a_n$ sind Teilmengen von $a_0$. Angenommen es gibt eine unendlich lange strikt absteigende Teilfolge von Ordinalzahlen
  $ a_0 = b_0 > b_1 > ... $
  Dann ist
  $ a_0 = b_0 in.rev b_1 in.rev b_2 in.rev ... $
  eine unendlich absteigende Folge von Mengen. Ein Wiederspruch zum Fundierungsaxiom.
]

Wir haben bereits Induktion für natürliche Zahlen gesehen. Wir können das auch verallgemeinern:

#thm[
  (Transfinite Induktion)

  Sei $P(alpha)$ eine Aussage über Ordinalzahlen. Falls
  $ forall beta < alpha: P(beta) => P(alpha), $
  so gilt $P$ für alle Ordinalzahlen.
]

#proof[
  Angenommen es gibt eine Ordinalzahl für die $P$ nicht gilt. Dann gibt es auch eine kleinste Ordinalzahl $alpha$ für die es nicht gilt. (Wähle so lange wie möglich eine echt kleinere Ordinalzahl für die $P$ nicht gilt. Dieser Prozess muss terminieren.)

  Aber dann gilt $P$ für alle $beta < alpha$. Damit gilt $P$ aber auch für $alpha$.
]

// #question[Why will $omega + 1$ never become pope? Because it isn't a kardinal.]
// [Bishofe der Mathematik / kleine Brüder von Kardinälen]
// [Schön aufgereiht aber sehr viele]

Wir können das Prinzip von transfiniter Induktion auch umdrehen und rekursiv Dinge definieren.
Wir können damit zum Beispiel endlich die surrealen Zahlen definieren.


Zuletzt schauen wir uns noch große Ordinalzahlen an und werden feststellen, dass diese sehr seltsam sind.

#puzzle([$2 omega$], [Wie sieht $2 omega$ als Menge aus?], [
  $ { 0, 1, 2, ..., omega, omega + 1, ...} = omega uu { s^n (omega) | n in NN} $
])


#puzzle([$omega^omega$], [Wie sieht $omega^omega$ als Menge aus?], [
  $ { 0, 1, 2, ..., omega, omega + 1, ..., 2omega , 2 omega+1,...} = uuu_(n in NN) n omega $
])

#puzzle([], [Welche Kardinalität hat $omega^omega$?], [
  $ | omega^omega | = aleph_0 := |NN| $

  Es ist eine abzählbare Vereinigung abzählbarer Mengen.
])

#puzzle(
  [Überabzählbare Ordinalzahlen],
  [Kannst du eine überabzählbare Ordinalzahl finden? Wie genau kannst du sie angeben?],
  [
    Hast du eine konkrete Darstellung gefunden? Dann ist ZFC inkonsistent (;
  ],
)

Im Folgenden schauen wir uns kurz an, was es schwer macht über große Ordinalzahlen zu reden. Zunächst aber haben wir folgendes Ergebnis:

#axiom[(Wohlordnungssatz)
  Jede Menge lässt sich mit einer Wohlordnung ausstatten. (Äquivalent steht jede Menge in Bijektion mit einer Ordinalzahl.)
]

Dieses Axiom ist ebenso äquivalent zum Auswahlaxiom. Insbesonder impliziert es, dass es ein Ordinalzahl der Kardinalität $|RR| = |P(ZZ)|$ gibt.

#rmk[Für jede Kardinalität $kappa$ gibt es eine kleinste Ordinalzahl, welche ebenfalls diese Kardinalität hat. Falls $kappa >= aleph_0 = NN$ nicht endlich ist, ist dies eine Limit-Ordinalzahl.]

Tatsächlich braucht man auch das Auswahlaxiom um so eine Ordinalzahl zu definieren bzw. anzugeben.
Nehmen wir zunächst ZF ohne Auswahlaxiom an. Dann kann man nämlich zeigen, dass ZF genau dann wiederspruchsfrei ist, wenn ZF + "Die reellen Zahlen lassen sich nicht wohlordnen" wiederspruchstfrei ist.

Das bedeutet insbesondere: Falls ZF konsistent ist, können wir damit nicht beweisen, dass es eine Wohlordnung auf $RR$ gibt, da sonst ZF + "$RR$ lässt sich nicht wohlordnen" inkonsistent wäre.


// _Melodie: „Ein Loch ist im Eimer“ (2005)_
#pagebreak()

#align(center)[
  #set heading(numbering: none)
  #block[
    #set align(left)
    == Äquivalenz
    Melodie: "Ein Loch ist im Eimer" (2005)

    *1.*
    Wie beweis ich das Lemma, das Lemma, das Lemma, \
    Wie beweis ich das Lemma, das Lemma von Zorn?

    *2.*
    So nimm doch zu Hilfe, zu Hilfe, zu Hilfe, \
    So nimm doch zu Hilfe das Auswahlaxiom!

    *3.*
    Wer hat's mir gegeben, gegeben, gegeben, \
    Wer hat's mir gegeben das Auswahlaxiom?

    *4.*
    Zermelo und Fraenkel, und Fraenkel, und Fraenkel, \
    Zermelo und Fraenkel mit dem Wohlordnungssatz!

    *5.*
    Woher kommt er denn wirklich, denn wirklich, denn wirklich, \
    Woher kommt er denn wirklich, der Wohlordnungssatz?

    *6.*
    Der folgt aus dem Lemma, dem Lemma, dem Lemma, \
    Der folgt aus dem Lemma, dem Lemma von Zorn!

    Und nun von vorn! Und dabei immer schneller werden!
  ]
]

#pagebreak()

// Melodie: Ein Loch ist im Eimer (2005)
//
//     Wie beweis ich das Lemma, das Lemma, das Lemma,
//     Wie beweis ich das Lemma, das Lemma von Zorn?
//
//     So nimm doch zu Hilfe, zu Hilfe, zu Hilfe,
//     So nimm doch zu Hilfe das Auswahlaxiom!
//
//     Wer hat's mir gegeben, gegeben, gegeben,
//     Wer hat's mir gegeben das Auswahlaxiom?
//
//     Zermelo und Fraenkel, und Fraenkel, und Fraenkel,
//     Zermelo und Fraenkel mit dem Wohlordnungssatz!
//
//     Woher kommt er denn wirklich, denn wirklich, denn wirklich,
//     Woher kommt er denn wirklich, der Wohlordnungssatz?
//
//     Der folgt aus dem Lemma, dem Lemma, dem Lemma,
//     Der folgt aus dem Lemma, dem Lemma von Zorn!
//
//     Und nun von vorn! Und dabei immer schneller werden!

// Jetzt geben wir noch zwei heuristische Argumente an um zu verdeutlichen, dass wir einfach nicht so viel Kontrolle über große Ordinalzahlen haben.
//
// Es ist eine unbeantwortbare Frage ob folgende Aussage in ZFC stimmt:
//
// #axiom[(Kontinuumshypothese CH) Es gibt keine Kardinalität echt zwischen $aleph_0$ und $|RR|$.]
//
// Tatsächlich ist ZFC + CH, also ZFC zusammen mit der Kontinuumshypothese genau dann Wiederspruchsfrei, wenn ZFC das ist. Man sagt, dass ZFC und ZFC + CH äquikonsistent sind. Genauso ist aber ZFC und ZFC + CH äquikonsistent.
//
// Heuristisch können wir nun wiefolgt argumentieren:
//
// Angenommen wir können eine Ordinalzahl $hat(omega)$ mit $|hat(omega)| = |RR|$ explizit angeben. Sei $aleph_1 <= |RR|$ die erste Kardinalzahl größer als $aleph_0$. Dann gibt es eine (kleinste) Ordinalzahl $hat(omega)' subset hat(omega)$ mit dieser Kardinalität. Da ZFC unabhängig von CH ist, kann unsere Konstruktion von $hat(omega)$ aber nicht genug Information haben um CH zu testen.
