#import "template.typ": *
#show: template

= Rot-Gruen-Hackenbush

== Herzlich Willkommen

Hallo, Ich bin Linus/Felix.

#orga[
  - Wenn ihr Probleme / Anmerkungen habe, kommt zu uns oder Vertrauenspersonen.
  - Was erwartet ihr von dem Kurs?
  - Was ist euer mathematischer Hintergrund?
  - Ihr koennt immer Fragen einwerfen, oder nach dem Kurs direkt zu uns kommen!
  - Wir wollen niemanden verlieren.
]

Wir wollen uns ein Spiel namens _Hackenbush_ anschauen. Die Spielregeln sind wie folgt.

#let game = [
  - R
  - B
    - R
]
== Spielregeln
- Es gibt zwei Spieler, _Rot_ und _Blau_.
- Ein Spiel sieht z.B so aus $#hackenbush-position(game)$.
- Das Spiel wird in abwechselnden Zuegen gespielt. Im eigenen Zug darf ein Strich der eigenen Farbe entfernt werden.
Stirche die dann nicht mehr mit dem Boden verbunden sind werden auch entfernt.
- Ist man am Zug und kann keinen Strich entfernen, hat man verloren.


#example[
  In diesem Spiel gewinnt immer _Rot_ (wenn man richtig spielt).
  $
  #hackenbush-position[
    - R
      - R
    - B
  ]
  $
]

#example[
  In diesem Spiel gewinnt immer _Blau_.
  $
  #hackenbush-position[
    - B
      - R
    - B
  ]
  $
]

#example[
  In diesem Spiel gewinnt immer der zweite Spieler.
  $
  #hackenbush-position[
    - R
    - B
  ]
  $
]

#orga[
  Jetzt lassen wir die Leute sich selber Spielpositionen ueberlegen und lassen sie schauen wer dann gewinnt.
  Vielleicht kann man ein paar am Whiteboard besprechen?
]


#comment[Warum fragen wir das hier?]
- 1/2
- ein kompliziereres -1/2
- Irgendwas mit kreisen


Was wir jetzt machen können: 
Wissen das zwei Spiele win für rot sind: Wenn wir sie zusammen tun immernoch win für rot.
Wir wollen das irgendwie quantifizieren.
Vielleicht erinnern: Spiele sind Zahlen... was wäre, wenn wir sagen

Jetzt ist die Idee: wenn wir wissen das zwei Spiele von _Rot_ gewonnen werden,
und wir "tun die Spiele zusammen",
dann sollte _Rot_ dieses Spiel immernoch gewinnen. Jetzt sagen wir

#let one = hackenbush-position[ - R ]
#let minus-one = hackenbush-position[ - B ]
$
  #one := 1, .. "und" #minus-one := -1
$

Was wuerdet ihr denken welchen Wert die folgenden Spiele haben?

#let two = hackenbush-position[
  - R
  - R
]

#let zero = hackenbush-position[
  - R
  - B
]

#puzzle($2$)[
  $#two = dots$
][
  $#two = 2$
]

#puzzle($0$)[
  $#one + minus-one = dots$
][
  $#one + minus-one = 0$
]

Fazit: Das kling sinnvoll.
Wir legen fest: *Spiele addiert man indem man sie zusammen tut.*

#puzzle[$1/2$][
  Findet ihr eine Position die den Wert $1/2$ haette?
][
  $#hackenbush-position[
    - R
      - B
  ]$
]

#puzzle[$-3/4$][
  Findet ihr eine Position die den Wert $-3/4$ haette?
][
  #comment[TODO]
]

#puzzle[$-1/2$][
  Findet ihr eine Position die den Wert $-1/2$ haette?
][
  $#hackenbush-position[
    - B
      - R
  ]$
]

Wie ist die Beziehung von $1/2$ und $-1/2$? Wir sehen:
*Man negiert Spiele, indem man _Rot_ mit _Blau_ und _Blau_ mit _Rot_ ersetzt.*


Rmk: Es gibt versch Spiele mit dem selben Wert. Aber die Addition ist davon unabhängig.
Wir können also sagen, das zwei Spiele äquivalent sind, wenn G-H =ca= 0
Ergibt sinn.

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
  #hackenbush-position[
    - R
      - B
        - R
          - B
            - R
              - B
                - ...
  ] = 2/3
  $.
]

Jetzt experimentieren wir etwas rum.

(Ein Gefühl für Ordinals)
Q: Nur blaue
Q: Nur blaue und nur rote
Q: 2x nur blaue und 1x nur rote

Wir haben jetzt spielen (t.w. sehr große) Zahlen zugeordnet.
Und damit können wir sie vergleichen. Und wenn Zahl größer als 0 gewinnt immer... bla.

Könnt ihr euch Zahl ausdenken, die kleiner ist als 1/n für alle n?

Q: e = 1/omega^n

Könnt ihr euch noch eine kleinere Zahl vorstellen?
A: 1/(omega^n + 1)

Falls die Frage kommt: Was genau ist ein Spiel:
Wir werden nächste? Schiene formalisieren was diese Zahlen sind. Und dann wird hoffentlich auch direkt klar, was mögliche Hackenbush Spiele sind. Aber die Kurze antwort: Wenn es keine Kreise gibt, dann hast du eine Funktion die jeder kleineren Zahl als Ordinal eine Farbe zuordnet. (Insb. sind alle Spiele endlich)

Q: 1/2 Omega
Müsste rot und blau Omega übereinander sein?

Q: Wie sieht Omega x Omega aus?


Wir haben jetzt ein ziemlich gutes Gefühl für Red-Blue Hackenbush. Aber jeder Informatiker weiß:
Man braucht RBG und nicht nur RB. Also grün..

Wir spielen jetzt Hackenbush auch mir grünen Strichen. Die können beide durchschneiden.

Bsp: Grüner mit Rotem darüber und Grüner mit blauem darüber. (?) Es soll halt noch nicht dazu führen, dass "Grün - seltsam" ist

Schaut euch mal diese Position an:

Felix Blume
- Ist sie positiv? => Ja
- Ist sie < 1/2?
- Welchen Wert hat sie?
=> Kleiner als 1/omega

Nennen wir UP

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

