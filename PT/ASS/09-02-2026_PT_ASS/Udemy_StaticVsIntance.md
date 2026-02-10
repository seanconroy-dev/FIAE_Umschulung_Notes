
# Montag, 09-02-2026_PT_ASS/Udemy – Static vs. Instance Variablen / Methoden

## Statische vs. Instanzvariablen in Java

### Statische Variablen (Klassenvariablen)
- **Definition:** Statische Variablen (auch Klassenvariablen genannt) werden von **allen Instanzen einer Klasse gemeinsam genutzt**.
- **Deklaration:** Mit dem Schlüsselwort `static`.
- **Initialisierung:** Einmalig beim Laden der Klasse.
- **Zugriff:** Direkt über den Klassennamen (ohne Instanz).
- **Speicher:** Werden im **statischen Speicherbereich** abgelegt.

**Beispiel:**
```java
public class MyClass {
    static int staticVariable = 10; // Statische Variable
}

// Zugriff (empfohlene Praxis!):
int value = MyClass.staticVariable;
```

---

### Instanzvariablen (Objektvariablen)
- **Definition:** Instanzvariablen (auch Feldvariablen genannt) sind **einzigartig für jedes Objekt** der Klasse.
- **Deklaration:** Ohne `static`-Schlüsselwort.
- **Initialisierung:** Für jedes Objekt separat.
- **Zugriff:** Nur über eine Instanz der Klasse möglich.
- **Speicher:** Werden im **Heap-Speicher** für jedes Objekt angelegt.

**Beispiel:**
```java
public class MyClass {
    int instanceVariable; // Instanzvariable
}

// Zugriff:
MyClass obj1 = new MyClass();
obj1.instanceVariable = 5; // Zugriff über Objekt
```

---

## Wichtige Unterschiede

| Aspekt               | Statische Variablen                     | Instanzvariablen                     |
|----------------------|-----------------------------------------|--------------------------------------|
| **Deklaration**      | Mit `static`                            | Ohne `static`                        |
| **Initialisierung**  | Einmalig beim Laden der Klasse          | Pro Objekt                           |
| **Zugriff**          | Über Klassennamen (`MyClass.var`)       | Über Objekt (`obj.var`)              |
| **Speicher**         | Statischer Speicherbereich              | Heap (pro Objekt)                    |
| **Verwendung**       | Für klassenspezifische, geteilte Daten  | Für objektspezifische, individuelle Daten |
| **Beispiel**         | `static int count;`                     | `int age;`                           |

---

### Wichtige Beobachtungen (Hinweis):
- **Statische Variablen** eignen sich für Daten, die **allen Objekten gemeinsam** sind (z. B. Zähler).
- **Instanzvariablen** speichern **objektindividuelle Zustände** (z. B. Alter, Name).
- **Best Practice:** Statische Variablen immer über den Klassennamen referenzieren (`MyClass.var`), nicht über Objekte!

---
## Statische vs. Instanzmethoden in Java

### Statische Methoden (Klassenmethoden)
- **Definition:** Statische Methoden gehören zur **Klasse selbst**, nicht zu einer bestimmten Instanz.
- **Deklaration:** Mit dem Schlüsselwort `static`.
- **Aufruf:** Direkt über den Klassennamen, **ohne Instanz** der Klasse.
- **Zugriff:** Können nur auf **statische Variablen** und **statische Methoden** zugreifen.

**Beispiel:**
```java
public class MyClass {
    static int staticVariable = 10;

    static void staticMethod() {
        System.out.println("Statische Variable: " + staticVariable);
    }
}

// Aufruf (empfohlene Praxis!):
MyClass.staticMethod();
```

---

### Instanzmethoden (Objektmethoden)
- **Definition:** Instanzmethoden gehören zu einer **spezifischen Instanz** der Klasse.
- **Deklaration:** Ohne `static`-Schlüsselwort.
- **Aufruf:** Nur über eine **Instanz** der Klasse möglich.
- **Zugriff:** Können auf **Instanzvariablen**, **statische Variablen** und **beide Methodentypen** zugreifen.

**Beispiel:**
```java
public class MyClass {
    int instanceVariable = 5;
    static int staticVariable = 10;

    void instanceMethod() {
        System.out.println("Instanzvariable: " + instanceVariable);
        System.out.println("Statische Variable: " + staticVariable);
    }
}

// Aufruf:
MyClass obj = new MyClass();
obj.instanceMethod();
```

---

## Wichtige Unterschiede
   Aspekt               | Statische Methoden                     | Instanzmethoden                     |
 |----------------------|-----------------------------------------|-------------------------------------|
 | **Deklaration**      | Mit `static`                            | Ohne `static`                       |
 | **Aufruf**           | Über Klassennamen (`MyClass.method()`) | Über Instanz (`obj.method()`)       |
 | **Variablenzugriff** | Nur statische Variablen/Methoden       | Instanz- und statische Variablen/Methoden |
 | **Speicher**         | Statischer Speicherbereich             | Heap (pro Instanz)                  |
 | **Verwendung**       | Klassenebenen-Funktionalität (z. B. Utility-Methoden) | Instanzspezifische Logik (z. B. Objektverhalten) |
 | **Beispiel**         | `static void myStaticMethod()`         | `void myInstanceMethod()`           |

---

## Grundregeln für statische Methoden

1. **Kein Zugriff auf Instanzvariablen/Instanzmethoden:**
   Statische Methoden können **nicht** auf Instanzvariablen oder Instanzmethoden zugreifen.
   ```java
   public class MyClass {
       int instanceVariable = 5;
       static int staticVariable = 10;

       static void staticMethod() {
           // System.out.println(instanceVariable); // Kompilierfehler!
           System.out.println(staticVariable); // Erlaubt
       }
   }
   ```

2. **Aufruf ohne Instanz:**
   Statische Methoden werden **ohne Instanz** aufgerufen, direkt über den Klassennamen.
   ```java
   public class MyClass {
       static void staticMethod() {
           System.out.println("Statische Methode.");
       }
   }
   MyClass.staticMethod(); // Aufruf ohne Instanz
   ```

3. **Keine Verwendung von `this` oder `super`:**
   Da statische Methoden **keiner Instanz zugeordnet** sind, können sie `this` oder `super` nicht verwenden.
   ```java
   public class MyClass {
       static void staticMethod() {
           // System.out.println(this); // Kompilierfehler!
       }
   }
   ```

4. **Überladen möglich, Überschreiben nicht:**
   Statische Methoden können **überladen**, aber **nicht überschrieben** werden.
   Eine statische Methode in einer Subklasse **verdeckt** die Methode der Superklasse.
   ```java
   public class SuperClass {
       static void staticMethod() {
           System.out.println("Statische Methode in SuperClass");
       }
   }

   public class SubClass extends SuperClass {
       static void staticMethod() {
           System.out.println("Statische Methode in SubClass");
       }
   }

   SuperClass.staticMethod(); // Ruft SuperClass-Methode auf
   SubClass.staticMethod();   // Ruft SubClass-Methode auf
   ```

5. **Verwendung in statischen Blöcken:**
   Statische Methoden können in **statischen Initialisierungsblöcken** aufgerufen werden.
   ```java
   public class MyClass {
       static int staticVariable;

       static {
           initializeStaticVariable(); // Aufruf im statischen Block
       }

       static void initializeStaticVariable() {
           staticVariable = 20;
       }
   }
   ```
---


<details style="margin-top: 2em;">
<summary style="font-size: 0.9em; color: #888;">Metadaten anzeigen</summary>
<p style="font-size: 0.85em; color: grey;">
Teil der FIAE-Umschulung (2025-2027) am BFW Muehlenbeck.<br>
Diese Mitschrift entstand im Unterricht am 09.02.2026 mit ASS.<br>
Sie basiert auf gemeinsam erarbeiteten Inhalten und ergänzenden Übungsbeispielen vom 09.02.2026.<br><br>
Die Version wurde inhaltlich überarbeitet, strukturell optimiert und technisch ergänzt,<br>
um Lernerfolg, Prüfungsrelevanz und Nachvollziehbarkeit zu fördern.<br><br>
Öffentlich dokumentiert zur Wiederholung, Prüfungsvorbereitung und als Orientierungshilfe für Dritte.<br><br>
Quelle: Eigene Mitschrift & Unterrichtsinhalte<br>
Autor: Sean Conroy<br>
Lizenz: <a href="https://creativecommons.org/licenses/by-nc-sa/4.0/" target="_blank">CC BY-NC-SA 4.0</a>
</p>
</details>

