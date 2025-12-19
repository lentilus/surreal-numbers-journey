#import "template.typ": *
#show: template

= Konstruktionen bekannter Zahlenräume

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
