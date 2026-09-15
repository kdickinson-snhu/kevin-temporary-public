#!/bin/sh
set -eu

page="${1:-mas-velocity-last-3-sprints.html}"

rg -q 'class="sprint-chart-grid"' "$page"
rg -q 'class="contributor-matrix"' "$page"
rg -q 'Current sprint: MAS - 2026.09.22' "$page"
rg -q '<div class="value">81\.5</div>' "$page"
rg -Fq '55.5 completed + 26 current' "$page"
rg -q '26 recorded points across eight tickets' "$page"
rg -q 'MAS-1691 · 5 pts · In Progress · PR pending' "$page"
rg -q 'class="metric-bar kevin" style="width:89\.7%">26<' "$page"
rg -q '>Points currently recorded across active Jira scope<' "$page"
rg -q 'class="panel sprint-evidence kevin-only"' "$page"
rg -Fq '@media(max-width:500px){.contributor-matrix{grid-template-columns:75px repeat(4,56px)' "$page"
rg -q 'class="wispr-infographic"' "$page"
rg -q 'id="wispr-streak-map"' "$page"
rg -q '>411,373<' "$page"
rg -q '>9 days ' "$page"
github_line=$(rg -n 'class="adoption-card github-card"' "$page" | cut -d: -f1)
wispr_line=$(rg -n 'class="adoption-card wispr-card"' "$page" | cut -d: -f1)
test -n "$github_line"
test -n "$wispr_line"
test "$github_line" -lt "$wispr_line"
rg -Fq '.adoption-grid{grid-template-columns:1fr}' "$page"
rg -Fq '.adoption-grid,.adoption-card{min-width:0}' "$page"
rg -q 'class="gauge-rank"' "$page"
rg -q 'id="wpm-gradient"' "$page"
rg -q '432 contributions since April' "$page"
rg -Fq 'for (let day = 0; day < 189;' "$page"
rg -Fq '.github-card .contribution-map{grid-auto-columns:6px;grid-template-rows:repeat(7,6px);gap:2px}' "$page"
rg -Fq '.github-card .heatmap-summary{display:block}' "$page"
rg -q 'src="assets/wispr-book-stack.png"' "$page"
rg -q 'class="book-equivalent">About four books<' "$page"
rg -q 'class="gauge-rank">Top 0.2%<' "$page"
rg -Fq '.gauge-rank{top:7px;position:absolute' "$page"
rg -q '>GitHub activity since joining SNHU<' "$page"
rg -Fq '.github-card .contribution-map,.wispr-card .wispr-streak-grid{grid-auto-columns:22px' "$page"
rg -q 'class="role-title">Senior AI Software Engineer<' "$page"
rg -Fq '.map-legend,.streak-legend{justify-content:center}' "$page"
rg -q '>AI Engineering Leadership &amp; Enablement<' "$page"
rg -q 'class="enablement-flow"' "$page"
rg -q 'class="conference-slide featured"' "$page"
rg -q 'src="assets/ai-engineer-slide-20.png"' "$page"
rg -q 'src="assets/ai-engineer-slide-19.png"' "$page"
rg -q 'src="assets/ai-engineer-slide-01.png"' "$page"
rg -q '>20<.*Slides delivered<' "$page"
rg -q 'class="playbook-hero"' "$page"
rg -q 'class="playbook-hero-count">19<' "$page"
rg -q '>Ticket Playbook skills<' "$page"
rg -q '>Model-agnostic workflow system<' "$page"
rg -q '>Claude compatible<' "$page"
rg -q '>Codex compatible<' "$page"
rg -Fq '.playbook-supporting{display:grid;grid-template-columns:repeat(3,1fr)' "$page"
rg -q 'human-in-the-loop, AI-augmented workflow that accelerates tickets' "$page"
rg -q 'class="skill-catalog"' "$page"
skill_count=$(rg -o 'class="skill-pill"' "$page" | wc -l | tr -d ' ')
test "$skill_count" -eq 19
for skill in ticket-playbook ticket-factory jira-ticket-ops mas-story-point-estimation ticket-clarification impact-analysis hld-design-doc implement-in-worktree runtime-preflight release-change-register create-pr verify-runtime-behavior verify-with-browser qa-verification-steps pr-comment-tracking mas-platform-review-gate cross-model-review-gate mas-tshirt-sizing worktree-cleanup; do
  rg -q ">${skill}<" "$page"
done
rg -Fq '.playbook-models span{padding:9px 14px' "$page"
rg -Fq '.gauge-rank{top:7px' "$page"
rg -Fq 'border:3px solid #fff' "$page"
rg -q '>6,494<.*>Tracked text lines<' "$page"
rg -q '>37<.*>Implementation &amp; docs commits<' "$page"
rg -q '>22<.*>PR merges<' "$page"
rg -q 'August 25.*September 14, 2026' "$page"
rg -q 'https://github.com/MAS-SNHU/mas-ticket-playbook-exp' "$page"
rg -Fq '.enablement-grid{display:grid;grid-template-columns:1fr' "$page"
talk_line=$(rg -n 'class="talk-card"' "$page" | cut -d: -f1)
playbook_line=$(rg -n 'class="playbook-card"' "$page" | cut -d: -f1)
test "$talk_line" -lt "$playbook_line"
rg -Fq '.slide-gallery{grid-template-columns:repeat(2,minmax(0,1fr));grid-template-areas:"cover factory" "final final"' "$page"
rg -q 'href="assets/AI-Engineer-2026-Takeaways.pdf"' "$page"
rg -q 'View full presentation' "$page"
rg -Fq "document.querySelectorAll('a').forEach" "$page"
rg -Fq "link.target = '_blank'" "$page"
rg -Fq "link.rel = 'noopener noreferrer'" "$page"
if rg -q 'class="talk-takeaway"' "$page"; then
  echo "redundant closing-idea bar must be removed" >&2
  exit 1
fi
rg -Fq '.conference-slide figcaption{left:auto;right:18px;bottom:16px' "$page"
rg -Fq 'font-size:27px' "$page"
rg -Fq 'border:3px solid' "$page"
rg -Fq '.conference-slide:not(.featured) figcaption{font-size:14px' "$page"
rg -Fq '.conference-slide.featured figcaption{font-size:27px' "$page"
rg -q 'class="adoption-card codex-card"' "$page"
rg -q '>Codex usage via CodexBar<' "$page"
rg -q '>1.59B<' "$page"
rg -q '>20<.*Active days<' "$page"
rg -q '>100<.*Conversations<' "$page"
rg -q '>96.9%<.*Cached input<' "$page"
rg -q '>gpt-5.6-sol<.*Top model<' "$page"
rg -q 'id="codex-usage-bars"' "$page"
codex_block=$(sed -n '/<article class="adoption-card codex-card">/,/<\/article>/p' "$page")
if printf '%s\n' "$codex_block" | rg -q '\$|cost|spend'; then
  echo "Codex usage panel must not include money metrics" >&2
  exit 1
fi

sprint_block=$(sed -n '/<section class="panel sprint-evidence kevin-only">/,/<\/section>/p' "$page")
if printf '%s\n' "$sprint_block" | rg -q 'Gerard|repeating-linear-gradient'; then
  echo "Kevin-only sprint charts must not include Gerard or striped marks" >&2
  exit 1
fi

sprint_block=$(sed -n '/<section class="panel sprint-evidence">/,/<\/section>/p' "$page")
rollup_block=$(sed -n '/<section class="panel contributor-rollup">/,/<\/section>/p' "$page")

if printf '%s\n%s\n' "$sprint_block" "$rollup_block" | rg -q '<table'; then
  echo "comparison sections must use charts, not tables" >&2
  exit 1
fi

echo "dashboard structure checks passed"
