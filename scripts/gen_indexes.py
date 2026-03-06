from pathlib import Path
from collections import defaultdict
import yaml
import mkdocs_gen_files

NOTES_DIR = Path("notes")

subjects = defaultdict(list)
instructors = defaultdict(list)
modules = defaultdict(list)
tags = defaultdict(list)

def read_frontmatter(path):
    text = path.read_text(encoding="utf-8")
    if not text.startswith("---"):
        return {}

    parts = text.split("---", 2)
    if len(parts) < 3:
        return {}

    return yaml.safe_load(parts[1]) or {}

for md in NOTES_DIR.rglob("*.md"):
    if "subjects" in md.parts:
        continue

    meta = read_frontmatter(md)

    title = meta.get("title")
    subject = meta.get("subject")
    instructor = meta.get("instructor")
    module = meta.get("module")
    tags_list = meta.get("tags", [])

    if not title or not subject:
        continue

    rel = md.relative_to(NOTES_DIR).as_posix()

    subjects[subject].append((title, rel))
    instructors[instructor].append((title, rel))
    modules[module].append((title, rel))

    for tag in tags_list:
        tags[tag].append((title, rel))


def write_index(folder, data):
    for key, items in data.items():
        name = key.lower().replace(" ", "-")
        path = f"_generated/{folder}/{name}.md"

        with mkdocs_gen_files.open(path, "w") as f:
            f.write(f"# {key}\n\n")

            for title, link in sorted(items):
                f.write(f"- [{title}]({link})\n")


write_index("subjects", subjects)
write_index("instructors", instructors)
write_index("modules", modules)
write_index("tags", tags)
