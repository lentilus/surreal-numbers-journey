#import "template.typ": *
#show: template

= Rot-Gruen-Hackenbush

== Herzlich Willkommen

Hallo
Ich bin Linus/Felix
Wenn ihr Probleme / Anmerkungen habe, kommt zu uns oder Vertrauenspersonen.

Was erwartet ihr von dem Kurs?
Mathematischer Hintergrund

Immer Fragen reinwerfen - nach dem Kurs zu uns kommen.
Wir wollen niemanden verlieren

== Spielregeln
Wir wollen uns Hackenbush anschauen. 
- zwei Spieler
- rot (S1) / blau (S2) (- merken weil Rot eine Signalfarbe ist die einem zuerst auffällt - oder so; ergibt erst Sinn bei vorzeichen)
- Spielfläche, mit ein paar roten und blauen strichen
- abwechselnd entfernt man einen Strich seiner Farbe, alles was nicht mehr mit dem Boden verbunden ist,
geht weg
- wer keinen Zug machen kann hat verloren


Hier gewinnt rot immer:
Hier gewinnt blau immer:
Hier gewinnt der zweite Spieler immer:

Vielleicht etwas spielen, ausprobieren um ein Gefühl zu bekommen:
Framing - Ihr könnt euch zusammen überlegen, wer bei diesen Spielen gewinnen würde
-- 1/2
-- ein kompliziereres -1/2
-- Irgendwas mit kreisen

Dann vergleichen.
Was wir jetzt machen können: 
Wissen das zwei Spiele win für rot sind: Wenn wir sie zusammen tun immernoch win für rot.
Wir wollen das irgendwie quantifizieren.
Vielleicht erinnern: Spiele sind Zahlen... was wäre, wenn wir sagen

```
_______ = 0
___I___ = 1
___J___ = -1
```

?

Welchen Wert hätter dann 2?
Was ist 1+ -1? Also scheint es erstmal Sinn zu ergeben.

Fällt euch eine Position ein, die 1/2 wäre? Oder -3/4?
Wie würden wir denn testen ob, etwas 1/2 ist?

=> Spiele (Hackenbush) addiert man, indem man sie zusammen tut

Was wäre -1/2?
=> Spiele negiert man, indem man das inverse nimmt

Rmk: Es gibt versch Spiele mit dem selben Wert. Aber die Addition ist davon unabhängig.
Wir können also sagen, das zwei Spiele äquivalent sind, wenn G-H =ca= 0
Ergibt sinn.

Rätsel: Finde Spiel mit Wert 1/3
=> Kommen nur beliebig nah dran... 
Welche Zahlen können wir damit erreichen?
Antwort: a/2^n

Kennt ihr das beliebig nah dran kommen irgendwo her?
=> Dezimaldarstellung... Vervollständigung Q => R
Da können wir Dinge darstellen als a/10^n ...

Das Problem:
Wie übertragen wir das in eine Hackenbush position?
Also wir wollen irgendwie den Grenzwert als eine Position darstellen, aber..
Wenn wir a mal 2^-k nebeineinander Stellen ist das doof, weil sie sehr unterschiedlich aussehen.
Bei a/2^n ist alles gleich für den Anfang und nur das Ende (was immer weniger wichtig wird - epsilon und so - wird verändert)
Nach vorschlägen hören
=> Vielleicht, wenn man die immer weiter aufeinander stellt.

Frage: Was passiert, wenn wir einen blauen haben, dann einen Roten und dann in irgendeiner Reihenfolge
=> Binärdarstellung!!! (WOOOOOWWWW)
^^ die antwort kann abstrakt oder explizit sein

Das heißt, wenn wir einen guten unendlichen Stack haben ist alles toll.
(Ergibt das Sinn fragen)
So vorstellen undendlich viele übereinander, aber wenn man unten einen wegnimmt verschwinden alle drüber.

Frage: Was ist 2/3?
=> Immer abwechselnd rot, blau
=> Austesten lassen!

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

