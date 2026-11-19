# Resources

The slides point here with **More: RESOURCES.md → *topic***. Everything is optional. Each section starts with the gentlest resource. New words are explained in [GLOSSARY.md](GLOSSARY.md).

## Session 1: getting started

### Terminal for beginners
- [The Unix Shell](https://swcarpentry.github.io/shell-novice/) (Software Carpentry): a free, slow-paced lesson written for researchers. Episodes 1–3 cover everything in the course.
- [Command line crash course](https://developer.mozilla.org/en-US/docs/Learn_web_development/Getting_started/Environment_setup/Command_line) (MDN): a one-page introduction for Mac and Windows.
- [PowerShell 101](https://learn.microsoft.com/en-us/powershell/scripting/learn/ps101/01-getting-started) (Microsoft): if you are on Windows.
- [The Missing Semester: the shell](https://missing.csail.mit.edu/2020/course-shell/) (MIT): more advanced, for the curious.

### VS Code
- [User interface](https://code.visualstudio.com/docs/getstarted/userinterface): official names of all the areas (A–F on the slides).
- [Terminal basics](https://code.visualstudio.com/docs/terminal/basics): using the terminal inside VS Code.

### Tokens
- [What are tokens and how to count them](https://help.openai.com/en/articles/4936856-what-are-tokens-and-how-to-count-them) (OpenAI help): the "100 tokens ≈ 75 words" rule of thumb.
- [Tokenizer](https://platform.openai.com/tokenizer): paste a sentence and see how it is split into tokens. Try English, then Ukrainian.

### Harnesses and agents
- [Gemini CLI documentation](https://geminicli.com/docs): our course tool.
- [Claude Code documentation](https://code.claude.com/docs) and [Codex documentation](https://developers.openai.com/codex): the two other tools in the "In your tool" boxes.

### Agent tools compared
- [Agentic AI for social scientists](https://github.com/ddekadt/cornell-agentic-ai) (Cornell workshop materials): a more advanced two-session course. Our course borrows some of its ideas.
- [Claude Code for applied economists](https://paulgp.substack.com) (Paul Goldsmith-Pinkham's video series): realistic research demonstrations, from data analysis to web data.

### Markdown
- [Markdown Guide: basic syntax](https://www.markdownguide.org/basic-syntax/): everything on the "six symbols" slide, and a little more.
- [Basic writing and formatting syntax](https://docs.github.com/en/get-started/writing-on-github/getting-started-with-writing-and-formatting-on-github/basic-writing-and-formatting-syntax) (GitHub).

### Instruction files
- [GEMINI.md files](https://geminicli.com/docs/cli/gemini-md) (Gemini CLI).
- [AGENTS.md](https://agents.md): the shared format used by Codex and several other tools.
- [Memory and CLAUDE.md](https://code.claude.com/docs/en/memory) (Claude Code).

### Plan mode and approval modes
- [Plan mode](https://geminicli.com/docs/cli/plan-mode) (Gemini CLI).

### Privacy and terms of use
- [Gemini API Additional Terms of Service](https://ai.google.dev/gemini-api/terms). Read the section on **Unpaid Services**. The slides quote the version effective 23 March 2026, checked on 6 November 2026.

### The incidents mentioned in Part 5 of Session 1
- [Two major AI coding tools wiped out user data after making cascading mistakes](https://arstechnica.com/information-technology/2025/07/ai-coding-assistants-chase-phantoms-destroy-real-user-data/) (Ars Technica, 24 July 2025).

## Session 2: using agents

### Settings and permissions
- [Gemini CLI configuration](https://geminicli.com/docs/reference/configuration): where `settings.json` lives and what it can contain.
- [Gemini CLI policy engine](https://geminicli.com/docs/reference/policy-engine): the allow, ask, and deny rules, with the `rm -rf` example from the slides.
- [Claude Code settings](https://code.claude.com/docs/en/settings): permission rules in JSON.
- [Codex configuration](https://developers.openai.com/codex): approval policy and sandbox mode.
- [Introducing JSON](https://www.json.org/json-en.html): the format on one page.

### Prompt injection
- [LLM01: Prompt injection](https://genai.owasp.org/llmrisk/llm01-prompt-injection/) (OWASP): a short, non-technical overview.

### APIs and MCP
- [What is the Model Context Protocol?](https://modelcontextprotocol.io): the official introduction.
- [Gemini CLI and MCP servers](https://geminicli.com/docs/tools/mcp-server).

### Connectors
- [Composio](https://composio.dev): the connector hub mentioned on the slides. Check its current list of supported apps. We do not install it in this course.

### Eurostat
- [Getting started with Eurostat's API](https://ec.europa.eu/eurostat/web/user-guides/data-browser/api-data-access/api-getting-started).
- [Table ilc_lvps08 in the data browser](https://ec.europa.eu/eurostat/databrowser/view/ilc_lvps08/default/table): use it to check values by hand.
- [EU-SILC metadata](https://ec.europa.eu/eurostat/cache/metadata/en/ilc_sieusilc.htm): how the survey defines households and living with parents.
- [EU-SILC methodology: population structure](https://ec.europa.eu/eurostat/statistics-explained/index.php/EU_statistics_on_income_and_living_conditions_%28EU-SILC%29_methodology_-_population_structure) (Statistics Explained).

## Session 3: supervising your project

The slides for Session 3 have no extra links. For the five habits, see [GLOSSARY.md](GLOSSARY.md) and the `user_level_skills/` folder.

## Session 4: one workflow to find, check and write

### Skills, helper agents and hooks
- [Agent Skills](https://agentskills.io): the open format for `SKILL.md` folders. Antigravity and Claude Code both read it.
- Antigravity documentation: [skills](https://antigravity.google/docs/skills), [instruction files (rules)](https://antigravity.google/docs/rules), [helper agents (subagents)](https://antigravity.google/docs/subagents), [hooks](https://antigravity.google/docs/hooks), [permissions](https://antigravity.google/docs/permissions/).
- Claude Code documentation: [skills](https://code.claude.com/docs/en/skills), [subagents](https://code.claude.com/docs/en/sub-agents), [hooks](https://code.claude.com/docs/en/hooks). This is the tool used in the Session 4 demos.

### MCP connections
- [Antigravity: MCP servers](https://antigravity.google/docs/mcp): how to add a connection, in the app, the CLI and VS Code.
- [What is the Model Context Protocol?](https://modelcontextprotocol.io): the official introduction (also in Session 2).

### Checking facts and references
- [Crossref](https://www.crossref.org) and [OpenAlex](https://openalex.org): free databases of research publications. Paste a DOI into [search.crossref.org](https://search.crossref.org) to see which publication it belongs to.
- [Unemployment statistics](https://ec.europa.eu/eurostat/statistics-explained/index.php?title=Unemployment_statistics) (Eurostat, Statistics Explained): the youth unemployment rate, explained.
- [Table une_rt_m in the data browser](https://ec.europa.eu/eurostat/databrowser/view/une_rt_m/default/table): the monthly rates used in the project. Use it to check values by hand.

## After the course: what to read next

Start with the first link that matches where you are.

- [Start from scratch](https://claudeblattman.com/starter-kit/newcomers/) (Chris Blattman, *Claude Blattman: AI for professionals who don't code*): a gentle setup guide for researchers.
- [Next steps for intermediate and advanced users](https://claudeblattman.com/starter-kit/two-month-plan/) (Chris Blattman): a two-month plan in stages. Month one builds habits; month two moves to bigger work. For research, the most useful stages are 3 (a project home and research design) and 4 (research a real question). It assumes Claude Code or Codex, but most ideas work in Antigravity.
- [AI-driven research](https://claudeblattman.com/workflows/deep-research/) (Chris Blattman): using agents and deep research for a literature search, with a worked example.
- Paul Goldsmith-Pinkham's series *Claude Code for Economists* (links in [README.md](README.md)): realistic research demonstrations, from data to writing.
- [Agentic AI for social scientists](https://github.com/ddekadt/cornell-agentic-ai) (Cornell workshop materials): a more advanced two-session course.

Tools and prices change quickly. Before you pay for anything, check what the free plan includes, and apply the data rules from Session 1: no personal or confidential data without permission.
