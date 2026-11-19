# Course glossary

Every new word from the slides, in plain language, in the order the course introduces it. It covers all four sessions.

## Session 1

| Term | Meaning |
| --- | --- |
| **Jargon** | Specialised words that outsiders do not understand. |
| **Chatbot** | A program you talk to in writing in a chat window, such as ChatGPT, Gemini, or Claude in a browser. |
| **Prompt** | The message you write to an AI system: a question, a request, or instructions. |
| **Large language model (LLM)** | A program that has processed huge amounts of text and continues text in a plausible way. Plausible is not the same as true. |
| **Token** | The small piece of text an LLM reads and writes (a short word, part of a word, a number, a punctuation mark). 100 tokens ≈ 75 English words; other languages, including Ukrainian, usually need more. |
| **Tool** | An action an AI may take besides writing text: read or write a file, run a command, search the web. |
| **Harness** | The program around an LLM. It carries out the tools the LLM asks for, sends back the results, asks your permission, and shows you what happens. Examples: Gemini CLI, Claude Code, Codex. |
| **AI agent** | An LLM in a harness, with tools and a goal, working in a loop. |
| **Agent loop** | Decide the next step → act (use a tool) → observe the result → done? If not, repeat. |
| **Context** | Everything the LLM can see when it writes its next reply. Nothing else exists for it. |
| **Context window** | The maximum context, in tokens, that an LLM can consider at once. |
| **Compaction (compression)** | Replacing a long conversation with a summary when the window is nearly full. Details can get lost. |
| **Slash command** | A short command starting with `/`, typed to the harness to control it, such as `/clear`. |
| **File path** | The full address of a file: its chain of folders, then its name. |
| **File extension** | The letters after the last dot in a file name (`.docx`, `.csv`, `.md`, `.py`) that say what kind of file it is. |
| **Script** | A file of instructions for the computer that can be run again and again (`.py` for Python, `.R` for R). |
| **Workspace (project folder)** | The one folder the agent works in. |
| **Plain text file** | A file with only characters and no hidden formatting. |
| **VS Code** | A free program from Microsoft for opening and editing plain text files and folders. |
| **Terminal** | A window where you control the computer by typing commands. |
| **Command** | One typed instruction to the computer. |
| **Shell** | The program inside the terminal that understands commands: zsh on Mac, PowerShell on Windows. |
| **Shell prompt** | The symbol (`%`, `$`, `>`) where you type commands: the computer saying "your turn". |
| **CLI (command-line interface)** | A program used by typing in the terminal. |
| **Markdown** | Plain text formatted with a few symbols (`#`, `-`, `**`). Files end in `.md`. |
| **Instruction file** | A Markdown file the agent reads at the start of every session: `GEMINI.md`, `CLAUDE.md`, or `AGENTS.md`. |
| **Permission request** | The harness asking you before the agent acts. |
| **Diff** | A view showing exactly what a change does to a file: removed lines and added lines. |
| **Approval mode** | How often the harness asks for permission: plan, default, auto-edit, approve-all ("YOLO"). |
| **Plan mode** | The agent may read and propose a plan, but cannot change anything. |
| **Repository** | A project folder with a saved history of changes. |
| **GitHub** | A website that stores repositories online so others can download them. |

## Session 2

| Term | Meaning |
| --- | --- |
| **README** | The file in a project's top folder that explains the project to humans. |
| **CSV (comma-separated values)** | A table saved as plain text, one line per row, values separated by commas. |
| **Provenance** | The documented origin of data: who produced them, where and when you got them, what was done to them. |
| **Home folder** | Your personal folder on the computer, written `~` in the terminal. |
| **Hidden file or folder** | A file or folder whose name starts with a dot (e.g. `.gemini`). Programs keep their settings there. |
| **Settings file** | The file where the harness keeps its configuration, including, in some tools, permission rules. |
| **JSON** | A strict plain text format for settings and data (`.json`). |
| **TOML** | Another strict plain text format for settings (`.toml`). Gemini CLI writes its policy rules in it. |
| **Allow / ask / deny** | The three permission decisions: run without asking, ask each time, always block. |
| **Least privilege** | Give the agent the minimum access it needs for the task. |
| **Sandbox** | A fenced-off area that limits where the agent's commands can have effects. |
| **Prompt injection** | Instructions hidden in material the agent reads, trying to make it do something you did not ask for. |
| **API (application programming interface)** | A door through which programs request data or actions from another program or service. |
| **API key** | A secret code that identifies you to an online service and lets programs use it on your account. Treat it like a password. |
| **MCP (Model Context Protocol)** | The shared standard for connecting agents to applications. Each application's connector is an **MCP server**. |
| **Computer use** | An agent ability to see the screen and control the mouse and keyboard like a person. |
| **Descriptive research question** | A question about what is the case (how much, where, how it changed), not why. |
| **Eurostat** | The statistical office of the European Union. |
| **EU-SILC** | European Union Statistics on Income and Living Conditions: a yearly household survey. |
| **Unit of observation** | What each row of a table describes (in our project: a country-year). |
| **Variable** | A characteristic recorded for every observation. |
| **Percentage point (pp)** | The difference between two percentages: from 35% to 50% is +15 pp. |
| **Web scraping** | Extracting data from web pages automatically, instead of using an official download. |
| **Reproducible** | Same scripts + same data = same results, for anyone who runs them. |
| **Missing value** | An observation for which no value exists. In Eurostat files, often simply a missing row. |
| **Flag** | Eurostat's warning letter on a value: `b` break in series, `e` estimated, `p` provisional. |
| **Supervision log** | Your own record of what you asked the agent, what you approved or changed, and what you checked. |

## Session 3

| Term | Meaning |
| --- | --- |
| **Original source** | The organisation that collected or calculated the numbers. A website that repeats them is a copy. |
| **Sample size (n)** | The number of people behind a number. With a small n, the number can change a lot by chance. |
| **Pipeline** | A chain of scripts, each doing one step, from raw data to results. Run them in order, and you get the same results again. |

**The five habits** (Session 3, from your own projects):

| Habit | In one sentence |
| --- | --- |
| **1. Who made the numbers** | When the agent proposes a source, I open it and find who made the numbers. |
| **2. Read one number** | Before I use a figure, I read one number aloud: who, where, when, unit, how many. |
| **3. Which script** | When I see a number, I ask which script made it. |
| **4. Write it once** | When I decide something, I write it once, in the instruction file. |
| **5. Clear the desk** | When the agent fails twice, I clear the desk and ask for a smaller step. |

## Session 4

| Term | Meaning |
| --- | --- |
| **Dictation tool** | A program that turns your speech into written text, in any text box. It is not an agent: it only types for you. Example: Wispr Flow. |
| **Workflow** | A fixed list of steps that runs in the same order every time. You decide the steps. Some steps are scripts. Some steps are done by agents. |
| **Lead agent** | The agent that divides the work, gives each task to a helper agent, and puts the results together. |
| **Helper agent (subagent)** | An agent that another agent starts for one job. It starts with a clean desk: it sees only its task, its own instructions and its own skills, not the conversation. |
| **Orchestration** | The work of the lead agent: it divides the work among helper agents and combines the results. |
| **Deep research** | A mode in chat apps (Gemini, ChatGPT, Claude): many web searches for several minutes, then a long report with links. |
| **MCP server** | The small program that an application offers to agents (see **MCP** in Session 2). It lists what the agent may ask, for example "search my meetings", and does it when asked. You need one for private things, not for public web pages. |
| **Prompt injection** | Instructions hidden inside material that the agent reads (a web page, a PDF, an email, a data file). They try to make the agent do something you did not ask for. |
| **Structured output** | An answer in a fixed format, such as a table with fixed columns, instead of free text. A program can check it, combine it and compare it. |
| **Labour force** | People who work or look for work. Students who do not look for work are not in it. |
| **Youth unemployment rate** | Unemployed young people as a share of young people in the labour force. The **youth unemployment ratio** is a share of all young people. |
| **Hallucination** | Something an LLM writes that sounds right but is false, for example a reference to an article that does not exist. |
| **DOI (digital object identifier)** | A permanent ID for a publication. Free databases such as Crossref show which publication it belongs to. |
| **Evals (evaluations)** | Test cases with known right answers. You run them after every change to a skill or an agent, and you get a score. |
| **Prose** | Normal text in sentences and paragraphs, as in a memo or a brief. |
| **Skill** | A folder with instructions for one kind of task (a file called `SKILL.md`), sometimes with templates or scripts. The agent reads it only when the task needs it. |
| **Human review (human in the loop)** | A planned stop where the workflow waits for a person to read, change and approve the work before it goes on. |
| **Tracing (trace)** | A record of every step of a workflow: which agent, which tool, which file or website, and when. |
| **AI-use statement** | A short paragraph that says what AI did in a piece of work, and what the person checked and decided. |
| **Guardrails** | Rules and checks around an agent that stop what must never happen. They work before, during or after a step. Most are locks, not polite signs. |
| **Hook (automatic check)** | A small program that the harness runs every time an event happens, for example after a file is saved. The agent cannot skip it. |
