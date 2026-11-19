#!/usr/bin/env python3
"""Tracing (a hook): write one line to logs/trace.md for every step.

Runs after every tool call, and when a helper agent starts or stops (see
.claude/settings.json). Each line says when, which agent, what kind of step,
which tool, and what it touched (a file, a command, a web address, a search).
The trace answers the question "which step made this?", and is the raw
material for the AI-use statement. Standard library only.
"""
import datetime, json, os, sys


def target_of(tool_input):
    for key in ("file_path", "command", "url", "query", "skill", "subagent_type",
                "description", "pattern", "prompt"):
        value = tool_input.get(key)
        if value:
            return str(value)
    return json.dumps(tool_input)[:100]


def main():
    try:
        data = json.load(sys.stdin)
    except json.JSONDecodeError:
        return 0
    project = os.environ.get("CLAUDE_PROJECT_DIR", data.get("cwd", os.getcwd()))
    path = os.path.join(project, "logs", "trace.md")
    os.makedirs(os.path.dirname(path), exist_ok=True)
    if not os.path.exists(path):
        with open(path, "w", encoding="utf-8") as f:
            f.write("# Trace: every step, written by scripts/trace.py\n\n")
            f.write("| time | agent | step | tool | what it touched |\n")
            f.write("|---|---|---|---|---|\n")

    event = data.get("hook_event_name", "")
    agent = data.get("agent_type") or "lead"
    tool, touched = "", ""
    if event == "PostToolUse":
        step = "tool used"
        tool = data.get("tool_name", "")
        touched = target_of(data.get("tool_input") or {})
    elif event == "SubagentStart":
        step = "helper agent started"
    elif event == "SubagentStop":
        step = "helper agent finished"
    else:
        step = event
    touched = " ".join(touched.split()).replace("|", "/")
    if len(touched) > 110:
        touched = touched[:107] + "..."
    time = datetime.datetime.now().strftime("%H:%M:%S")
    with open(path, "a", encoding="utf-8") as f:
        f.write(f"| {time} | {agent} | {step} | {tool} | {touched} |\n")
    return 0


if __name__ == "__main__":
    sys.exit(main())
