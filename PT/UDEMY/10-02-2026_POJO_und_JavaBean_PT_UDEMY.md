## Dienstag, 10-02-2026_POJO_und_JavaBean_PT_UDEMY

# POJO und JavaBean: Grundlagen und Unterschiede
 
## POJO (Plain Old Java Object)
**Definition:**
Ein POJO ist ein einfaches Java-Objekt, das keinerlei spezifischen Rahmenbedingungen oder Konventionen unterliegt. Es ist ein Java-Objekt, das nicht an ein bestimmtes Framework gebunden ist und keine speziellen Anforderungen an den Klassenpfad stellt. POJOs eignen sich besonders für die einfache Serialisierung und Deserialisierung und sind ideal für die Datenübertragung und -speicherung.
 
**Merkmale:**
- Private Felder
- Öffentliche Getter- und Setter-Methoden
- Ein parameterloser Konstruktor (nicht zwingend erforderlich, aber üblich)
- Keine spezifischen Designmuster oder Konventionen
 
**Beispiel:**
```java
public class Person {
    private String name;
    private int age;
 
    public Person() {
        // Parameterloser Konstruktor
    }
 
    public String getName() {
        return name;
    }
 
    public void setName(String name) {
        this.name = name;
    }
 
    public int getAge() {
        return age;
    }
 
    public void setAge(int age) {
        this.age = age;
    }
}
```
 
---
 
## JavaBean
**Definition:**
Ein JavaBean ist ein spezieller Typ eines POJO, der bestimmte Konventionen einhält. Es handelt sich um eine wiederverwendbare Softwarekomponente, die in Builder-Tools visuell manipuliert werden kann. JavaBeans werden verwendet, um mehrere Objekte in einem einzigen Objekt (dem Bean) zu kapseln, sodass sie als ein einzelnes Objekt weitergegeben werden können.
 
**Merkmale:**
- Parameterloser Konstruktor (erforderlich)
- Private Felder
- Öffentliche Getter- und Setter-Methoden für den Zugriff auf die Eigenschaften
- Implementierung des `Serializable`-Interfaces für einfache Serialisierung und Deserialisierung
 
**Beispiel:**
```java
import java.io.Serializable;
 
public class Employee implements Serializable {
    private String name;
    private int id;
 
    public Employee() {
        // Parameterloser Konstruktor
    }
 
    public String getName() {
        return name;
    }
 
    public void setName(String name) {
        this.name = name;
    }
 
    public int getId() {
        return id;
    }
 
    public void setId(int id) {
        this.id = id;
    }
}
```
 
**Zusammenhang:**
- Alle JavaBeans sind POJOs, aber nicht alle POJOs sind JavaBeans.
- JavaBeans folgen spezifischen Konventionen und sind als wiederverwendbare Komponenten konzipiert, während POJOs flexibler sind und keinen bestimmten Designmustern oder Konventionen folgen müssen.
 
---
 
# Annotationen in JavaBeans
 
Annotationen sind ein mächtiges Feature in Java, das Metadaten über den Code bereitstellt. In JavaBeans können Annotationen verwendet werden, um zusätzliche Informationen über Eigenschaften, Methoden oder die Klasse selbst anzugeben.
 
## Häufig verwendete Annotationen in JavaBeans
 
| Annotation         | Beschreibung                                                                                     | Beispiel                                                                                     |
|--------------------|-------------------------------------------------------------------------------------------------|---------------------------------------------------------------------------------------------|
| `@BeanProperty`    | Gibt an, dass eine Methode ein Property-Accessor (Getter oder Setter) für eine JavaBean-Eigenschaft ist. | ```java<br>@BeanProperty(name = "productName")<br>public String getName() { return name; }``` |
| `@Transient`       | Zeigt an, dass eine Eigenschaft nicht serialisiert werden soll.                                | ```java<br>@Transient<br>public String getPassword() { return password; }```                  |
| `@NotNull`         | Gibt an, dass eine Eigenschaft nicht `null` sein darf.                                         | ```java<br>@NotNull<br>public String getName() { return name; }```                           |
 
---
 
# Annotationen in Java
 
Annotationen in Java sind eine Form von Metadaten, die Informationen über ein Programm bereitstellen, ohne Teil des Programms selbst zu sein. Sie können für verschiedene Zwecke verwendet werden, z. B. zur Bereitstellung von Informationen für den Compiler, zur Codegenerierung oder zur Laufzeitverarbeitung.
 
## Häufig verwendete Annotationen in Java
 
| Annotation               | Beschreibung                                                                                     | Beispiel                                                                                     |
|--------------------------|-------------------------------------------------------------------------------------------------|---------------------------------------------------------------------------------------------|
| `@Override`              | Zeigt an, dass eine Methode eine Methode der Superklasse überschreibt.                          | ```java<br>@Override<br>public String toString() { return "..."; }```                         |
| `@Deprecated`             | Markiert eine Methode, Klasse oder ein Feld als veraltet.                                       | ```java<br>@Deprecated<br>public void oldMethod() { ... }```                                  |
| `@SuppressWarnings`      | Unterdrückt Compiler-Warnungen für ein bestimmtes Element.                                       | ```java<br>@SuppressWarnings("unchecked")<br>public void myMethod() { ... }```               |
| `@FunctionalInterface`   | Zeigt an, dass ein Interface ein funktionales Interface ist (genau eine abstrakte Methode).     | ```java<br>@FunctionalInterface<br>public interface MyInterface { void myMethod(); }```       |
| `@Retention`             | Legt fest, wie lange Annotationen mit dem annotierten Typ beibehalten werden sollen.            | ```java<br>@Retention(RetentionPolicy.RUNTIME)<br>public @interface MyAnnotation { ... }```   |
 
---
 
# Method Overriding
 
**Definition:**
Wenn eine Subklasse eine spezifische Implementierung für eine Methode bereitstellt, die bereits in ihrer Superklasse definiert ist, spricht man von Method Overriding. Die Methode in der Subklasse muss denselben Namen, Rückgabetyp und dieselben Parameter wie die Methode in der Superklasse haben.
 
**Beispiel:**
```java
public class SuperClass {
    public void display() {
        System.out.println("Display method in SuperClass");
    }
}
 
public class SubClass extends SuperClass {
    @Override
    public void display() {
        System.out.println("Display method in SubClass");
    }
}
 
// Beispielaufruf
SuperClass superClass = new SuperClass();
SubClass subClass = new SubClass();
superClass.display(); // Ausgabe: Display method in SuperClass
subClass.display();   // Ausgabe: Display method in SubClass
```
 
**Hinweis:**
Die `@Override`-Annotation wird verwendet, um anzuzeigen, dass eine Methode eine Methode der Superklasse überschreibt. Dies hilft, Fehler zur Compile-Zeit zu erkennen, falls die Methode nicht tatsächlich eine Methode der Superklasse überschreibt.
---
<details style="margin-top: 2em;">
<summary style="font-size: 0.9em; color: #888;">Metadaten anzeigen</summary>
<p style="font-size: 0.85em; color: grey;">
Teil der FIAE-Umschulung (2025-2027) am BFW Muehlenbeck.<br>
Diese Mitschrift entstand im Unterricht am 10.02.2026 mit UDEMY.<br>
Sie basiert auf gemeinsam erarbeiteten Inhalten und ergaenzenden Uebungsbeispielen vom 10.02.2026.<br><br>
Die Version wurde inhaltlich ueberarbeitet, strukturell optimiert und technisch ergaenzt,<br>
um Lernerfolg, Pruefungsrelevanz und Nachvollziehbarkeit zu foerdern.<br><br>
Oeffentlich dokumentiert zur Wiederholung, Pruefungsvorbereitung und als Orientierungshilfe fuer Dritte.<br><br>
Quelle: Eigene Mitschrift & Unterrichtsinhalte<br>
Autor: Sean Conroy<br>
Lizenz: <a href="https://creativecommons.org/licenses/by-nc-sa/4.0/" target="_blank">CC BY-NC-SA 4.0</a>
</p>
</details>