---
title: "Windows – Bootprozess, BIOS/UEFI und MBR/GPT"
date: 2025-10-08
weekday: "Mittwoch"
subject: "BS"
instructor: "SLE"
program: "FIAE Umschulung 2025-2027"
module: "Betriebssysteme"
topic: "Bootprozess"
level: "Grundlagen"
tags:
  - Windows
  - Bootprozess
  - BIOS
  - UEFI
  - MBR
  - GPT
  - Firmware
author: "Sean Conroy"
license: "CC BY-NC-SA 4.0"
---

# Mittwoch, 2025-10-08_BS_SLE

#### Kontrollfragen & Antworten  
**Thema:** Windows-Bootprozess, BIOS/UEFI und MBR/GPT  

---

## Allgemeiner Bootprozess

**1. Welche grundlegenden Schritte durchläuft ein Windows-PC beim Starten?**  
1. Power On – Stromversorgung wird aktiviert  
2. POST (Power-On Self Test) – Firmware prüft grundlegende Hardware (CPU, RAM, Grafikkarte)  
3. Initialisierung der Firmware (BIOS oder UEFI)  
4. Laden des Bootloaders  
5. Start des Windows Boot Managers  
6. Laden des Windows-Kernels und Start des Betriebssystems  

---

**2. Was ist POST (Power-On Self Test)?**  
Ein Selbsttest der Firmware beim Einschalten des Rechners. Dabei wird überprüft, ob essentielle Hardwarekomponenten funktionsfähig sind. Fehler werden über Pieptöne oder Meldungen angezeigt.

---

**3. Welche Rolle spielt der Bootloader?**  
Der Bootloader lädt das Betriebssystem in den Arbeitsspeicher und übergibt anschließend die Kontrolle an den Kernel.

---

**4. Welche Aufgabe hat die Boot Configuration Data (BCD)?**  
Die BCD enthält Konfigurationsdaten zum Bootvorgang, z. B. welches Betriebssystem gestartet wird und mit welchen Startoptionen.

---

**5. Wie beeinflusst ein Admin den Bootprozess im Fehlerfall?**  
- Windows-Wiederherstellungsumgebung (WinRE)  
- Startreparatur  
- Befehle wie `bootrec` und `bcdedit`  
- Booten über Installations- oder Recovery-Medium  

---

## BIOS vs. UEFI

**6. Was ist der Unterschied zwischen BIOS und UEFI?**  
- **BIOS**: älterer Standard, 16-Bit, textbasiert, begrenzte Funktionen  
- **UEFI**: moderner Standard, 32/64-Bit, grafische Oberfläche, modular und schneller  

---

**7. Nenne zwei Vorteile von UEFI.**  
- Schnellere Bootzeiten  
- Unterstützung großer Datenträger (> 2 TB)  
- Secure Boot zur Erhöhung der Sicherheit  

---

**8. Wie unterscheidet sich der Startvorgang UEFI vs. BIOS?**  
- BIOS lädt Bootcode direkt aus dem MBR  
- UEFI lädt eine EFI-Datei aus der EFI-Systempartition  

---

**9. Was ist das CSM (Compatibility Support Module)?**  
Ein UEFI-Modul, das den klassischen BIOS-Modus emuliert, um ältere Betriebssysteme zu unterstützen.

---

**10. Warum braucht Windows im UEFI-Modus GPT?**  
UEFI ist für GPT ausgelegt. GPT ermöglicht große Datenträger, mehr Partitionen und eine strukturierte Ablage der Bootdateien in der EFI-Systempartition.

---

## MBR vs. GPT

**11. Wie viele Partitionen sind bei MBR möglich?**  
Maximal 4 primäre Partitionen  
(oder 3 primäre + 1 erweiterte)

---

**12. Welche Maximalgröße unterstützt MBR?**  
2 TB (bei 512-Byte-Sektoren)

---

**13. Welche Vorteile hat GPT?**  
- Unterstützung sehr großer Datenträger  
- Bis zu 128 Partitionen (unter Windows)  
- Redundante Partitionsinformationen  
- Fehlererkennung durch Prüfsummen  

---

**14. Wo liegt der Bootloader bei MBR und GPT?**  
- **MBR**: im ersten Sektor der Festplatte  
- **GPT**: als Datei in der EFI-Systempartition  

---

**15. Welche Partition braucht Windows bei GPT?**  
Die EFI-Systempartition (ESP)

---

## Windows-spezifisch

**16. Wie heißt die Bootdatei im BIOS/MBR-Modus?**  
`bootmgr`

---

**17. Wie heißt die EFI-Datei im UEFI/GPT-Modus?**  
`\EFI\Microsoft\Boot\bootmgfw.efi`

---

**18. Welche Partition enthält Bootdateien bei UEFI?**  
Die EFI-Systempartition (formatiert mit FAT32)

---

**19. Wie prüft man BIOS- oder UEFI-Modus in Windows?**  
`msinfo32` → Eintrag **BIOS-Modus**

---

**20. Welche Tools bietet Windows zur Boot-Reparatur?**  
- Startreparatur  
- `bootrec`  
- `bcdedit`  
- Windows-Installations- oder Recovery-Medium  

---

## Abkürzungen und Bedeutung

- **POST** – Power-On Self Test  
- **BIOS** – Basic Input/Output System  
- **UEFI** – Unified Extensible Firmware Interface  
- **EFI** – Extensible Firmware Interface  
- **MBR** – Master Boot Record  
- **GPT** – GUID Partition Table  

---

## MBR – Erklärung und Merkmale

- Gehört zeitlich zum klassischen BIOS  
- Bootcode und Partitionstabelle im ersten Sektor der Festplatte  
- Maximal 2 TB Datenträgergröße  
- Hardware-naher Bootvorgang  
- Heute technisch veraltet  

---

## GPT – Erklärung und Merkmale

- Moderne Partitionsstruktur  
- Für UEFI konzipiert  
- Separate EFI-Systempartition für Bootdateien  
- Unterstützung großer Datenträger  
- Redundante Metadaten zur Ausfallsicherheit  

---

## Merksätze

- **MBR und BIOS gehören zeitlich zusammen.**  
- **Moderne Systeme verwenden UEFI und GPT.**

**Unterschiede im Bootprozess:**  
- GPT: besitzt eine dedizierte EFI-Systempartition mit Bootdateien  
- MBR: Bootcode liegt direkt im ersten Sektor und arbeitet hardware-nah

