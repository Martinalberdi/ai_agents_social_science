# The five habits, as skills

The five habits from Session 3, written as skills that an agent can use in every
project. Each folder holds one `SKILL.md` file.

| Folder | What it does |
|---|---|
| `course-who-made-the-numbers` | Habit 1: for each data source, find who made the numbers. Original or copy? |
| `course-read-one-number` | Habit 2: read one number of a figure aloud: who, where, when, unit, how many. |
| `course-which-script` | Habit 3: find which script made each number in a figure, table or text. |
| `course-write-it-once` | Habit 4: list the decisions that are not yet written in the instruction file. |
| `course-handover` | Habit 5: when the agent fails twice, write a short note and start again with a smaller step. |
| `course-before-sharing` | One command that runs habits 1 to 3 before you share a figure or a brief. |

## Install them once, for all your projects

- **Antigravity:** copy each folder into `~/.gemini/config/skills/`
  (Windows: `%USERPROFILE%\.gemini\config\skills\`). Step 9 of
  `instructions/antigravity_map.pdf` shows how.
- **Claude Code:** copy each folder into `~/.claude/skills/`.

Then open any project and ask: "Which skills can you see?" Before you share a
figure, type `/course-before-sharing`.
