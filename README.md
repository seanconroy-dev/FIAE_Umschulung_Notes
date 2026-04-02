[![GitHub Pages](https://img.shields.io/badge/docs-GitHub%20Pages-blue)](https://seanconroy-dev.github.io/FIAE_Umschulung_Notes/)
[![License](https://img.shields.io/badge/license-MIT-green)](LICENSE)
[![Last Commit](https://img.shields.io/github/last-commit/seanconroy-dev/FIAE_Umschulung_Notes)](https://github.com/seanconroy-dev/FIAE_Umschulung_Notes/commits/main)
[![Repo Size](https://img.shields.io/github/repo-size/seanconroy-dev/FIAE_Umschulung_Notes)](https://github.com/seanconroy-dev/FIAE_Umschulung_Notes)

# FIAE Umschulung Notes

A structured, markdown-based knowledge system developed during my training as a  
**Fachinformatiker für Anwendungsentwicklung (FIAE)**.

👉 **Live Documentation (recommended):**  
https://seanconroy-dev.github.io/FIAE_Umschulung_Notes/

All notes are transformed into a searchable documentation system with structured navigation, indexing, and tag-based exploration.

![Documentation Overview](notes/bilder/docs-overview.png)

> Example: Generated documentation with categorized subjects, searchable content, and structured navigation

## Documentation Output

The notes are automatically transformed into a structured documentation site using MkDocs, providing:

- Fast navigation across subjects  
- Tag-based exploration  
- Full-text search across all notes  

---

## Repository Structure

```
.
├─ notes/        # Markdown-based knowledge base (MkDocs content root)
├─ scripts/      # Automation and helper scripts
├─ reports/      # Generated reports / migration outputs
├─ docs/         # Project documentation
└─ LICENSE
```

---

## Note System

Notes follow a consistent hierarchical structure:

```
notes/<year>/<subject>/<instructor>/<file>.md
```

Example:

```
notes/2026/Programmiertechnik/UDEMY/
2026-02-17_Programmiertechnik_UDEMY_class-object.md
```

---

## Metadata

Each note includes standardized YAML frontmatter:

```yaml
title: "java.lang.Object – Root Class"
date: 2026-02-17
subject: "Programmiertechnik"
instructor: "UDEMY"
module: "OOP"
tags:
  - Java
  - OOP
  - AP1
```

These metadata fields enable:
- Automatic index generation
- Tag-based navigation
- Filtering by subject, instructor, or module

---

## Project Goals

- Build a structured and maintainable knowledge base  
- Support efficient exam preparation (**AP1 / AP2**)  
- Apply software engineering principles to learning workflows  
- Serve as a public learning portfolio  

---

## License

© Sean Matthew Conroy  
MIT License
