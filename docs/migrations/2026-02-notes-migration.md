# Notes Migration – February 2026

## Context

Branch: feature/restructure-ps1  
Goal: Deterministic folder structure based on frontmatter metadata.

## What Was Done

- Created new canonical structure under /notes/{year}/{subject}/{instructor}
- Executed migrate-notes.ps1 with -Apply
- Verified file count and integrity
- Removed legacy folders (BS/, DB/, PT/, etc.)
- Preserved .gitkeep where required

## Issues Encountered

- Mixed line endings (CRLF/LF)
- GitHub frontmatter not rendering consistently
- Manual cleanup required in some cases

## Result

Repository now follows deterministic structure.
Ready for indexing system implementation.

