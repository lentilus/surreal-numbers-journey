#import "template.typ": *
#import "hackenbush.typ": *
#show: template

= Getting Nimble with Nimbers \ _Impartial Games_

#orga[
  Es folgt kleine Wiederholung von Schiene 1
 - Wir hatten _rot_ und _blau_, und alles war schoen.
 - Das haben wir dann in der letzten Schiene richtig gut formalisiert.
 - Jetzt erinnern wir uns aber, da war ja noch gruen, und gruen war irgendwie komisch...
 $-->$ Darum geht es jetzt!
]

== Regeln fuer RGB-Hackenbush
- Wir erweitern die bekannten RB-Hackenbush-Regeln.
- Es gibt jetzt auch _gruene_ Striche. Diese duerfen von beiden Spieler*innen entfernt werden

Wir haben in der ersten Schiene gesehen, dass wir nicht wirklich wissen was der Wert von
$#directed_hackenbush((("G", "B"),))$ ist.

Als wir das erste mal Addition fuer surreale Zahlen eingefuehrt haben,
haben Werte von Spielen bestimmt, indem wir zu anderen Spielen addiert haben,
sodass das die Summe ein $0$-Spiel ist. Darueber konnten wir Rueckschlueese auf
den Wert Spiels schliessen. Vielleicht koennen wir so den gruenen Stengel versuchen
zu verstehen.

Wir wollen, jetzt ein bisschen Theorie fuer gruenes Hackenbush entwickeln, aber
damit wir das spaeter hilft _RGB_ zu verstehen, muss alles was wir mit gruen machen kompatibel bleiben,
mit den Sachen, die wir fuer _RB_ gefordert haben. Wir sagen also weiterhin, dass

- $0$ genau die Spiele sind, die vom Startspieler verloren werden,
- zwei Spiele $G$ und $C$ gleich sind, wenn $G - C = 0$ ist,
- und $a$ groesser als $b$, in Zeichen $a | b$, wenn $a - b$ stehts von _Blau_ gewonnen wird.

#let single-green = directed_hackenbush((("G"),))
#let double-green = directed_hackenbush((("G"),("G")),)
#puzzle[Dem Gruenling auf die Schliche kommen][
  Wie kann man unseren mysterioesen gruenen Freund in eine Summe stecken, dessen Wert wir klar bestimmen kennen?
  $
  limits(#single-green)_"Der Gruenling"
  $
][
  Wir sehen, dass 2 _Gruenlinge_ 0 ergeben.
  $
  #double-green = 0
  $
]

Man koennte jetzt sagen, wenn zwei _Gruenlinge_ 0 ergeben, sollte der einzelne
_Gruenling_ auch 0 sein. Das wollen wir aber nicht, denn wir haben ja gesagt, dass
genau die 0-Spiele den Wert 0 haben sollen. Wenn man den _Gruenling_ aber ausspielt,
ist direkt klar, dass es sich hier nicht um ein 0-Spiel handelt.

#rmk[
  Ein kleiner Spoiler, aber ein sinnvolle Anmerkung: In einem Koerper koennen wir nur
  aus $a + a = 0$ schliessen, dass $a=0$, wenn unser Koerper eine Charakteristik ungleich 2 hat.
  Wie wir gleich sehen, waere dass aber inkompatibel mit unseren Forderungen an die Addition.
]

Wir haben gesehen, der Gruenling ist nicht mit 0 _verleichbar_, denn $0 - ** = **$, denn $** + **$ war ja $0$.

#puzzle[][
Findet ihr eine Stellung die sowhol mit 0 als auch mit 1 nicht vergleichbar ist?
][]

#puzzle[Important Mindfuck][
  Findet ihr eine Stellung, die mit 0 nicht vergleichbar ist, aber so dass 2 mal die Stellung mit 0 vergleichbar ist?
][
Omega grün, dann 1 Blau.
]

Der _Gruenling_ passt also nicht ohne weiteres in unsere Vorstellung der Arithmetik surrealer Zahlen,
die wir letzte Schiene studiert haben. Die Idee ist, wir studieren jetzt erstmal
wie gruenes Hackenbush sich unter unserer Definition von Addition und Multiplikation verhaelt.
Dann koennen wir uns spaeter der etwas schwierigeren Aufgabe widmen, beide zusammen zu bringen
um zum Beipiel das Raetsel um die _Felix-Blume_ zu lueften.


Wir greifen jetzt auf die Strichnation zurueck, und sehen.

$
"Gruenling" = { 0 | 0}
$

Hier faellt uns direkt schon etwas auf, was bei RB-Hackenbush nicht so war.
Naemlich ist das, was links steht, nicht mehr strikt kleiner als das was rechts steht.
In diesem Detail liegt schon sehr viel der Struktur, die RGB-Hackenbush besonders macht verborgen.
Aber dazu spaeter mehr.

Jetzt schauen wir uns erstmal an was fuer Verwandte des Gruenlings es so gibt.

#let two-snake = directed_hackenbush((("G", "G"),))
#let three-snake = directed_hackenbush((("G", ("G", ("G"))),))
#let n-snake = directed_hackenbush((("G", ("G", ("...G", "G"))),))
$

  limits(... ... ... ...)_"0-Schlange"
  .. limits(#single-green)_("1-Schlange" \ "(Gruenling)")
  .. limits(#two-snake)_"2-Schlange"
  .. limits(#three-snake)_"3-Schlange"
  .. limits(#n-snake)_"n-Schlange"
$

Guecken wir uns gruene $n$-Schlangen an, erkennen wir den _Gruenling_ direkt als
$1$-Schlange und die $0$ als $0$-Schlange. Damit wir nicht mehr so viel Schreib-Arbeit haben,
schreiben fuehren wir Notation fuer $n$-Schlangen ein.
$
**0 &:= { " " | " "} = 0 \
**1 &:= { **0 | **0} = 0 \
**2 &:= { **0, **1 | **0, **1 } = 0 \
& dots.v \
**n &:= { **0, **1, ... , **(n-1) | **0, **1, ..., **(n-1) } = 0
$

Fuer $**1$ schreiben wir auch einfach nur $**$.


#puzzle[Rechnen, rechnen, rechnen][
  Was sind die Ergebnisse der folgenden Summen? Tipp: Am besten benutzt ihr direkt die _Strichnotation_, dass ist einfacher, als wenn ihr die Spiele spielt.
  $
    ** + **2, .. **3 + **5, .. **3 + **6, .. **5 + **6
  $
][
  $
    ** + **2 = **3, .. **3 + **5 = **6, .. **3 + **6 = **5, .. **5 + **6 = **3
  $
]

#rmk[
 Wir werden geich noch sehen, wie man die Addition von zwei Nimbern ganz formal mit _Strichnotation_ definiert.
]

#puzzle[][
  Untersucht was passiert, wenn ihr die Addition zweier Nimber $n$ und $m$ unter Binaerschreibweise von $n$, $m$ und $n+m$ betrachtet.
][
  XOR
]


#puzzle[Gruene Induktion][
  Die Notation fuer $n$-Schlangen suggeriert, dass wir den Zahlenraum der
  $n$-Schlangen induktiv/rekursiv definieren koennen. Solche Objekte schreien nach Induktion.
  In Schiene 2 haben wir Induktion in verschiedenen Kontexten gesehen.
  Ueberlegt euch, wie ein Inuktionsbeweis fuer eine Aussage ueber $n$-Schlangen aussehen muesste
  und zeigt damit die folgenden Aussagen.
  - #comment[Hier fehlen jetzt ein paar lustige Aussagen]
  - #comment[...]
][
  - TODO 
  Nimber sind also irgendwie komisch, aber woran liegt das?
  Was waren eure Strategien um die Werte der Summen auszurechnen?
]


#orga[
Vielleicht ist allen schon klar, dass _something_ + _something_ = 0
Dann kann man das naechste skippen
]


#puzzle[][
  Wie sieht es mit $**16 + **4$ aus?
][
  #comment[Is it really 16 + 4 = 0?]
  $**16 + **4 = 0$. Erkennt ihr ein Muster?
  Wir haben das nicht formal gezeigt, aber die Antwort ist, dass der Koerper der Nimber Charakteristik 2 hat. Das bedeutet, dass sich die Zwei bzgl. der Multiplikation wie 0 verhaelt. Deshalb ist $ a + a = 0$ fuer alle nimber.
  Wir haben noch gar nicht gesehen, wie die multiplikation auf Nimbern funktioniert, deshalb wissen wir technically hier noch gar nicht, dass Nimber ueberhaupt ein Koerper sind, aber wie die Multiplikation aussieht sehen wir gleich noch, wenn wir uns $"On"_2$ anschauen.
]

Das hat sehr lutige Implikationen und erklaert so ein bisschen warum die Nimber sich 
so "komisch" verhalten. Diese Erkenntinis hilft uns jetzt optimale Strategien fuer ein ganze Klasse an Spielen zu entwickeln, in denen Nimber wohnen.
Eines dieser Spiele ist Nim.

== Nim Spielregeln
#comment[TODO]
1. Abwechselnde Zuege beider Spieler
2. Ein Zug ist: Einen Stapel um beliebige Anzahl Muenzen kleiner machen
3. Wer nicht ziehen kann verliert.

#orga[
Leute kurz Nim spielen lassen, damit sie sehen, dass es genau wie G-Hackenbush ist.
]

Nimber tauchen ueberall auf, wo beide Spieler die gleichen Zuege machen koennen.
Diese Spiele nennt man auch _Impartial Games_.



Nimb-Arithmetik erlaubt uns solche Spiele, oder solche Teile von Spielen zu untersuchen.

#comment[
  TODO: How to win nim
]

#puzzle[Win Nim][
  Wie gewinnt man nim?
  Tipp: Wenn der erste Spieler es schafft, das Spiel zu einem 0-Spiel zu machen,
  hat er gewonnen. Natuerlich kann man nicht jedes Nim-Spiel gewinnen, wenn man am Zug ist (ein ganz einfach Genbeispiel waere 0),
  aber vielleicht findet ihr trotzdem eine gute Strategie, fuer die Faelle, die nicht hoffnungslos sind.
][]

== Green Trees
Wir hatten eben die Schlangen gesehen. Dort war es ja nicht besonders schwer den Wert einer Schlangen zu ermitteln.
Man hat einfach gezaehlt, wie lang sie ist. Aber wie sieht es mit Baeumen aus?

#orga[
  Wenn Leuten langweilig ist, kann man sie schon frueher raetseln lassen, was
  der Wert von einem gruenen Baum ist.
]

#orga[
  Baum ohne Annotation an's Whiteboard malen.
]

Wir wissen jetzt, wie man nim am besten spielt. Um herauszufinden, wie man "Baeume"
am besten spielt, finden wir Haeppchen-weise aequivalente Nim-Spiele. Wir starten an den Blaettern des Baums.
Jedes Blatt kann als _Nim_ 0-Spiel gesehen werden. Also beschriften wir die Blaetter mit 0en.

Jetzt laufen wir entlang jeder kante zum naechsten Knoten. Dort treffen sich dann 1, oder mehr Kanten. Dessen _Wert_ addieren wir dann wieder auf _Nim_-Weise und koennen so den Baum rekursiv bis zur Wurzel runter klettern. Am Ende ist der Ganze Baum bloss noch in _Nim_ Spiel.

#image("./assets/green-tree.png")


#comment[
  Noch offen : Circle collapsing und Fusion Principle (Winning Ways p. 193)
  - Winning Ways p. 191
]


== Exkurs $"On"_2$

Mithilfe der Addition und Multiplikation auf Nimbern koennen wir die Klasse aller _Ordinalzahlen_ mit einer Koerperstruktur ausstatten.
Tatsaechlich ist die Konstruktion, die wir uns gleich anschauen wollen, die "einfachste" Konstruktion die _Ordinalzahlen_ zum einem Koerper mit Charakteristik 2 machen.

Dafuer werden wir uns die _Simpicity-Rule_ zu Herzen nehmen. Wir erinnern uns, die _Simpicity-Rule_ hatte uns gesagt, wenn fuer die _Strichnotation_ mehrere Zahlen infrage kommen, die unsere Anforderungen erfuellen, dann ist die "korrekte" Zahle die simpelste -- das bedeutet, die Zahl die am fruehesten geboren wurde.

Sinnvoller Weise fuehren wir die Summe zweier Ordinalzahlen $alpha + beta$ auf die Summe kleiner, insbesondere vorher geborener Zahlen zurueck. Wir sagen jetzt.
$
alpha + beta := "mex" {alpha' + beta | alpha' < alpha} uu {alpha + beta' | beta' < beta}
$

#orga[Hier sichertellen, dass mex schon einmal eingefuehrt wurde oder hier dann einfueren.]

Sind $alpha$ und $beta$ endliche Ordinalzahlen erkennen wir die Addition als die Addition der Nimber $**alpha$ und $**beta$.


#orga[Das muessen wir die Teilis selber feststellen lassen]


#figure(
  image("./assets/nimaddition.jpg", width: 50%),
  caption: [Eine Additionstafel fuer Nimber mit Nim-Addition]
)

Lasst uns jetzt ueber Multiplikation nachdenken. Sei $alpha' < alpha$ und $beta' < b$, dann sind $alpha - alpha'$ und $beta - beta'$ beide nicht-negativ, also groesser als $0$.

#orga[
  Folgendes kann man auch sehr gut als Raetsel stellen, wenn man _mex_ vorher einfuert. Dann koennen Teilis selber darauf kommen und untersuchen, was well-behaved ist, und was nicht.
]

Wenn wir jetzt wollen, dass $"On"_2$ ein Koerper mit diese Multiplikation wird, dann muss also auch $(alpha-alpha') * (beta-beta') > 0$ Das koennen wir aber auch schreiben als $alpha * beta > alpha' * beta + alpha * beta' - alpha' * beta'$. Jetzt lassen wir wieder _Simplicity_ fuer uns arbeiten und kommen an bei
$
  alpha * beta := "mex" {alpha' * beta + alpha * beta' - alpha' * beta' | alpha' < alpha, beta' < beta}
$


#figure(
  image("./assets/nimmultiplication.jpg", width: 50%),
  caption: [Eine Multiplikationstafel fuer Nimber mit Nim-Multiplikation]
)

#puzzle[][
  Zeigt, dass die Nim-Multiplikation Assoziativitaet, Kommutativitaet und Distibutivitaet erfuellt.
][]


#puzzle[][
  Rechnet ein paar *kleine* Produkte von Nimbern aus.
][]

#puzzle[][
  1. Was passiert mit Fermat-2er-Potenzen, also $2^(2^n+1)$ bei der Multiplikation?
  2. Was passiert mit den Quadraten von Fermat-2er-Potenzen?
][
  1. Fuer Fermat-2er-Potenzen ist das Nimber-Produkt das gleiche wie das Produkt natuerlicher Zahlen.
  2. Quadrate von Fermat-2er-Potenzen $n$ sind $3/2 * n$ als Produkt von natuerlichen Zahlen.
]

#puzzle[][
  Leute $5 * 9$ _systematisch_ ausrechnen lassen.
][]


#comment[
  TODO: A small section on calculing products of ordinals smaller than $omega^omega^omega$
]


- https://math.stackexchange.com/questions/4834066/what-cut-should-be-made-in-a-green-hackenbush-game-after-solving-its-correspondi
- http://www.neverendingbooks.org/on2-conways-nim-arithmetics/
