from pathlib import Path
from collections import defaultdict
import re
import yaml
import mkdocs_gen_files

NOTES_DIR = Path("notes")

subjects = defaultdict(list)
instructors = defaultdict(list)
modules = defaultdict(list)
tags = defaultdict(list)
subject_instructors: dict[str, dict[str, list[tuple[str, str]]]] = defaultdict(lambda: defaultdict(list))


def read_frontmatter(path: Path) -> dict:
    text = path.read_text(encoding="utf-8")
    if not text.startswith("---"):
        return {}

    parts = text.split("---", 2)
    if len(parts) < 3:
        return {}

    return yaml.safe_load(parts[1]) or {}


def slug(value: str) -> str:
    value = value.strip().lower()
    value = re.sub(r"[\\/]+", "-", value)
    value = re.sub(r"[^\w\s-]", "", value)
    value = re.sub(r"\s+", "-", value)
    value = re.sub(r"-+", "-", value)
    return value or "untitled"


def relative_link(from_file: str, target_file: str) -> str:
    from_path = Path(from_file)
    target_path = Path(target_file)
    return Path(
        Path.cwd().joinpath(target_path).relative_to(Path.cwd())
    ).as_posix() if from_path.parent == Path(".") else Path(
        Path(
            Path(
                __import__("os").path.relpath(
                    target_path.as_posix(),
                    start=from_path.parent.as_posix(),
                )
            )
        )
    ).as_posix()


def write_index(folder: str, data: dict[str, list[tuple[str, str]]]) -> None:
    for key, items in data.items():
        filename = slug(key)
        output_path = f"_generated/{folder}/{filename}.md"

        with mkdocs_gen_files.open(output_path, "w") as f:
            f.write(f"# {key}\n\n")

            for title, target in sorted(items):
                link = relative_link(output_path, target)
                f.write(f"- [{title}]({link})\n")


for md in NOTES_DIR.rglob("*.md"):
    if "subjects" in md.parts:
        continue
    if "_generated" in md.parts:
        continue
    if md.name in {"index.md", "tags.md", "README.md"}:
        continue

    meta = read_frontmatter(md)

    title = meta.get("title")
    subject = meta.get("subject")
    instructor = meta.get("instructor")
    module = meta.get("module")
    tags_list = meta.get("tags", [])

    if not title:
        continue
    
    subject = subject or "Unknown"

    rel = md.relative_to(NOTES_DIR).as_posix()

    subjects[subject].append((title, rel))

    if instructor:
        instructors[instructor].append((title, rel))
        subject_instructors[subject][instructor].append((title, rel))

    if module:
        modules[module].append((title, rel))

    for tag in tags_list:
        tags[str(tag)].append((title, rel))


write_index("subjects", subjects)
write_index("instructors", instructors)
write_index("modules", modules)
write_index("tags", tags)

for subject_key, instructor_data in subject_instructors.items():
    subject_slug = slug(subject_key)
    for instructor_key, items in instructor_data.items():
        instructor_slug = slug(instructor_key)
        output_path = f"_generated/subjects/{subject_slug}/instructors/{instructor_slug}.md"
        with mkdocs_gen_files.open(output_path, "w") as f:
            f.write(f"# {subject_key} — {instructor_key}\n\n")
            for title, target in sorted(items):
                link = relative_link(output_path, target)
                f.write(f"- [{title}]({link})\n")
