---
title: "Schalenmodell & Kernelarchitekturen"
date: 2025-09-18
weekday: "Donnerstag"
subject: "BS"
instructor: "SLE"
program: "FIAE Umschulung 2025-2027"
module: "Betriebssysteme"
topic: "Schichtenmodell & Kerneltypen"
level: "Grundlagen"
tags:
  - Betriebssysteme
  - Schalenmodell
  - Kernel
  - Monolithischer Kernel
  - Microkernel
  - Hybridkernel
  - HAL
author: "Sean Conroy"
license: "CC BY-NC-SA 4.0"
---

# Donnerstag, 2025-09-18_BS_SLE

## Schalenmodell (Schichtenmodell des Betriebssystems)

Das **Schalenmodell** ist ein vereinfachtes Modell, das zeigt, wie ein Betriebssystem in **Schichten (Layers)** aufgebaut ist. Jede Schicht baut auf der darunterliegenden auf und bietet der darüberliegenden neue Funktionen. Dadurch entsteht eine klare Trennung von Aufgaben – ähnlich wie bei einer **Zwiebel mit mehreren Schalen**.

---

### 1. Hardware

- **Definition**: Alle physischen Teile des Computers – Prozessor (CPU), Arbeitsspeicher (RAM), Festplatten/SSDs, Netzwerkkarten, Grafikkarten, Tastatur, Monitor usw.  
- **Wichtig**: Hardware allein kann ohne Software nicht gesteuert werden.

---

### 2. HAL (Hardware Abstraction Layer)

- **Definition**: Eine Zwischenschicht, die die Hardware von der Software abstrahiert.  
- **Funktion**: Versteckt Unterschiede zwischen verschiedenen Hardware-Typen.  
  - Beispiel: Unterschiedliche Festplattenhersteller werden einheitlich angesprochen.  
- **Vorteil**: Entwickler programmieren gegen eine standardisierte Schnittstelle, nicht direkt gegen konkrete Hardware.

---

### 3. Kernel

- **Definition**: Der Kern des Betriebssystems, zentrale Steuerungseinheit.  
- **Aufgaben**:
  - Prozessverwaltung  
  - Speicherverwaltung  
  - Gerätesteuerung (über Treiber)  
  - Dateiverwaltung  
- **Vergleich**: Wie ein Dirigent, der das Zusammenspiel aller Komponenten koordiniert.

---

### 4. Shell

- **Definition**: Schnittstelle zwischen Benutzer und Betriebssystem.  
- **Arten**:
  - CLI (z. B. Bash, PowerShell)  
  - GUI (z. B. Windows-Desktop, GNOME)  
- **Funktion**: Nimmt Benutzereingaben entgegen und übergibt sie als Systemaufrufe an den Kernel.

---

### 5. Programme

- Anwendungen wie Browser, Office-Programme oder Spiele.  
- Nutzen Systemaufrufe, um Dienste des Betriebssystems in Anspruch zu nehmen.

---

### Reihenfolge (von innen nach außen)

Hardware → HAL → Kernel → Shell → Programme

---

## Schichtenmodell – Windows

### Diagramm

```
+-------------------------+
|     Programme           |
|     Bibliotheken        |
+-------------------------+
|          API            |
+-------------------------+
|   Systemschnittstelle   |
+-------------------------+
| Prozess-/Ressourcen-    |
|     Management          |
+-------------------------+
|  Dateisystem   Treiber  |
+-------------------------+
|          HAL            |
+-------------------------+
|        Hardware         |
+-------------------------+
```

---

### Erläuterungen

- **User-Modus**
  - Programme laufen in voneinander getrennten Speicherbereichen.
- **Kernel-Modus**
  - Zentrale Systemkomponenten und Kernel-Treiber.
  - Enthält u. a. `ntoskrnl.exe`.
- **HAL**
  - Vermittelt zwischen Hardware und Kernel.

---

## Monolithischer Kernel

### Definition

Ein monolithischer Kernel integriert zentrale Betriebssystemfunktionen in einem gemeinsamen Kernel-Adressraum:

- Speicher- und Prozessverwaltung  
- Interprozesskommunikation (IPC)  
- Gerätetreiber  

### Vorteile

- Hohe Performance (direkte Funktionsaufrufe im Kernelraum)  
- Geringer Overhead  

### Nachteile

- Fehler in Treibern können das gesamte System beeinträchtigen  
- Änderungen erfordern oft Neukompilierung  

### Beispiel

- GNU/Linux (klassisch monolithisch mit modularen Erweiterungen)

---

## Microkernel

### Definition

Ein Microkernel enthält nur grundlegende Funktionen:

- Basis-IPC  
- Speicherverwaltung  
- Prozessverwaltung  

Treiber und Dateisysteme laufen meist im User-Modus.

### Vorteile

- Hohe Stabilität  
- Komponenten austauschbar  

### Nachteile

- Performance-Overhead durch häufige IPC  
- Höherer Implementierungsaufwand  

---

## Hybridkernel

### Definition

Ein Hybridkernel kombiniert Elemente von monolithischem Kernel und Microkernel.

- Zentrale Komponenten im Kernel-Modus  
- Einige Dienste im User-Modus  

### Vorteile

- Gute Balance zwischen Performance und Stabilität  

### Beispiel

- Windows NT (3.1 – Windows 11)

