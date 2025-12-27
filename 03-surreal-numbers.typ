#import "template.typ": *
#import "hackenbush.typ": *
#show: template

= Surrealen Zahlen

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
  [ Nein! Sei $G$ ein Spiel und $G'$ ein Spiel was aus $G$ folgt, nachdem $G$ einen Zug gemacht hat. Schauen wir uns $G' - G$ an. Wenn Blau anfängt kann es mit dem ersten Zug $-G$ in $-G'$ überführen und gewinnt damit als nun zweiter Spieler die Position $G' - G'$ durch einfach kopieren von Rots zügen. Wenn nun Rot anfängt, kann Blau immer entweder den vorherigen Zug von Rot kopieren, oder den aktuellen Zug von Rot kopieren. Sobald der zweite Fall erreicht wird, gewinnt Blau offensichtlich. Wenn die ganze Zeit der erste Fall bleibt, kann man sich durch überlegen, das blau auch gewinnen kann, da immer von Rot einen Zug machen kann, Blau auch einen Zug machen kann - also Rot zuerst dran ist ohne einen Zug machen zu können.

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

== Konstruktion

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
Insbesondere können wir damit zeigen, dass zwei surreale Zahlen gleich sind, wenn wir jeweils eine Position für sie finden. Bevor wir mit unserer Intuition für Hackenbush den surrealen Spielen mehr Struktur geben können brauchen wir noch das nächste Resultat. Wir haben gesehen, das ganz viele verschiedenen Hackenbush Positonen denselben Wert haben können. Es wäre praktisch, wenn wir eine regel hätten um für eine bestimmte Darstellung $x = {X_L| X_R}$ eine kanonische leichteste Darstellung hätten.

#thm[
  (Einfachkeitssatz) Sei $y = {Y_L, Y_R}$ eine surreale Zahl. Dann ist $y = x$ für eine (die) surreale Zahl mit dem kleinsten Geburtstag für welche gilt $ Y_L < x < Y_R. $
  Hier sagen wir
  $ x < Y_R :<=> not exists y in Y_R: y <= x. $
]

Wir werden später noch einen Beweis dazu sehen.

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

#puzzle(
  [Lagerfeuer],
  [
    Welchen Wert haben diese Lagerfeuer?

    $
      #hackenbush(((-1, 0), (0, 0), (1, 0), (0, 1), (0, 2)), ((0, 3, blue), (1, 3, blue), (2, 3, blue), (3, 4, red)))
      #hackenbush(((-1.5, 0), (-0.4, 0), (0.4, 0), (1.5, 0), (0, 1), (-0.4, 2), (0.4, 2)), (
        (0, 4, blue),
        (1, 4, blue),
        (2, 4, blue),
        (3, 4, blue),
        (4, 5, red),
        (4, 6, red),
      ))
    $
  ],
  [
    Wie nennen ein $(m,n)$-Lagerfeuer ein Lagerfeuer $G_(m,n)$ mit $m$ blauen und $n$ roten Zweigen. Dann haben wir die folgenden Werte:

    $
      G_(0,0) = 0 \
      G_(1,n) = - 1/2^n \
      G_(m,n) = {G_(m,n-1) | G_(m-1, n)} \
      G_(m,0) = -m \
      G_(2,1) = {G_(2,0) | G_(1,1)} = {-2 | - 1/2} = -1 \
      G_(3,1) = {G_(3,0) | G_(2,1)} = {-3 | - 1} = -2 \
      G_(2,2) = {G_(2,1) | G_(1,2)} = {-1 | - 1/2^2} = -1/2 \
      // G_(2,3) = {G_(2,2) | G_(1,3)} = {-1/2 | - 1/2^3} = -1/4 \
      G_(3,2) = {G_(3,1) | G_(2,2)} = {-2 | - 1/2} = -1 \
      // G_(3,3) = {G_(3,2) | G_(2,3)} = {-2 | - 1} = -3/2 \
      G_(4,1) = {G_(4,0) | G_(3,1)} = {-4 | - 2} = -3 \
      G_(4,2) = {G_(4,1) | G_(3,2)} = {-3 | - 1} = -2 \
      // G_(4,3) = {G_(4,2) | G_(3,3)} = {-2 | - 3/2} = -7/4 \
    $

    Entweder durch ausspielen, ausarbeiten oder finden einer rekusiven Formel erhalten wir:
    $ G_(3,1) = -2 $
    $ G_(4,2) = -2 $
    So eine rekursive Formel kann nicht zu einfach sein, da
    $ G_(4,3) = -7/4 $
  ],
)

#puzzle(
  [],
  [
    Was ist der Wert folgender Position?

    $
      // #directed_hackenbush((
      //   ("R", ("R", ("R", ("R", "...R", "...B"), ("B", "...B")), ("B", ("B", "...B"))), ("B", ("B", ("B", "...B")))),
      // ))
      #directed_hackenbush((("R", ("R", ("R", ("R", "...R", "B"), ("B",)), ("B",)), "B"),))
    $
  ],
  [
    Wir könnten es ausrechnen. Tatsächlich ist es hier aber leichter zu sehen, dass $G - 1 = 0$.
    // Sei $B_n$ ein endlicher Baum $B_n$ dieser Art mit Höhe $n$ (also $n$ roten und $n-1$ blauen Zweigen.)
    //
    //
    // Sei $B_n^k$ so ein Baum mit dem blauen Strich in Höhe $k$ entfernt. Dann ist
    // $ B_n^k >= B_n^{k+1}. $
    // Wir nehmen erstmal an, dass $B_(n-1) <= B_{n}$. Diese Aussage wird induktiv aus unseren Berechnungen folgern.
    //
    // Nun haben wir:
    // $
    //   B_1 = 1 \
    //   B_2 = {1/2 | 2} = 1 \
    //   B_3^3 = {B_2 | B_3^(3,2)} = {1| 2} = 3/2 \
    //   B_3 = {1 | B_3^3} = {1, 3/2} = 5/4 \
    // $
  ],
)

Kehren wir nochmal zurück zur Theorie. Wir verstehen endliche Ordinalzahlen (natürliche Zahlen) ja sehr gut.

#puzzle([], [Wie viele surreale Zahlen gibt es an Tag $n$?], [
  Genau $2^(n+1) - 1$. Seien $ x_1 < ... < x_m $ die Zahlen an Tag $n-1$. Dann gibt es am nächsten Tag neu genau die folgenden Zahlen:
  ${x_1 |} < {x_1 | x_2} < { x_2 | x_3 } < ... < {x_(m-1)| x_m} < {|x_m}$
  Also $m+1$ neue Zahlen.
  $ (2^(n+1) - 1) + (2^(n+1) - 1 + 1) = 2^(n+2) - 1 $
])

== Rechenoperationen

#question[Spiele konnten wir addieren, indem wir sie einfach zusammen tun. Wie würdet ihr Addition für surreale Zahlen definieren?]

#definition[
  Seien $x={X_L | X_R}$ und $y={Y_L | Y_R}$ zwei sureelle Zahlen.
  Dann ist addition induktiv definiert durch
  $ x + y := {X_L +y, x + Y_L | X_R + y, x + Y_L}. $
]

#question[Wie sehen additive Inverse aus?]

#definition[
  Seien $x={X_L | X_R}$ eine sureelle Zahl. Definiere das additive Inverse als
  $ -x := {-X_R|-X_L}. $
]

Wir können wieder mit Induktion zeigen, dass tatsächlich $x-x = 0$ und $-x$ die einzige Zahl mit dieser Eigenschaft ist.

#rmk[
  Nun, da wir Additon haben, können wir den Einfachkeitssatz zeigen. \
  https://math.stackexchange.com/questions/816540/proof-of-conways-simplicity-rule-for-surreal-numbers
]

Wir können mit Addition und mit Multiplikation mit $-1$ immerhin schonmal mit ganzen Zahlen multiplizieren. Mit allgemeinen surrealen Zahlen (oder sogar nur rationalen Zahlen) multiplizieren oder Inverse finden, ist sehr schwer.

#puzzle([$1/3$], [Was ist eine Hackenbush-Position für $1$ geteilt durch $3$?], [
  Es gibt keine gute (endliche) Lösung. Deshalb gibt es auch keinen guten Algoritmus eine Hackenbush-Position durch $3$ zu teilen. Hier wäre eine mit $omega +1$ Strichen:
  $ #hackenbush(
    ((0, 0), (0, 1), (0, 2), (0, 3), (0, 4), (0, 5), (1, 0), (1, 1)),
    ((0, 1, blue), (1, 2, red), (2, 3, blue), (3, 4, red), (4, 5, black, "dashed"), (6, 7, red)),
  ) $.
])

Welche Eigenschaften sollte eine Multiplikation für (surreale) Zahlen erfüllen?

- Distributivität $ a(b+c) = a b + a c $
- Kommutativität $ a b = b a $
- Einheit $ 1 a = a $
- Null $ 0 a = 0 $
- Verallgemeinert Multiplikation für z.B ganze Zahlen.
- Wohldefiniertheit

#puzzle(
  [Multiplication],
  [
    Findet ihr eine Definition für Multiplikation, die einige dieser Bedingungen erfüllt?

    Hinweise:
    - Sie ist schön, aber irgendwo auch nicht.
    - Sie ist induktiv. Wie könnt ihr die Hälften benutzen?
    - Was funktioniert für ganze/dyadische Zahlen?
  ],
  [
    #definition[
      Seien $x = {X_L| X_R}$ und $y = {Y_L | Y_R}$ zwei surreale Zahlen. Dann ist deren Produkt gegeben durch
      $
        x y := {
          X_L * y + x * Y_L − X_L * Y_L, X_R * y + x * Y_R − X_R * Y_R | \
          X_L * y + x * Y_R − X_L * Y_R, X_R * y + x * Y_L − X_R * Y_L
        }
      $
    ]
  ],
)

#puzzle(
  [$omega/2$],
  [Wie sieht $omega/2$ als surreale Zahl aus? Könnt ihr eine Hackenbush-Position finden?],
  [
    $ omega - n = {1,2,...| omega - (n-1)} $
    $ omega/2 = {1,2, ...| omega - 1, omega-2, ...} $
    Eine Hackenbush-Positon für $omega/2$ ist gegeben durch

    #align(center, [#directed_hackenbush((
      ("R", ("R", ("R", ("...R", ("B", ("B", ("B", "...B"))))))),
    ))])
  ],
)

#puzzle(
  [],
  [
    Was ist das Produkt von $omega$ und $epsilon$?
    #align(center, [
      #directed_hackenbush((
        ("R", ("R", ("R", "...R"))),
      ))
      #directed_hackenbush((
        ("R", ("B", ("B", "...B"))),
      ))
    ])
  ],
  [
    $ omega = {0,1,2,3,...|} $
    $ epsilon = {0 | 1, 1/2, 1/4,... } $
    $
      omega * epsilon = {
        n * epsilon + omega * 0 - n * 0, emptyset
        | n epsilon + omega * 1/2^n - k/2^n , emptyset
      } = {n epsilon | O(2^(-n) omega)}
    $

    Wir sehen, dass $ n epsilon < 1 < 2^(-n) omega, $ also ist $omega * epsilon = 1$, da $1$ die einfachste Zahl mit dieser Eigenschaft ist.
  ],
)

Man kann zeigen, dass Multiplikation wohldefiniert ist, gut mit $<=$ interagiert, es Inverse gibt und wir einen total geordneten Körper $op("Surr")$ erhalten.

Unsere Mengendarstellung kann man auch benutzen, um über RGB Hackenbush zu reden. Links tun wir wieder alle möglichen Positionen hin, in welche Rot das Spiel überführen kann und rechts die, in welche Blau das Spiel überführen kann.

#puzzle(
  [],
  [
    Finde eine Hackenbushpositionen, welche folgende "Werte" haben:
    #comment[Hier glaube ich star 2 und nicht 2 star.]

    $
      star = { 0 | 0 } \
      2 star = {0, star | 0, star} \
      {0, star | 0}
    $
  ],
  [
    Mögliche Lösungen sind:

    $
      #directed_hackenbush(("G",))
      #directed_hackenbush((("G", "G"),))
      #directed_hackenbush((("G", "R"),))
    $
  ],
)

Wir werden uns im nächsten Kapitel mehr damit beschäftigen.

== Non-standard Analysis

Wir haben gesehen, dass die rellen Zahlen in die surrealen Zahlen einbetten: Finde die Binärdarstellung und baue einen hohen Turm. Aber wir haben auch interessante Zahlen wie $epsilon$ mit

$ 0 < epsilon < 1/2^n. $

Mit diesen Zahlen können wir lustige Dinge machen. Betrachten wir zum Beispiel $f(x) = x^2$. Dann ist für sehr kleine $epsilon$:

$ f'(x) ~~ ((x + epsilon)^2 - x^2)/epsilon = 2 x + epsilon ~~ 2x $

Wir können das tatsächlich formeller machen!

#definition[
  Eine surreale Zahl $x$ heißt *endlich*, falls
  $ exists n in NN: -n < x < n. $
  Sie ist *unendlich*, falls sie nicht endlich ist. Sie ist *infinitesimal*, falls $1/x$ unendlich ist.
]

Man kann leicht prüfen, dass infinitesimale Zahlen unter Addition und Multiplikation (mit endlichen Zahlen) abeschlossen sind.

#rmk[
  Endliche Zahlen sind ein nullteilerfreier lokaler Ring (Local Integral Domain) in dem die infinitesimalen Zahlen das maximale Ideal bilden.
]

Reelle Zahlen sind in gewisser Weise dicht in den endlichen surrealen Zahlen:

#thm[
  Für jede endliche surreale Zahl $x$ gibt es eine eindeutige reelle Zahl, den Standart-Teil von $x$, $op("st")(x)$, so dass $x - op("st")(x)$ infinitesimal ist.
]

#proof[
  Es ist $ op("st")(x) = op("inf"){ r in RR | r >= x }. $
]

#definition[
  Sei $x$ eine surreale Zahl, dann ist der *Halo* von $x$ die Menge
  $ op("Halo")(x) = {y | x-y "ist infinitesimal" } $
  und das *Universum* von $x$ ist die Menge.
  $ {y | x-y "ist endlich" } $
]

Wir sehen damit, dass der endliche Teil der surrealen Zahlen eine disjunkte Vereinigung der Halos um die rellen Zahlen sind. Damit gibt es neben der Ordnungs-topologie noch eine andere offensichtliche Topologie, welche man den surrealen Zahlen geben kann. Und zwar jene generiert durch reelle Bälle:

$ B_RR (x, r) := { y | |op("st")(x-y)| <= r}. $

#orga[Wie können die surrealen Zahlen visualisieren als..]

Wir können nun endlich den Begriff der Ableitung (fast) definieren:

#definition[
  Sei $f: op("Surr") -> op("Surr")$ eine Funktion.
  Sei $x in RR$ und $epsilon$ eine infinitesimale Zahl. Dann heißt
  $ f'(x, epsilon) = op("st")((f(x+epsilon) - f(x))/epsilon) in RR $
  Ableitung von $f$ im Punkt $x$, falls $f'(x, epsilon)$ von $epsilon$ unabhängig ist.

  Sei $g : RR -> RR$ eine Funktion, für welche es eine Funktion $f: op("Surr") -> op("Surr")$ gibt, welche sich auf $RR$ zu $g$ einschränkt und welche in $x in RR$ differenzierbar ist. Dann heißt $g'(x) := f'(x)$ die Ableitung von $g$ in $x$ und sie ist eindeutig bestimmt.
]

Man kan prüfen, dass diese Ableitung im Punk $x$ falls sie existiert mit der Standart-Definition übereinstimmt.

Die richtige Definition wäre wiefolgt:

#definition[
  Es gibt einen Teilkörper der surrealen Zahlen, genannt die *Hyperreellen Zahlen* $HH$, sodass sich jede Funktion $f : RR -> RR$ kanonisch zu einer Funktion $HH -> HH$ erweitern lässt.

  Sei $f: RR -> RR$ eine Funktion. Diese erweitert sich kanonisch zu einer Funktion $f: HH -> HH$. Sei $x in RR$ und $epsilon$ eine infinitesimale Zahl in $HH$. Dann heißt
  $ f'(x, epsilon) = ("st")((f(x+epsilon) - f(x))/epsilon) in RR $
  Ableitung von $f$ im Punkt $x$, falls $f'(x, epsilon)$ von $epsilon$ unabhängig ist.
]

Wir sehen (oder glauben) also, dass eine surreale (hyprrelle) Funktion gleichzeitig Informationen über eine relle Funktion, sowie ihre Ableitungen hat, ohne Grenzwerte berechnen zu müssen. Tatsächlich kann man mit solchen Ideen Differenzialgleichungen lösen.

Desweiteren haben wir das Konzept von transfiniert Induktion gesehen. Es gibt tatsächlich ein paar Paper welche mit dieser Technik Beweise über stochastische Differenzialgleichungen führen:

1. Erweitere das betrachtete Problem/die Funktion zu einer hyperreellen Funktion (Einfach).
2. Beweise eine Aussage mittels Induktion (Mittelschwer).
3. Nehme den Standart-Teil und zeige, dass es das ist, was man will. (Oft das schwerste - aber die Aussage ist im Idealfall schon "bewiesen.")

Viele Aussagen - auch in der Analysis - benutzen das Auswahlaxiom  für Existenzaussagen. Damit kann man meist die resultierenden Objekte nicht gut darstellen. Mit den Hyperrellen (Surrellen) Zahlen kann man das aber umgehen:

Wir brauchen für die Konstruktion der hyperrellen Zahlen (surrealen Zahlen), oder zumindest für manche Eigenschaften bereits das Auswahlaxiom. Intuitiv, haben wir es damit schon "benutzt." Viele Aussagen oder Gleichungen, welche sonst nicht explizit zu machen sind, können durch benutzen einer hyperrellen Zahl $H$ explizit hingeschrieben werden.
Insbesondere hat man damit die Probleme durch das Auswahlaxiom nur beim Ausgangspunkt - den surrellen Zahlen - und kann damit konkret über ganz viele Probleme zu reden anstatt jedes mal eine neue Anwendung des Auswahlaxioms zu finden.

#puzzle(
  [],
  [
    Berechne die Ableitungen mithilfe von schlau gewählten Surrealen Zahlen. (Angenommen sie existieren ;)

    $ sqrt(x), 1/x, e^x $
  ],
  [

    Sei $epsilon'$ eine infinitesimale surrele Zahl.

    Für $sqrt(x)$ betrachte $epsilon = 2 sqrt(x) epsilon' + (epsilon')^2$. Dann ist
    $
      (sqrt((sqrt(x)+epsilon')^2) - sqrt(x))/(2 sqrt(x) epsilon')
      = (epsilon')/ (2 sqrt(x) epsilon' + (epsilon')^2)
      = 1/ (2 sqrt(x) + epsilon') = 1/2 sqrt(x).
    $

    Analog folgen die Ableitungen für $1/x$ und
    $e^x = sum_(k=0)^infinity (x^k)/k! = 1 + x + x^2/2 + ...$
  ],
)

Diese spezifischen Beispiele lassen sich $1 : 1$ zu Aussagen mittels bestimmter gegen $0$ konvergierender Folgen übersetzen.
