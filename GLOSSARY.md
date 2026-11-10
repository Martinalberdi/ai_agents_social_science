# Course glossary

Every new word from the slides, in plain language, in the order the course introduces it. The glossary grows after each session.

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
