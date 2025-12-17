#import "template.typ": *
#show: template

= Getting Nimble with Nimbers

~ Es folgt kleine Wiederholung von Schiene 1 ~

Neue Regel
----------
Gruene Striche duerfen von beiden Spieler*innen entfernt werden.

Raetsel: Wie ist der Wert von
 B
_G_?
Antwort: Schwer zu sagen.

Raetsel: Was ist mit _G_? Was kann man zu _G_ dazu addieren, um auf 0 zu kommen?
Antwort: _G_G_ = 0, aber wir wissen trotzdem nicht, was _G_ ist.

Wir schreiben Spiele wie _G_ erstmal in unserer _Strichnotation_ und machen uns ueber den "Wert" spaeter Gedanken.
_G_ = {0 | 0}

Wie ist es mit n langen Schlangen? Also:
 G
 .
 .
 G
_G_
Antwort: Bei Laenge n stehen in der Strichnoation auf beiden Seiten alle "gekoepften" Schlangen.

```
Notation
--------
*0 = { | }
*1 = {*0 | *0} = {0 | 0}
*2 = {*0,*1 | *0,*1} = {0,* | 0,*}
...
```

```
Raetsel: Was ist * + *2 ?
Antwort: { {*|*}, *, *2 | {*|*}, *, *2 } = {0, *, *2 | 0, *, *2} = *3

Raetsel: Was ist *3 + *5? A: *6
         Was ist *3 + *6? A: *5
         Was ist *5 + *6? A: *3
```

Raetsel: Blume mit einem gruenen Staengel unten und unendlich vielen roten/blauen Blaettern.
A: Up / Down

Ratsel: Blume + Blume
Takeaway: Summe endlicher Spiele kann unendlich sein.

Nimber sind also irgendwie komisch, aber woran liegt das?
Was waren eure Strategien um die Werte der Summen auszurechnen?

~ Vielleicht ist allen schon klar, dass _something_ + _something_ = 0 ~
~ Dann kann man das naechste skippen ~

Raetsel: Was ist mit *16 + *4? A: 0.

Takeaway (nicht formal gezeigt): Nimbers sind Koerper mit Charakteristik 2.

Ein Beispiel fuer ein Spiel wo Nimber auftauchen ist Nim:
Nim: Mehrere Stapel mit Muenzen.

Regeln (so grob)
------
1. Abwechselnde Zuege beider Spieler
2. Ein Zug ist: Einen Stapel um beliebige Anzahl Muenzen kleiner machen
3. Wer nicht ziehen kann verliert.

~ Leute kurz Nim spielen lassen, damit sie sehen, dass es genau wie G-Hackenbush ist ~

Nimber tauchen ueberall auf, wo beide Spieler die gleichen Zuege machen koennen.
Nimb-Arithmetik erlaubt uns solche Spiele, oder solche Teile von Spielen zu untersuchen.

~ Hier moeglicherweise noch mehr Spiele Erwaehnen, die Nimber beherbergen ~

Noch ein Nim Raetsel
Raetsel: (\*Omega)³ = \*2 (ansonsten analoges raetsel)
Note: Omega^3 haben wir nicht definiert, stattdessen denke an Omega-Cube aus "Spiel".

Wir untersuchen jetzt systematisch Baeume

```
Raetsel: Wie ist der Wert von
    G G
  G G G
    G
 ___G___?
```
Antwort: Muss nachrechnen.

Siehe auch
- https://math.stackexchange.com/questions/4834066/what-cut-should-be-made-in-a-green-hackenbush-game-after-solving-its-correspondi
- Winning Ways p. 191

Noch offen : Circle collapsing und Fusion Principle (Winning Ways p. 193)
