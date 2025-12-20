#import "template.typ": *
#import "hackenbush.typ": *
#show: template

= Rot-Gruen-Hackenbush

Wir wollen uns ein Spiel namens _Hackenbush_ anschauen. Die Spielregeln sind wie folgt.

#comment[
  Getting back the list from a comment is reallllly hard.
  If you want to use that syntax though, you can try to convert it into my normal form (see also hackenbush.typ)

  I have written two methods to render hackenbush. One for general applications and one for easy applications. For examples see the comments in hackebush.typ
  I didn't write docs (yet?) though.

  Longterm maybe we want to add some formatting or so on top of it.
]

== Spielregeln von RG-Hackenbush
- Es gibt zwei Spieler, _Rot_ und _Blau_.
- Dazu passend gibt es _blaue_ und _rote_ Striche.
- Jeder Strich ist entweder direkt, oder ueber andere Striche mit dem Boden verbunden.
- Und so sehen Spiele aus.

$
#directed_hackenbush((("R", "B"), "B"))
#directed_hackenbush((("R", "B", "R"),))
#directed_hackenbush((("R", "R"),))
$

- Das Spiel wird in abwechselnden Zuegen gespielt. Im eigenen Zug darf ein Strich der eigenen Farbe entfernt werden.
  Stirche die dann nicht mehr mit dem Boden verbunden sind werden auch entfernt.
- Ist man am Zug und kann keinen Strich entfernen, hat man verloren.


#example[
  Nehmen wir an, es wird optimal gespielt.
  Dann gewinnt in (a) immer _Rot_,
  in (b) immer blau und
  in (c) immer der zweite Spieler.
  $
   limits(#directed_hackenbush((("R", "R"), "B")))_"(a)"
   limits(#directed_hackenbush((("B", "R"), "B")))_"(b)"
   limits(#directed_hackenbush(("R", "B")))_"(c)"
  $
]

#orga[
  Jetzt lassen wir die Leute sich selber Spielpositionen ueberlegen und lassen sie schauen wer dann gewinnt.
  Vielleicht kann man ein paar am Whiteboard besprechen?
]

#comment[AB HIER MUSS ALLES AUF VORZEICHEN GEPRUEFT WERDEN, WEIL ICH LOST WAR]

== Ganzzahliges Hackenbush
Jetzt ist die Idee: wenn wir wissen das zwei Spiele von _Rot_ gewonnen werden,
und wir "tun die Spiele zusammen", dann sollte _Rot_ dieses Spiel immernoch gewinnen. Jetzt sagen wir

#let one = directed_hackenbush(("B",))

#definition[
  Ein Spiel wo stehts der Startspieler verliert heisst $0$-Spiel. Und
  $
   #one := 1,
  $
]

//#let zero = directed_hackenbush(((),))
#comment[TODO]
#let zero = $dots dots dots$
#let minus-one = directed_hackenbush(("R",))

Was wuerdet ihr denken welchen Wert die folgenden Spiele haben?

#let two = directed_hackenbush(("B", "B"))
#let one-minus-one = directed_hackenbush(("R", "B"))
#let zero = directed_hackenbush(("R", "B"))
#let half = directed_hackenbush((("R", "B"),))
#let minus-half = directed_hackenbush((("B", "R"),))
#let three-halfs = directed_hackenbush((("B", ("R", "B")),))
#let minus-three-fourths = directed_hackenbush((("R", ("B", "R")),))

#puzzle[Ganzzahlige Werte][
  $
  limits(two)_2 .. limits(#minus-one)_(-1) .. limits(#one-minus-one)_0
  $
][]

Fazit: Das kling sinnvoll.

#definition[
  Wir legen fest, Spiele addiert man indem man sie zusammen tut.
]

== Diadisch

#puzzle[$1/2$][
  Findet ihr Spiele mit den folgenden Werten?
  $
   "(a)" 1/2 .. "(b)" 3/2 .. "(c)" -3/4 .. "(d)" -1/2
  $
][
  Loesungen waeren zum Beispiel:
  $
   limits(half)_(1/2)
   limits(#three-halfs)_(3/2)
   limits(#minus-three-fourths)_(-3/4)
   limits(#minus-half)_(-1/2)
  $
]


Wie ist die Beziehung von $1/2$ und $-1/2$? Wir sehen:

#definition[
  Man negiert Spiele, indem man _Rot_ mit _Blau_ und _Blau_ mit _Rot_ ersetzt.
]


Rmk: Es gibt versch Spiele mit dem selben Wert. Aber die Addition ist davon unabhängig.
Wir können also sagen, das zwei Spiele äquivalent sind, wenn G-H =ca= 0
Ergibt sinn.

#puzzle[Rechnen, rechnen, rechnen][
$
  limits(#directed_hackenbush(
    (("B", "R", "R"),)
  ))_(1/4)
  limits(#directed_hackenbush(
    (("R", ("B", "B")),)
  ))_(-1/4)
  limits(#directed_hackenbush(
    (("R", ("R" ,"B")),)
  ))_(-1 1/2)
  limits(#directed_hackenbush(
    (("B", "B", ("R" ,"B")),)
  ))_(1 1/2)
  limits(#directed_hackenbush(
    (("B", "R", "R", "R"),)
  ))_(1/8)
  limits(#directed_hackenbush(
    (("R", "B", ("B", "B")),)
  ))_(-1/8)
  limits(#directed_hackenbush(
    (("B", "R", ("R", "B")),)
  ))_(3/8)
$
][]

#puzzle[$1/3$][
  Findet ihr ein Spiel mit dem Wert $1/3$?
][
  mit endlich vielen Strichen kommen wir "nur" beliebig nah dran.
]

#puzzle[Followup-Frage][
  Welche Zahlen koennen wir also mit endlich vielen Strichen darstellen?
  #comment[
    Leute bitten, dass einfach heuristisch zu machen, sonst nehmen wir glaube ich schon Erkenntnisse vorweg, die wir erst bei "Binärdarstellung" haben wollen.
  ]
][
  $+- n/2^m$, fuer beliebige natuerliche Zahlen $n$ und $m$.
]

#puzzle[Dezimaldarstellung $1/3$][
  Wie wird $1/3$ in Dezimalschreibweise dargestellt? Und wie haengt das mit unserer Situation zusammen.
  #comment[
    Diese Frage ist noch zu inkronkret um ein gutes Raetsel zu sein.
    Im Allgemeinen fuehlt sich diese Frage komisch als "Raetsel" an.
  ]
][
  $0.3333 dots$

  - Krasse Antwort (nicht erwartet): Mit Dezimaldarstellung lassen sich im Allgemeinen nur _rationale Zahlen_ der Form $a/10^n$ darstellen. Irrationale Zahlen lassen so gar nicht darstellen. Durch Vervollständigung, also das Hinzufuegen aller Grenzwerte finden wir die uebrigen reellen Zahlen.
]

_Wie koennen wir diese Idee von der Vervollständigung von $QQ$ zu $RR$ auf Hackenbush-Spiele uebertragen?_

Etwas konkreter, wir wollen eine kanonische Darstellung von einer Zahl als Hackenbush-Position haben, die sinnvoll ist.
_Als kleiner Gedankenanstoss:  Wenn wir a mal 2^-k nebeineinander Stellen ist das doof, weil sie sehr unterschiedlich aussehen.
Bei a/2^n ist alles gleich für den Anfang und nur das Ende (was immer weniger wichtig wird - epsilon und so - wird verändert)_

#orga[Nach Vorschlaegen hoeren, aber kein Raetsel]

Wie waere es wenn man, wenn man die immer weiter aufeinander stellt?

#puzzle[Binärdarstellung][
  Was passiert, wenn wir einen blauen haben, dann einen Roten und dann in irgendeiner Reihenfolge
][
  _Die antwort kann abstrakt oder explizit sein_

  $-->$ Binärdarstellung!!! (WOOOOOWWWW)
]

Das heißt, wenn wir einen guten (abzaehlbar) unendlichen Stack haben ist alles toll.

#orga[Leute fragen, ob das allen klar ist.]

So vorstellen undendlich viele übereinander, aber wenn man unten einen wegnimmt verschwinden alle drüber.

#puzzle[$2/3$][
  Diesmal ernsthaft: Wie kann man $2/3$ als Hackenbush-Position darstellen?
  Probiert es aus!
][
  Immer abwechselnd rot und blau ergeben
  $
  #hackenbush(
    ((0, 0), (0, 1), (0, 2), (0, 3), (0, 4), (0, 5)),
    ((0, 1, red), (1, 2, blue), (2, 3, red), (3, 4, blue), (4, 5, black, "dashed")),
  ) = 2/3
  $.
]

Jetzt experimentieren wir etwas rum und wollen ein Gefuehl fuer solche _Tuerme_ bekommen.


== Grosses Hackebush

#puzzle[Blauer Turm][
  Welchen Wert wuerdet ihr dem (unendlich hohen) Turm aus nur blauen Segmenten zuordnen?
  $
   #hackenbush(
    ((0, 0), (0, 1), (0, 2), (0,3)),
    ((0, 1, red), (1, 2, red), (2, 3, red, "dashed")),
  )
 $
][
  Der Turm ist groesser als jede endliche Zahl. Egal welches Spiel mit endlich vielen Segmenten wir dazu addieren, blau gewinnt immer. Sei Wert ist also irgendwie $oo$.
]

#puzzle[Blauer Turm + roter Turm][
  Welchen Wert wuerdet ihr diesem Turm zuordnen?

  $
  #hackenbush((
    (0,0), (0,1), (0,2), (0,3),
    (1,0), (1,1), (1,2), (1,3),
  ),
    (
      (0,1, blue), (1,2, blue), (2,3, blue, "dotted"),
      (4,5, red), (5,6, red), (6,7, red, "dotted")
    )

  )
  $
][
  1. Ein Argument dafuer, dass der Wert 0 ist, waere, dass das Spiel genauso aussieht, wenn wir es invertieren.
  2. Anderes Argument: Erster Spieler muss seinen Stamm auf Hoehe $n$ abschneiden. Zweiter Spieler schneidet dann seinen bei $n+1$ ab.
     Also verliert, wer beginnt, also $0$.
]

#let blue-tower = directed_hackenbush((("B", "...B"),))

#puzzle[Blauer + blauer + roter Turm][
  Welches "einfachere" Spiel hat den gleichen Wert wie dieses Spiel?
  $
  #directed_hackenbush((
      ("B", "...B"),
      ("B", "...B"),
      ("R", "...R"),
  ))
  $
][
  $
  #directed_hackenbush((
      ("B", "...B"),
      ("B", "...B"),
      ("R", "...R"),
  )) = #blue-tower
  $

]

#definition[
  Wir nennen $#blue-tower$ jetzt $omega$.
]

Wir haben jetzt spielen (t.w. sehr große) Zahlen zugeordnet.
Und damit können wir sie vergleichen. Und wenn Zahl größer als 0 gewinnt immer... bla.

#puzzle[Wald der grossen Baueme][
  $
  #directed_hackenbush((("B","B", ("B", "B", ("B", "B", ("B", "...B", "...B", "...B") ,"B"), "B"),"B"),))

  #directed_hackenbush((("R","B", ("R", "B", ("R", "B", ("R", "...B", "...R", "...B") ,"B"), "B"),"B"),))
  #directed_hackenbush((("B",("B", "...B"), ("B", ("B", "...B"), ("B", ("B", "...B"), "...B" ,("B", "...B")), ("B", "...B")),("B", "...B")),))
  #directed_hackenbush(((("B", ("B", ("B", "...B", "...B"), ("B", "...B", "...B")), ("B", ("B", "...B", "...B"), ("B", "...B", "...B")))),))
  $
][]


#puzzle[Seeehr kleine Zahl][
  Könnt ihr euch Zahl ausdenken, die kleiner ist als $1/n$ für alle $n$?
][
  Ein Beispiel waere
  $
  #directed_hackenbush((("B", ("R", ("...R", ))),))
  $
  #comment[Hier stand 1/omega^n, aber ich denke, dass sollte 1/omega sein, oder?]
]

#puzzle[Noch kleiner][
  Könnt ihr euch noch eine kleinere Zahl vorstellen?
][
  Wie waere es mit $1/(omega + 1)$
]

#orga[
  Falls die Frage kommt: Was genau ist ein Spiel:
  Wir werden nächste? Schiene formalisieren was diese Zahlen sind. Und dann wird hoffentlich auch direkt klar, was mögliche Hackenbush Spiele sind. Aber die Kurze antwort: Wenn es keine Kreise gibt, dann hast du eine Funktion die jeder kleineren Zahl als Ordinal eine Farbe zuordnet. (Insb. sind alle Spiele endlich)
]


#puzzle[Omega Halbe][
  Wie koennen wir $1/2 omega$ als Hackenbush-Position konstruieren?
][
  Müsste rot und blau Omega übereinander sein?
]

#puzzle[Omega x Omega ][
  Der Titel ist Programm.
][
  $omega$ viele $omega$ hohe blaue Tuerme.
  #comment[Das stimmt glaube ich nicht. Omega 1er Tuerme neben einander ist nicht einfach nur omega. Tatsaechlich ist das Spiel nicht einmal mehr finite. Aso muss das irgendwie anders sein.]
]

Wir haben jetzt ein ziemlich gutes Gefühl für Red-Blue Hackenbush. Aber jeder Informatiker weiß:
Man braucht RBG und nicht nur RB. Wo bleibt also _Gruen_?

= RGB-Hackenbush
=== Zusatzregeln
- Wir spielen jetzt Hackenbush auch mir grünen Strichen, die können beide durchschneiden.

#orga[
  Teilis sollen noch nicht merken, dass "Grün - seltsam" ist.
]


#let one-over-hundred-sixty-four = ("B", ("R", ("R", ("R", ("R", ("R", "R"))))))
#let minus-one-over-hundred-sixty-four = ("R", ("B", ("B", ("B", ("B", ("B", "B"))))))

#puzzle[Felix-Blume][
  Jetzt schaut euch dieses Spiel an. Kleiner Spoiler, wir kennen noch nichts woraus wir auf den genauen Wert schliessen koennen, aber versucht mal moeglichst nah dran zu kommen. 
  $
  limits(#directed_hackenbush((("G", "B"),)))_"Felix-Blume"
  $
][
  Wir sehen, dass $-1/(2^n) < "Felix-Blume" < 1/(2^n)$.
  $
  limits(#directed_hackenbush((("G", "B"), one-over-hundred-sixty-four)))_"(a)"
  ..
    limits(#directed_hackenbush((("G", "B"), minus-one-over-hundred-sixty-four)))_"(b)"
    $

  #definition[
    Wir nennen den Wert von der Felix-Blume jetzt $up$ (_up_).
  ]
]


#puzzle[Ultra klein][
  Ist $up$ auch kleiner als $1/omega$?
][
  Ja.
]

Vlt schauen wir uns mal einfach nur den grünen Stängel an..
Wer gewinnt?
=> der erste Spieler
Passt also nicht ganz zu unseren Sachen
=> (RB)G Hackenbush ist seltsam

Schauen wir mal an, wie sich die Sachen verhalten.

Wir haben immernoch die Definitionen:
a = b, falls...
Sagen jetzt a | b falls... n-m immer gewonnen oder verloren wird => größer/kleiner 0

Schauen uns mal ein Paar bespiele an..
Was ist das inverse von 1 grün? (Stern)
Was ist das inverse von 2 grün? (Stern2)
=> Inverse von allen grünen ist toll

Was ist
1 grün + 2 grün? ... 3 grün
Was ist
1 grün + 3 grün? ... 2 grün
(entweder: selbst-invers, oder ausprobieren)
=> Nicht mit 0 vergleichbar

Q: Ist größer, kleiner transitiv?
Ja
Q: Ist vergleichbar transitiv?
Nein

Wir wissen: 0 ist nicht vergleichbar mit $*$
Q: Findet ihr eine Stellung die sowohl mit 0 als auch 1 nicht vergleichbar ist?

[Important Mindfuck]
Q: Findet ihr eine Stellung, die mit 0 nicht vergleichbar ist, aber so dass 2 mal die Stellung mit 0 vergleichbar ist?
A: Omega grün, dann 1 Blau

Rmk: Asymmetrie
Es gibt viele Postionen, wo der erste Spiele gewinnt - die qualitativ underschiedlich sind. Aber wenn der zweiter Spieler gewinnt (0) sind sie alle ähnlich (First Move advantage)

