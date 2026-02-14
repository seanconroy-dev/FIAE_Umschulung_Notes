---
title: "Java – Static vs. Instance Variablen und Methoden"
date: 2026-02-09
weekday: "Montag"
subject: "Programmierung"
instructor: "ASS"
program: "FIAE Umschulung 2025-2027"
module: "Java Grundlagen"
topic: "static vs. instance (Variablen & Methoden)"
level: "Grundlagen"
tags:
  - Java
  - OOP
  - static
  - Instanz
  - Klassenvariable
  - Methoden
  - Udemy
author: "Sean Conroy"
license: "CC BY-NC-SA 4.0"
---

# Java – Static vs. Instance Variablen / Methoden – 2026-02-09 (Udemy, ASS)

## Statische vs. Instanzvariablen in Java

### Statische Variablen (Klassenvariablen)
- Definition: Werden von allen Instanzen gemeinsam genutzt.
- Deklaration: Mit `static`.
- Initialisierung: Einmalig beim Laden der Klasse.
- Zugriff: Über den Klassennamen.
- Speicher: Klassenbereich (Method Area).

Beispiel:

~~~java
public class MyClass {
    static int staticVariable = 10;
}

int value = MyClass.staticVariable;
~~~

---

### Instanzvariablen (Objektvariablen)
- Definition: Pro Objekt einzigartig.
- Deklaration: Ohne `static`.
- Initialisierung: Für jedes Objekt separat.
- Zugriff: Über eine Instanz.
- Speicher: Heap (pro Objekt).

Beispiel:

~~~java
public class MyClass {
    int instanceVariable;
}

MyClass obj1 = new MyClass();
obj1.instanceVariable = 5;
~~~

---

## Unterschiede (Variablen)

| Aspekt | Statisch | Instanz |
|--------|----------|---------|
| Deklaration | mit `static` | ohne `static` |
| Initialisierung | einmalig | pro Objekt |
| Zugriff | `MyClass.var` | `obj.var` |
| Speicher | Klassenbereich | Heap |
| Zweck | gemeinsame Daten | objektspezifischer Zustand |

---

## Statische vs. Instanzmethoden

### Statische Methoden
- Gehören zur Klasse.
- Deklaration mit `static`.
- Aufruf ohne Instanz.
- Zugriff nur auf statische Member.

Beispiel:

~~~java
public class MyClass {
    static int staticVariable = 10;

    static void staticMethod() {
        System.out.println(staticVariable);
    }
}

MyClass.staticMethod();
~~~

---

### Instanzmethoden
- Gehören zu einer konkreten Instanz.
- Ohne `static`.
- Aufruf über Objekt.
- Zugriff auf Instanz- und statische Member.

Beispiel:

~~~java
public class MyClass {
    int instanceVariable = 5;
    static int staticVariable = 10;

    void instanceMethod() {
        System.out.println(instanceVariable);
        System.out.println(staticVariable);
    }
}

MyClass obj = new MyClass();
obj.instanceMethod();
~~~

---

## Wichtige Regeln

1. Keine Instanzmember in statischen Methoden:

~~~java
public class MyClass {
    int instanceVariable = 5;
    static int staticVariable = 10;

    static void staticMethod() {
        // System.out.println(instanceVariable); // Fehler
        System.out.println(staticVariable);
    }
}
~~~

2. `this` und `super` nicht erlaubt in statischen Methoden.

3. Überladen möglich, Überschreiben nicht (Method Hiding):

~~~java
class SuperClass {
    static void staticMethod() {
        System.out.println("SuperClass");
    }
}

class SubClass extends SuperClass {
    static void staticMethod() {
        System.out.println("SubClass");
    }
}

SuperClass.staticMethod();
SubClass.staticMethod();
~~~

4. Nutzung in statischen Initialisierungsblöcken:

~~~java
public class MyClass {
    static int staticVariable;

    static {
        initializeStaticVariable();
    }

    static void initializeStaticVariable() {
        staticVariable = 20;
    }
}
~~~

---

<details style="margin-top: 2em;">
<summary style="font-size: 0.9em; color: #888;">Metadaten anzeigen</summary>
<p style="font-size: 0.85em; color: grey;">
Teil der FIAE-Umschulung (2025-2027) am BFW Muehlenbeck.<br>
Diese Mitschrift entstand im Unterricht am 09.02.2026 mit ASS.<br>
Sie basiert auf gemeinsam erarbeiteten Inhalten und ergaenzenden Uebungsbeispielen vom 09.02.2026.<br><br>
Die Version wurde inhaltlich ueberarbeitet, strukturell optimiert und technisch ergaenzt,<br>
um Lernerfolg, Pruefungsrelevanz und Nachvollziehbarkeit zu foerdern.<br><br>
Oeffentlich dokumentiert zur Wiederholung, Pruefungsvorbereitung und als Orientierungshilfe fuer Dritte.<br><br>
Quelle: Eigene Mitschrift & Unterrichtsinhalte<br>
Autor: Sean Conroy<br>
Lizenz: CC BY-NC-SA 4.0
</p>
</details>
