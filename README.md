# AI Agents for Descriptive Social-Science Research

**Martin Alberdi · Online, Zoom**
**10, 12, 17 and 19 November 2026 · 15:30–18:00 EET**

The course is finished. Thank you for four sessions. Everything stays in this folder: the slides, the two practice projects, the instructions, and the new words. It was a pleasure. Let us keep in touch: martin.alberdi@eui.eu.

## Where to start

1. **Run the Session 4 workflow yourself, in Antigravity.** One command in the Antigravity app, or step by step in VS Code. Follow [`instructions/antigravity_map.pdf`](instructions/antigravity_map.pdf). No paid plan is needed. The steps are summarised below.
2. **Use the five habits in every project.** Copy the skills in [`user_level_skills/`](user_level_skills/) to your computer (step 8 of the instructions).
3. **Look back at the slides** in [`slides/`](slides/). New words are explained in [`GLOSSARY.md`](GLOSSARY.md). Optional links, and what to read next, are in [`RESOURCES.md`](RESOURCES.md).

## After the course: the monthly brief in Antigravity

In Session 4 we built one workflow that finds sources, checks facts and writes a memo and a brief. In class, it ran in Claude Code. The project folder [`monthly_youth_brief/`](monthly_youth_brief/) now contains the same pieces for Antigravity too, so you do not need to move any files. You need the Antigravity app and the Antigravity extension in VS Code; R is optional.

**Two ways (details in [`instructions/antigravity_map.pdf`](instructions/antigravity_map.pdf)):**

- **One command, in the Antigravity app.** Open `monthly_youth_brief/` in the app and type `/monthly-brief`. The lead agent starts helper agents and runs the whole workflow. It stops before anything is shared, and waits for your review.
- **Step by step, in VS Code.** Antigravity in VS Code reads the same skills, but it cannot start helper agents. So you run each step yourself, with a new conversation for each check, as in class.

**Steps:**

1. Get a fresh copy of the project: download the course folder again (green **Code** button ➜ **Download ZIP**), and copy `monthly_youth_brief/` into Documents (not OneDrive, Dropbox or iCloud).
2. Open it in the Antigravity app, and ask which instruction file, skills and helper agents it can see.
3. Run the whole workflow with one command: `/monthly-brief`.
4. Or step by step in VS Code: the request and the data.
5. Find sources for one country, then check the seven test claims.
6. Write the memo and the brief, then run the number check.
7. The second check, in a new conversation, and your own review.
8. Optional: the five habits in every project (`user_level_skills/`).

**You are the supervisor.** Plan first. Allow each request this time only. Never allow the agent to read `evals/answer_key.csv`: only the script `scripts/score_evals.py` reads it.

**Stuck?** First ask the agent: "Explain this error in simple words." Still stuck? Email martin.alberdi@eui.eu the step number and a screenshot.

**Using Claude Code instead?** Open `monthly_youth_brief/` in Claude Code and type `/monthly-brief`. The folder `.claude/` holds the version we ran in class, with its locks and automatic checks. Claude Code needs a paid plan.

## What is in this folder

| Item | What it is |
| --- | --- |
| [`slides/`](slides/) | The slides of all four sessions. |
| [`instructions/`](instructions/) | Step-by-step instructions: setup before Session 2, your own project before Session 3, and Session 4 in Antigravity. |
| [`youth_at_home_project/`](youth_at_home_project/) | The practice project from Sessions 2 and 3: young adults living with their parents. |
| [`monthly_youth_brief/`](monthly_youth_brief/) | The Session 4 project: one workflow that finds sources, checks facts and writes a memo and a brief. For Antigravity and Claude Code. |
| [`user_level_skills/`](user_level_skills/) | The five habits from Session 3, as skills, and one command that runs three of them. |
| [`GLOSSARY.md`](GLOSSARY.md) | Every new word from the slides, in plain language, session by session. |
| [`RESOURCES.md`](RESOURCES.md) | The optional links the slides point to, and what to read next. |
| [`syllabus_programme_2026_ai_agents.pdf`](syllabus_programme_2026_ai_agents.pdf) | The course syllabus. |

## The four sessions

| Session | Date | Slides | Instructions |
| --- | --- | --- | --- |
| 1. Getting started | 10 November | [session1_getting_started.pdf](slides/session1_getting_started.pdf) | [Setup before Session 2](instructions/setup_before_session_2.pdf) |
| 2. Using agents | 12 November | [session2_using_agents.pdf](slides/session2_using_agents.pdf) | [Your own project, before Session 3](instructions/before_session_3.pdf) |
| 3. Five habits from your projects | 17 November | [session3_supervising_your_project.pdf](slides/session3_supervising_your_project.pdf) | The five habits: [`user_level_skills/`](user_level_skills/) |
| 4. One workflow to find, check and write | 19 November | [session4_one_workflow.pdf](slides/session4_one_workflow.pdf) | [Session 4 in Antigravity](instructions/antigravity_map.pdf) |

## Optional background reading

Paul Goldsmith-Pinkham's series *Claude Code for Economists* shows realistic research uses of an AI agent. It uses Claude Code, while we use Antigravity, but the ideas carry over.

1. [Getting Started with Claude Code: A Researcher's Setup Guide](https://paulgp.substack.com/p/getting-started-with-claude-code)
2. [From an Empty Folder to a Figure using Claude Code](https://paulgp.substack.com/p/from-an-empty-folder-to-a-figure)
3. [From EDGAR Filings to a Structured Database using Claude Code](https://paulgp.substack.com/p/from-edgar-filings-to-a-structured)
4. [Large Datasets and Structured Databases: Claude Code for Economists](https://paulgp.substack.com/p/large-datasets-and-structured-databases)
5. [Writing & Thinking with AI Assistance](https://paulgp.substack.com/p/writing-and-thinking-with-ai-assistance)
6. [Skills: Specifying How an Agent Should Think](https://paulgp.substack.com/p/skills-specifying-how-an-agent-should)
7. [Permissions, Sandboxes, and Autonomous Agents](https://paulgp.substack.com/p/permissions-sandboxes-and-autonomous)
8. [Integration and Collaboration in AI Research Work](https://paulgp.substack.com/p/integration-and-collaboration-in)

What to read next, after the course, is at the end of [`RESOURCES.md`](RESOURCES.md). A good start: Chris Blattman's [two-month plan](https://claudeblattman.com/starter-kit/two-month-plan/) for researchers who want to keep going.
