
## Freitag, 25-07-2025_Programmiertechnik_ASS

### Allgemeine Hinweise
- **Event** – ein Ereignis in Programmiersprachen, z. B. Eingabe oder Mausklick.  
- **`.close()`** – Befehl, um Ressourcen (z. B. Scanner, Streams) zu schließen.  
- **Strg + Shift + 7** – Blockkommentare in IntelliJ/Eclipse.  
- **Escape-Sequenzen in Java:**  
  - `\t` = Tabulator (Einrückung)  
  - `\n` = Zeilenumbruch  

---

### Entwicklungsumgebung & Grundlagen
- **Scanner rot markiert?** → `import java.util.Scanner;` fehlt.  
- **RM → show in → System Explorer** – Dateien im Explorer anzeigen.  
- **JDK installiert?** → Danach IDE installieren.  
- **JRE System Library → java.util** → von hier werden Klassen wie Scanner importiert.  
- **JDK & LTS:**  
  - LTS-Versionen (Long Term Support) kostenpflichtig bei kommerzieller Nutzung.  
  - Setzen System-Umgebungsvariablen automatisch.  
  - Bei neuer Java-Version → alte Installation deinstallieren.  
- **Grundregel für jede Programmiersprache:**  
  1. SDK (Software Development Kit) installieren.  
  2. IDE einrichten.  
- **String-Block:** `""" ... """` (Textblock seit Java 15).  
- **Telefonnummern und Postleitzahlen niemals als `int` speichern**, sonst führende Nullen gehen verloren → lieber `String`.

---

### Scanner-Beispiel – Aufgabe 4
```java
Scanner sc = new Scanner(System.in);

System.out.println("Vorname eingeben: ");
String Vorname = sc.next();

System.out.println("Nachname eingeben: ");
String Nachname = sc.next();

System.out.println("Wohnort eingeben: ");
String Wohnort = sc.next();

System.out.println("Alter eingeben: ");
int Alter = sc.nextInt();

System.out.println("Kontostand eingeben: ");
double Kontostand = sc.nextDouble();

System.out.println("Geburtsdatum eingeben: ");
String Geburtsdatum = sc.next();

System.out.println("Aufgabe 4:");
System.out.println("Vorname:\t" + Vorname);
System.out.println("Nachname:\t" + Nachname);
System.out.println("Wohnort:\t" + Wohnort);
System.out.println("Alter:\t\t" + Alter);
System.out.println("Kontostand:\t" + Kontostand);
System.out.println("Geburtsdatum:\t" + Geburtsdatum);
```

---

### Komplette Beispielklasse – Datentypen & Variablen
```java
import java.util.Scanner;

public class AufgDatentypenVariablen {
    public static void main(String[] args) {

        // Aufgabe 1 – Deklaration & Initialisierung
        // Deklaration: Variable mit Datentyp anlegen
        // Initialisierung: Wert zuweisen
        int a;
        float b;
        char c;

        // Aufgabe 2 – Werte zuweisen
        a = 15;
        b = 3.3f;
        c = '&';

        // Aufgabe 3 & 4 – Eingabe von Daten
        Scanner sc = new Scanner(System.in);

        System.out.println("Vorname eingeben: ");
        String Vorname = sc.next();

        System.out.println("Nachname eingeben: ");
        String Nachname = sc.next();

        System.out.println("Wohnort eingeben: ");
        String Wohnort = sc.next();

        System.out.println("Alter eingeben: ");
        int Alter = sc.nextInt();

        System.out.println("Kontostand eingeben: ");
        double Kontostand = sc.nextDouble();

        System.out.println("Geburtsdatum eingeben: ");
        String Geburtsdatum = sc.next();

        System.out.println("Aufgabe 4:");
        System.out.println("Vorname:\t" + Vorname);
        System.out.println("Nachname:\t" + Nachname);
        System.out.println("Wohnort:\t" + Wohnort);
        System.out.println("Alter:\t\t" + Alter);
        System.out.println("Kontostand:\t" + Kontostand);
        System.out.println("Geburtsdatum:\t" + Geburtsdatum);

        // Aufgabe 5 – Rechenoperationen
        System.out.println("Erste Zahl eingeben: ");
        int x = sc.nextInt();
        System.out.println("Zweite Zahl eingeben: ");
        int y = sc.nextInt();
        System.out.println("Dritte Zahl eingeben: ");
        int z = sc.nextInt();

        int ergminus = x - y - z;
        System.out.println("Aufgabe 5:");
        System.out.println(x + "-" + y + "-" + z + " = " + ergminus);

        System.out.println("Erste Kommazahl eingeben: ");
        double h = sc.nextDouble();
        System.out.println("Zweite Kommazahl eingeben: ");
        double u = sc.nextDouble();
        System.out.println("Dritte Kommazahl eingeben: ");
        double p = sc.nextDouble();

        double ergkomma = h - u - p;
        System.out.println(h + "-" + u + "-" + p + " = " + ergkomma);

        // Aufgabe 6 – Geschwindigkeit berechnen
        System.out.println("Strecke eingeben in Meter: ");
        double s = sc.nextDouble();
        System.out.println("Zeit eingeben in Sekunden: ");
        double t = sc.nextDouble();

        double v = s / t;
        System.out.println("Aufgabe 6:");
        System.out.println("Formel: s / t = v => " + s + "m / " + t + "s = " + v + "m/s");

        sc.close();
    }
}
```

---

### Beispielausgabe
```
Vorname eingeben: 
jan
Nachname eingeben: 
musterman
Wohnort eingeben: 
berlin
Alter eingeben: 
35
Kontostand eingeben: 
22
Geburtsdatum eingeben: 
11.11.1888

Aufgabe 4:
Vorname:	jan
Nachname:	musterman
Wohnort:	berlin
Alter:		35
Kontostand:	22.0
Geburtsdatum:	11.11.1888

Aufgabe 5:
1-2-3 = -4
2.5-2.0-2.0 = -1.5

Aufgabe 6:
Formel: s / t = v => 2.0m / 2.0s = 1.0m/s
```

---

### Kerngedanken
- Scanner **immer importieren**: `import java.util.Scanner;`  
- Variablen sauber **deklarieren und initialisieren**.  
- **Escape-Sequenzen** (`\t`, `\n`) für bessere Ausgabe nutzen.  
- **Strings** statt `int` bei Telefonnummern, Postleitzahlen.  
- IDE-Hotkeys (Strg + Shift + 7) nutzen, um schneller Kommentare zu setzen.  
- JDK & LTS beachten: kommerziell → kostenpflichtig.  

---

<details style="margin-top: 2em;">
<summary style="font-size: 0.9em; color: #888;">Metadaten anzeigen</summary>
<p style="font-size: 0.85em; color: grey;">
Teil der FIAE-Umschulung (2025–2027) am BFW Mühlenbeck.<br>
Diese Mitschrift entstand im Unterricht am 25.07.2025 mit ASS.<br>
Sie basiert auf gemeinsam erarbeiteten Inhalten und ergänzenden Übungsbeispielen vom 25.07.2025.<br><br>
Die Version wurde inhaltlich überarbeitet, strukturell optimiert und technisch ergänzt,<br>
um Lernerfolg, Prüfungsrelevanz und Nachvollziehbarkeit zu fördern.<br><br>
Öffentlich dokumentiert zur Wiederholung, Prüfungsvorbereitung und als Orientierungshilfe für Dritte.<br><br>
Quelle: Eigene Mitschrift & Unterrichtsinhalte<br>
Autor: Sean Conroy<br>
Lizenz: <a href="https://creativecommons.org/licenses/by-nc-sa/4.0/" target="_blank">CC BY-NC-SA 4.0</a>
</p>
</details>

