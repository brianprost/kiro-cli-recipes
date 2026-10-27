# kiro-cli-recipes

A collection of custom agents, hooks, and configs for Amazon Kiro CLI.

## What's _going to be_ included

- Custom agents
- Hooks
- CLI configuration examples
- Workflow snippets

## Usage

Copy anything useful into your own Kiro CLI setup and adapt it as needed. This all may change at any point.

The bundled agents load skills from `.kiro/skills` and `~/.kiro/skills`, not
directly from `.agents/skills`. Kiro does not enforce the manual-only invocation
flag, so these directories should expose only automatically invocable skills.
Brian's YADM setup generates that filtered view with:

```bash
bun ~/.config/yadm/sync-kiro-skills.ts         # global skills
bun ~/.config/yadm/sync-kiro-skills.ts "$PWD"  # project skills
```

Keep canonical skills in `.agents/skills`. To use an excluded skill in Kiro,
add its file explicitly, for example `/context add ~/.agents/skills/retro/SKILL.md`,
then ask Kiro to use it.

## License

MIT. Use, modify, and share freely.
