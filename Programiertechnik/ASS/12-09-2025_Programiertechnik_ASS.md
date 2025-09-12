
# Freitag, 12-09-2025 - Programiertechnik (ASS)

## Aufgabe 1: Geschlecht auswählen

Aufgabenstellung
- Name eingeben.
- Aus Menü Geschlecht wählen:
  1 = männlich, 2 = weiblich, 3 = divers, 0 = Exit.
- Ausgabe je nach Auswahl:
  - 1 -> "Herr <Name>"
  - 2 -> "Frau <Name>"
  - 3 -> "<Name>"
- Falsche Eingabe -> Fehlermeldung.
- Zusatz: Lösung mit switch-case (statt if-else).

Beispielcode (einmalige Abfrage)
import java.util.Scanner;
public class AufgabeGeschlecht {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        System.out.println("Bitte Ihren Namen eingeben:");
        String name = sc.nextLine().trim();

        System.out.println("Bitte Ihr Geschlecht auswählen:");
        System.out.println("1. Männlich");
        System.out.println("2. Weiblich");
        System.out.println("3. Divers");
        System.out.println("0. Exit");

        while (!sc.hasNextInt()) {
            System.out.println("Ungültige Eingabe. Bitte eine Zahl eingeben.");
            sc.next(); // ungültiges Token verwerfen
        }

        int choice = sc.nextInt();

        switch (choice) {
            case 1 -> System.out.println("Herr " + name);
            case 2 -> System.out.println("Frau " + name);
            case 3 -> System.out.println(name);
            case 0 -> System.out.println("Programm wird beendet...");
            default -> System.out.println("Versuchen Sie es nochmal...");
        }

        sc.close();
    }
}

Lernnotizen zu Strings und Kontrollfluss
- Strings vergleichen: "abc".equals(x) statt ==
- Groß/Kleinschreibung ignorieren: "abc".equalsIgnoreCase(x)
- Umwandeln: s.toUpperCase(), s.toLowerCase(), s.trim()
- if, else if, else für Bedingungen
- switch-case für feste Menüauswahlen
- Ternary (Kurzform von einfachem if-else):
  String result = (a > b) ? "a ist größer" : "b ist größer";

---

## Aufgabe 2: Geometrische Formen berechnen

Menü
- 1 = Zylinder
- 2 = Kugel
- 3 = Quader

Formeln
- Zylinder:
  Volumen V = π r^2 h
  Oberfläche A = 2 π r (r + h)

- Kugel:
  Umfang (Großkreis) U = 2 π r
  Volumen V = (4/3) π r^3
  Oberfläche A = 4 π r^2

- Quader mit Seiten a, b, c:
  Volumen V = a b c
  Oberfläche A = 2 (ab + bc + ac)
  Raumdiagonale d = √(a^2 + b^2 + c^2)
  Gesamtkantenlänge = 4 (a + b + c)

Beispielcode
import java.util.Scanner;
public class AufgabeGeometrie {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        System.out.println("Bitte eine Form auswählen:");
        System.out.println("1. Zylinder");
        System.out.println("2. Kugel");
        System.out.println("3. Quader");

        int choice = sc.nextInt();

        switch (choice) {
            case 1 -> {
                System.out.println("Bitte die Höhe eingeben:");
                double h = sc.nextDouble();
                System.out.println("Bitte den Radius eingeben:");
                double r = sc.nextDouble();

                double volumen = Math.PI * r * r * h;           // V = π r^2 h
                double oberflaeche = 2 * Math.PI * r * (r + h); // A = 2π r (r + h)

                System.out.printf("Volumen: %.3f%nOberfläche: %.3f%n", volumen, oberflaeche);
            }
            case 2 -> {
                System.out.println("Bitte den Radius eingeben:");
                double r = sc.nextDouble();

                double umfang = 2 * Math.PI * r;                      // U = 2π r
                double volumen = (4.0 / 3.0) * Math.PI * r * r * r;   // V = 4/3 π r^3
                double oberflaeche = 4 * Math.PI * r * r;             // A = 4 π r^2

                System.out.printf("Umfang: %.3f%nVolumen: %.3f%nOberfläche: %.3f%n",
                                  umfang, volumen, oberflaeche);
            }
            case 3 -> {
                System.out.println("Bitte Seite a eingeben:");
                double a = sc.nextDouble();
                System.out.println("Bitte Seite b eingeben:");
                double b = sc.nextDouble();
                System.out.println("Bitte Seite c eingeben:");
                double c = sc.nextDouble();

                double volumen = a * b * c;                           // V = a b c
                double oberflaeche = 2 * (a*b + b*c + a*c);           // A = 2(ab + bc + ac)
                double raumdiagonale = Math.sqrt(a*a + b*b + c*c);    // d = √(a^2 + b^2 + c^2)
                double gesamtkanten = 4 * (a + b + c);                // 4(a + b + c)

                System.out.printf("Volumen: %.3f%nOberfläche: %.3f%nRaumdiagonale: %.3f%nGesamtkantenlänge: %.3f%n",
                                  volumen, oberflaeche, raumdiagonale, gesamtkanten);
            }
            default -> System.out.println("Ungültige Auswahl.");
        }

        sc.close();
    }
}

Tipps zu Scanner und Ausgabeformaten
- Scanner:
  - nextLine() liest eine ganze Textzeile (inkl. Leerzeichen).
  - nextInt(), nextDouble() lesen Zahlen.
  - Nach nextInt() bleibt der Zeilenumbruch im Puffer. Wenn im Anschluss ein nextLine() kommt, vorher oft ein zusätzliches nextLine() nötig, um den Puffer zu leeren.
- printf-Format:
  - %.3f = Fließkommazahl mit 3 Nachkommastellen
  - %n = Zeilenumbruch (plattformunabhängig)
- Häufige Fehlerquellen:
  - 4/3 ist Integerdivision (ergibt 1). Für Kugelvolumen 4.0/3.0 verwenden.
  - Fehlende break in klassischen switch-Blöcken führt zu Fallthrough. Bei Pfeil-Switch (case x -> ...) nicht nötig.

---

## Zusammenfassung
- if-else und switch-case sind zentrale Kontrollstrukturen für Menüprogramme.
- Scanner sauber benutzen: String vs Zahl unterscheiden und Eingabepuffer beachten.
- Mathematische Berechnungen mit Math.PI und Math.sqrt.
- Mit printf formatiert ausgeben, um saubere Nachkommastellen und Zeilenumbrüche zu erhalten.

---
<details style="margin-top: 2em;"> <summary style="font-size: 0.9em; color: #888;">Metadaten anzeigen</summary> <p style="font-size: 0.85em; color: grey;"> Teil der FIAE-Umschulung (2025–2027) am BFW Mühlenbeck.<br> Diese Mitschrift entstand im Unterricht am 12.09.2025 mit ASS.<br> Sie basiert auf gemeinsam erarbeiteten Inhalten und ergänzenden Übungsbeispielen.<br><br> Die Version wurde inhaltlich überarbeitet, strukturell optimiert und technisch ergänzt,<br> um Lernerfolg, Prüfungsrelevanz und Nachvollziehbarkeit zu fördern.<br><br> Öffentlich dokumentiert zur Wiederholung, Prüfungsvorbereitung und als Orientierungshilfe für Dritte.<br><br> Quelle: Eigene Mitschrift & Unterrichtsinhalte<br> Autor: Sean Conroy<br> Lizenz: <a href="https://creativecommons.org/licenses/by-nc-sa/4.0/" target="_blank">CC BY-NC-SA 4.0</a> </p> </details> 