const String debugViewerHtml = r'''
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>FlowBuilder Console v2.0</title>
<style>
:root {
  /* Isar-inspector-like light palette */
  --bg: #f6f7f9;
  --panel: #ffffff;
  --panel-2: #f9fafb;
  --border: #e5e7eb;
  --border-strong: #d1d5db;
  --text: #111827;
  --text-2: #4b5563;
  --text-muted: #9ca3af;
  --accent: #2680eb;
  --accent-2: #1c6cd0;
  --accent-tint: #eaf2fd;

  /* Event type accents (preserved) */
  --green: #16a34a;   --green-tint: #dcfce7;
  --orange: #d97706;  --orange-tint: #fef3c7;
  --red: #dc2626;     --red-tint: #fee2e2;
  --purple: #8b5cf6;  --purple-tint: #ede9fe;
  --pink: #ec4899;    --pink-tint: #fce7f3;
  --cyan: #0891b2;    --cyan-tint: #cffafe;

  /* JSON tree */
  --str-color: #0f766e;
  --num-color: #1c6cd0;
  --bool-color: #7c3aed;
  --null-color: #9ca3af;
  --key-color: #374151;

  --highlight: rgba(38,128,235,0.10);
  --highlight-border: var(--accent);

  --radius: 8px;
  --radius-sm: 6px;
  --shadow-sm: 0 1px 2px rgba(17,24,39,0.04);
  --shadow-md: 0 4px 12px rgba(17,24,39,0.06);

  --mono: ui-monospace, 'SF Mono', 'Fira Code', 'Cascadia Code', Menlo, Consolas, monospace;
  --sans: -apple-system, BlinkMacSystemFont, 'Inter', 'Segoe UI', Roboto, Helvetica, Arial, sans-serif;

  --topbar-h: 56px;
  --sidebar-w: 232px;
  --config-w: 440px;
}
* { margin: 0; padding: 0; box-sizing: border-box; }
html, body { background: var(--bg); color: var(--text); font: 13.5px/1.5 var(--sans); height: 100vh; overflow: hidden; }
button, input, select { font: inherit; color: inherit; }

/* ───────── Top bar ───────── */
.topbar {
  height: var(--topbar-h);
  display: grid;
  grid-template-columns: auto 1fr auto;
  align-items: center;
  gap: 20px;
  padding: 0 20px;
  background: var(--panel);
  border-bottom: 1px solid var(--border);
  position: sticky; top: 0; z-index: 10;
}
.brand { display: flex; align-items: center; gap: 10px; }
.brand .logo {
  width: 32px; height: 32px; border-radius: 8px;
  background: linear-gradient(135deg, var(--accent), #56a3f2);
  color: white; font-weight: 700; font-size: 13px; letter-spacing: 0.5px;
  display: grid; place-items: center;
  box-shadow: var(--shadow-sm);
}
.brand .brand-text { line-height: 1.15; }
.brand .brand-title { font-weight: 600; font-size: 14px; }
.brand .brand-sub { font-size: 11px; color: var(--text-muted); }

.status-pill {
  display: inline-flex; align-items: center; gap: 8px;
  height: 28px; padding: 0 12px;
  background: var(--panel-2); border: 1px solid var(--border);
  border-radius: 999px; font-size: 12px; color: var(--text-2);
}
.status-pill .dot {
  width: 8px; height: 8px; border-radius: 50%;
  background: var(--red);
  transition: background 0.2s;
}
.status-pill .dot.connected { background: var(--green); }
.status-pill .event-count {
  color: var(--text-muted); font-size: 11px; margin-left: 6px;
  padding-left: 8px; border-left: 1px solid var(--border);
}
.actions { display: flex; gap: 8px; }
.btn {
  height: 30px; padding: 0 12px;
  border-radius: var(--radius-sm);
  border: 1px solid var(--border);
  background: var(--panel);
  color: var(--text);
  cursor: pointer; font-weight: 500; font-size: 12.5px;
  transition: background 0.1s, border-color 0.1s, color 0.1s;
}
.btn:hover { background: var(--panel-2); border-color: var(--border-strong); }
.btn.primary { background: var(--accent); color: white; border-color: var(--accent-2); }
.btn.primary:hover { background: var(--accent-2); }
.btn.ghost { background: transparent; }
.btn.danger:hover { color: var(--red); border-color: var(--red); }
.btn.active { color: var(--accent-2); background: var(--accent-tint); border-color: transparent; }

/* ───────── Workspace grid ───────── */
.workspace {
  display: grid;
  grid-template-columns: var(--sidebar-w) 1fr var(--config-w);
  height: calc(100vh - var(--topbar-h));
  transition: grid-template-columns 0.2s ease;
}
.workspace.no-config { grid-template-columns: var(--sidebar-w) 1fr 0; }
.workspace.no-config .config-panel { display: none; }

/* ───────── Sidebar ───────── */
.sidebar {
  background: var(--panel);
  border-right: 1px solid var(--border);
  display: flex; flex-direction: column;
  overflow: hidden;
}
.side-heading {
  padding: 14px 16px 6px;
  font-size: 11px;
  text-transform: uppercase;
  letter-spacing: 0.7px;
  color: var(--text-muted);
  font-weight: 600;
}
.side-nav { display: flex; flex-direction: column; padding: 4px 8px; flex: 1; overflow-y: auto; }
.side-item {
  display: grid; grid-template-columns: 26px 1fr auto; align-items: center;
  gap: 10px;
  height: 36px;
  padding: 0 8px;
  border: 1px solid transparent;
  background: transparent;
  border-radius: var(--radius-sm);
  cursor: pointer;
  color: var(--text-2);
  text-align: left;
  font-size: 13px;
}
.side-item:hover { background: var(--panel-2); color: var(--text); }
.side-item.active { background: var(--accent-tint); color: var(--accent-2); font-weight: 600; }
.side-item .ic {
  width: 22px; height: 22px; border-radius: 5px;
  display: grid; place-items: center;
  font-family: var(--mono); font-size: 11px; font-weight: 700;
  background: var(--panel-2); border: 1px solid var(--border); color: var(--text-2);
}
.side-item.active .ic { background: white; border-color: transparent; color: var(--accent-2); }
.side-item[data-tab="actions"]   .ic { color: var(--purple); background: var(--purple-tint); border-color: transparent; }
.side-item[data-tab="state"]     .ic { color: var(--orange); background: var(--orange-tint); border-color: transparent; }
.side-item[data-tab="search"]    .ic { color: var(--cyan);   background: var(--cyan-tint);   border-color: transparent; }
.side-item[data-tab="nav"]       .ic { color: var(--pink);   background: var(--pink-tint);   border-color: transparent; }
.side-item[data-tab="resolvers"] .ic { color: var(--green);  background: var(--green-tint);  border-color: transparent; }
.side-item .badge {
  min-width: 22px; height: 20px; padding: 0 6px;
  background: var(--panel-2); border: 1px solid var(--border); border-radius: 999px;
  font-size: 11px; color: var(--text-2);
  display: grid; place-items: center;
}
.side-item .badge:empty { display: none; }
.side-item.active .badge { background: white; border-color: transparent; color: var(--accent-2); font-weight: 600; }
.side-footer { padding: 10px 12px; border-top: 1px solid var(--border); }

/* ───────── Main content ───────── */
.main { display: flex; flex-direction: column; overflow: hidden; background: var(--bg); }
.main-head {
  display: flex; align-items: center; justify-content: space-between;
  padding: 12px 20px;
  gap: 12px;
  background: var(--panel);
  border-bottom: 1px solid var(--border);
}
.main-title { font-size: 16px; font-weight: 600; }
.filter-bar {
  display: flex; gap: 6px; padding: 8px 20px;
  background: var(--panel); border-bottom: 1px solid var(--border);
  overflow-x: auto;
}
.filter-chip {
  font-size: 12px; padding: 4px 12px; border-radius: 999px;
  border: 1px solid var(--border); background: var(--panel-2);
  color: var(--text-2); cursor: pointer; transition: all 0.1s;
  white-space: nowrap;
}
.filter-chip:hover { color: var(--text); border-color: var(--border-strong); }
.filter-chip.active {
  border-color: transparent; color: var(--accent-2); background: var(--accent-tint); font-weight: 600;
}
.content { flex: 1; overflow: auto; padding: 16px 20px; }

/* ───────── Config panel (right) ───────── */
.config-panel {
  background: var(--panel);
  border-left: 1px solid var(--border);
  display: flex; flex-direction: column;
  overflow: hidden;
}
.config-panel .panel-header {
  display: flex; align-items: center; gap: 10px;
  padding: 12px 16px;
  background: var(--panel);
  border-bottom: 1px solid var(--border);
}
.config-panel .panel-title {
  font-size: 11px; font-weight: 600; text-transform: uppercase;
  letter-spacing: 0.7px; color: var(--text-muted);
}
.config-panel select {
  height: 28px; padding: 0 8px;
  background: var(--panel-2);
  color: var(--text);
  border: 1px solid var(--border);
  border-radius: var(--radius-sm);
  font-size: 12px;
  flex: 1; min-width: 0;
}
.config-panel select:focus { outline: none; border-color: var(--accent); box-shadow: 0 0 0 3px var(--accent-tint); }
.config-panel .panel-body { flex: 1; overflow: auto; padding: 12px 16px; }

/* ───────── Event cards (type colors preserved) ───────── */
.event-card {
  background: var(--panel);
  border: 1px solid var(--border);
  border-left: 3px solid var(--border);
  border-radius: var(--radius);
  padding: 10px 14px;
  margin-bottom: 8px;
  cursor: pointer;
  transition: border-color 0.1s, box-shadow 0.1s;
  box-shadow: var(--shadow-sm);
}
.event-card:hover { border-color: var(--border-strong); box-shadow: var(--shadow-md); }
.event-card.action     { border-left-color: var(--purple); }
.event-card.condition  { border-left-color: var(--cyan); }
.event-card.stateChange{ border-left-color: var(--orange); }
.event-card.navigation { border-left-color: var(--pink); }
.event-card.resolver   { border-left-color: var(--green); }
.event-card .header-row { display: flex; align-items: center; gap: 8px; flex-wrap: wrap; }
.event-card .type-badge {
  font-size: 9.5px; font-weight: 700; text-transform: uppercase;
  padding: 2px 7px; border-radius: 4px;
  letter-spacing: 0.5px;
}
.event-card .type-badge.action     { background: var(--purple-tint); color: var(--purple); }
.event-card .type-badge.condition  { background: var(--cyan-tint);   color: var(--cyan); }
.event-card .type-badge.stateChange{ background: var(--orange-tint); color: var(--orange); }
.event-card .type-badge.navigation { background: var(--pink-tint);   color: var(--pink); }
.event-card .type-badge.resolver   { background: var(--green-tint);  color: var(--green); }
.event-card .summary { font-size: 13px; font-weight: 500; flex: 1; color: var(--text); word-break: break-word; }
.event-card .status-icon { font-size: 13px; }
.event-card .status-icon.success { color: var(--green); }
.event-card .status-icon.failure { color: var(--red); }
.event-card .status-icon.skipped { color: var(--text-muted); }
.event-card .status-icon.started { color: var(--orange); animation: blink 1s infinite; }
.event-card.started {
  border-color: var(--orange); background: var(--orange-tint);
}
.event-card.has-error { border-color: var(--red); background: rgba(220,38,38,0.03); }
.event-card .time { font-size: 10.5px; color: var(--text-muted); font-family: var(--mono); }
.event-card .config-path-badge {
  font-size: 10px; padding: 2px 7px; border-radius: 4px;
  background: var(--orange-tint); color: var(--orange);
  font-family: var(--mono); cursor: pointer;
  transition: background 0.1s;
}
.event-card .config-path-badge:hover { background: var(--orange); color: white; }
.event-card .details {
  margin-top: 8px; padding-top: 8px;
  border-top: 1px solid var(--border);
  display: none;
}
.event-card.expanded .details { display: block; }

/* ───────── Context snapshot ───────── */
.context-snapshot {
  margin-top: 8px;
  padding: 8px 10px;
  background: var(--accent-tint);
  border: 1px solid rgba(38,128,235,0.2);
  border-radius: var(--radius-sm);
}
.context-snapshot .ctx-header {
  font-size: 11px; font-weight: 600; color: var(--accent-2);
  cursor: pointer; user-select: none;
}
.context-snapshot .ctx-header:hover { color: var(--accent); }
.context-snapshot .ctx-body { display: none; max-height: 250px; overflow: auto; margin-top: 6px; }
.context-snapshot .ctx-body.visible { display: block; }

/* ───────── State sections ───────── */
.state-section {
  background: var(--panel);
  border: 1px solid var(--border);
  border-radius: var(--radius);
  margin-bottom: 12px;
  overflow: hidden;
  box-shadow: var(--shadow-sm);
}
.state-section .section-header {
  padding: 10px 14px;
  background: var(--panel-2);
  font-size: 12px; font-weight: 600;
  display: flex; align-items: center; gap: 8px;
  cursor: pointer; user-select: none;
  border-bottom: 1px solid var(--border);
}
.state-section .section-header .arrow {
  transition: transform 0.15s;
  display: inline-block; font-size: 10px; color: var(--text-muted);
}
.state-section.expanded .section-header .arrow { transform: rotate(90deg); }
.state-section .section-body { padding: 12px 14px; display: none; background: var(--panel); }
.state-section.expanded .section-body { display: block; }

/* ───────── JSON tree ───────── */
.json-tree { font-family: var(--mono); font-size: 12px; line-height: 1.6; color: var(--text); }
.json-tree .jt-key { color: var(--key-color); }
.json-tree .jt-str { color: var(--str-color); }
.json-tree .jt-num { color: var(--num-color); }
.json-tree .jt-bool { color: var(--bool-color); font-weight: 600; }
.json-tree .jt-null { color: var(--null-color); font-style: italic; }
.json-tree .jt-toggle { cursor: pointer; user-select: none; display: inline-block; width: 14px; text-align: center; color: var(--text-muted); font-size: 10px; }
.json-tree .jt-toggle:hover { color: var(--accent); }
.json-tree .jt-bracket { color: var(--text-muted); }
.json-tree .jt-comma { color: var(--text-muted); }
.json-tree .jt-collapsed-preview { color: var(--text-muted); font-size: 11px; }
.json-tree .jt-children { display: block; }
.json-tree .jt-children.collapsed { display: none; }

/* ───────── Config tree highlighting ───────── */
.cfg-node { position: relative; }
.cfg-node.highlighted {
  background: var(--highlight);
  border-left: 2px solid var(--highlight-border);
  margin-left: -2px;
}
.cfg-node.highlighted > .jt-row:first-child::before { content: '\25B6'; color: var(--accent); font-size: 10px; margin-right: 4px; }
.cfg-node.active-exec {
  background: var(--orange-tint);
  border-left: 2px solid var(--orange);
  margin-left: -2px;
  animation: exec-pulse 1.5s infinite;
}
.cfg-node.active-exec > .jt-row:first-child::before { content: '\25B6'; color: var(--orange); font-size: 10px; margin-right: 4px; animation: blink 1s infinite; }
@keyframes exec-pulse { 0%,100% { background: var(--orange-tint); } 50% { background: rgba(217,119,6,0.06); } }
@keyframes blink { 0%,100% { opacity: 1; } 50% { opacity: 0.3; } }

/* ───────── Sub-label + error trace ───────── */
.sub-label {
  font-size: 11px; font-weight: 600; color: var(--text-muted);
  text-transform: uppercase; letter-spacing: 0.5px;
  margin: 14px 0 6px 0; padding-bottom: 4px;
  border-bottom: 1px solid var(--border);
}
.sub-label:first-child { margin-top: 0; }
.error-trace {
  background: var(--red-tint);
  border: 1px solid rgba(220,38,38,0.25);
  border-radius: var(--radius-sm);
  padding: 10px 12px; margin-top: 8px;
}
.error-trace .error-msg { color: var(--red); font-weight: 600; font-size: 12px; margin-bottom: 6px; }
.error-trace .stack-toggle { font-size: 11px; color: var(--red); cursor: pointer; user-select: none; text-decoration: underline; }
.error-trace .stack-toggle:hover { color: var(--accent); }
.error-trace .stack-content {
  display: none; margin-top: 6px; padding: 8px;
  background: var(--panel); border: 1px solid var(--border); border-radius: 4px;
  font-family: var(--mono); font-size: 11px; line-height: 1.5;
  color: var(--text-2); white-space: pre-wrap; word-break: break-all;
  max-height: 300px; overflow: auto;
}
.error-trace .stack-content.visible { display: block; }

/* ───────── Empty state ───────── */
.empty-state {
  text-align: center; padding: 60px 20px; color: var(--text-muted);
}
.empty-state .icon {
  width: 44px; height: 44px; border-radius: 12px;
  background: var(--panel); border: 1px solid var(--border);
  margin: 0 auto 12px; display: grid; place-items: center;
  color: var(--text-muted); font-family: var(--mono);
}
.empty-state h3 { margin: 0 0 4px; color: var(--text-2); font-size: 14px; font-weight: 600; }
.empty-state .message { font-size: 12.5px; }

/* ───────── Scrollbars ───────── */
::-webkit-scrollbar { width: 10px; height: 10px; }
::-webkit-scrollbar-thumb {
  background: #d1d5db; border-radius: 10px;
  border: 2px solid transparent; background-clip: padding-box;
}
::-webkit-scrollbar-thumb:hover { background: #9ca3af; background-clip: padding-box; }
::-webkit-scrollbar-track { background: transparent; }

/* ───────── Responsive ───────── */
@media (max-width: 1200px) { :root { --sidebar-w: 200px; --config-w: 360px; } }
@media (max-width: 900px) {
  .workspace, .workspace.no-config { grid-template-columns: 1fr; grid-template-rows: auto auto 1fr; }
  .sidebar { border-right: none; border-bottom: 1px solid var(--border); }
  .config-panel { display: none; }
}
</style>
</head>
<body>
<!-- Top bar -->
<header class="topbar">
  <div class="brand">
    <span class="logo" aria-hidden="true">FB</span>
    <div class="brand-text">
      <div class="brand-title">FlowBuilder Console</div>
      <div class="brand-sub">v2.0 &middot; debugger</div>
    </div>
  </div>
  <div class="status-pill">
    <span class="dot disconnected" id="statusDot"></span>
    <span id="statusText">Connecting&hellip;</span>
    <span class="event-count" id="eventCount">0 events</span>
  </div>
  <div class="actions">
    <button class="btn" id="configToggleBtn" onclick="toggleConfigPanel()">Config</button>
    <button class="btn" onclick="requestState()">Refresh State</button>
    <button class="btn danger" onclick="clearEvents()">Clear</button>
  </div>
</header>

<!-- Three-pane workspace -->
<div class="workspace no-config" id="workspace">
  <!-- Left sidebar -->
  <aside class="sidebar">
    <div class="side-heading">Streams</div>
    <nav class="side-nav">
      <button class="side-item active" data-tab="actions" onclick="switchTab('actions')">
        <span class="ic">A</span><span class="label">Actions</span><span class="badge" id="badge-actions">0</span>
      </button>
      <button class="side-item" data-tab="state" onclick="switchTab('state')">
        <span class="ic">S</span><span class="label">State</span><span class="badge" id="badge-state">0</span>
      </button>
      <button class="side-item" data-tab="search" onclick="switchTab('search')">
        <span class="ic">Q</span><span class="label">Search</span><span class="badge" id="badge-search">0</span>
      </button>
      <button class="side-item" data-tab="nav" onclick="switchTab('nav')">
        <span class="ic">N</span><span class="label">Navigation</span><span class="badge" id="badge-nav">0</span>
      </button>
      <button class="side-item" data-tab="resolvers" onclick="switchTab('resolvers')">
        <span class="ic">R</span><span class="label">Resolvers</span><span class="badge" id="badge-resolvers">0</span>
      </button>
    </nav>
    <div class="side-footer">
      <button class="btn ghost" style="width:100%" onclick="clearEvents()">Clear events</button>
    </div>
  </aside>

  <!-- Center pane -->
  <section class="main">
    <header class="main-head">
      <h1 class="main-title" id="viewTitle">Actions</h1>
    </header>
    <div class="filter-bar" id="filterBar">
      <div class="filter-chip active" data-filter="all" onclick="setFilter('all')">All</div>
      <div class="filter-chip" data-filter="started" onclick="setFilter('started')">In-Progress</div>
      <div class="filter-chip" data-filter="success" onclick="setFilter('success')">Success</div>
      <div class="filter-chip" data-filter="failure" onclick="setFilter('failure')">Failure</div>
      <div class="filter-chip" data-filter="skipped" onclick="setFilter('skipped')">Skipped</div>
    </div>
    <div class="content" id="content"></div>
  </section>

  <!-- Right config panel -->
  <aside class="config-panel" id="configPanel">
    <header class="panel-header">
      <span class="panel-title">Flow config</span>
      <select id="configSelect" onchange="renderConfigPanel()"></select>
    </header>
    <div class="panel-body" id="configBody">
      <div class="empty-state">
        <div class="icon">{ }</div>
        <h3>No config selected</h3>
        <div class="message">Pick a flow above, or click a config-path badge on any event.</div>
      </div>
    </div>
  </aside>
</div>

<script>
// ─── JSON Tree Renderer ──────────────────────────────────────────

let _treeId = 0;

function jsonTree(value, depth, parentIsArray) {
  if (value === null || value === undefined) return '<span class="jt-null">null</span>';
  if (typeof value === 'boolean') return `<span class="jt-bool">${value}</span>`;
  if (typeof value === 'number') return `<span class="jt-num">${value}</span>`;
  if (typeof value === 'string') {
    if (value.length > 120) {
      const id = 'jts' + (_treeId++);
      const short = escHtml(value.substring(0, 100));
      return `<span class="jt-str" id="${id}" title="Click to expand">"${short}..." <span class="jt-toggle" onclick="document.getElementById('${id}').innerHTML=\`&quot;${escHtml(value).replace(/`/g,'\\`')}&quot;\`">+</span></span>`;
    }
    return `<span class="jt-str">"${escHtml(value)}"</span>`;
  }
  if (Array.isArray(value)) {
    if (value.length === 0) return '<span class="jt-bracket">[]</span>';
    const id = 'jt' + (_treeId++);
    const startCollapsed = depth > 1;
    const preview = `${value.length} items`;
    let html = `<span class="jt-toggle" onclick="toggleTree('${id}')">${startCollapsed ? '&#9654;' : '&#9660;'}</span>`;
    html += `<span class="jt-bracket">[</span>`;
    html += `<span class="jt-collapsed-preview" id="${id}-p" style="display:${startCollapsed ? 'inline' : 'none'}"> ${preview} ]</span>`;
    html += `<div class="jt-children ${startCollapsed ? 'collapsed' : ''}" id="${id}" style="padding-left:18px">`;
    value.forEach((item, i) => {
      const comma = i < value.length - 1 ? '<span class="jt-comma">,</span>' : '';
      html += `<div class="jt-row">${jsonTree(item, depth + 1, true)}${comma}</div>`;
    });
    html += `<div class="jt-row"><span class="jt-bracket">]</span></div></div>`;
    return html;
  }
  if (typeof value === 'object') {
    const keys = Object.keys(value);
    if (keys.length === 0) return '<span class="jt-bracket">{}</span>';
    const id = 'jt' + (_treeId++);
    const startCollapsed = depth > 1;
    const preview = keys.length <= 4 ? keys.join(', ') : `${keys.slice(0, 3).join(', ')} +${keys.length - 3}`;
    let html = `<span class="jt-toggle" onclick="toggleTree('${id}')">${startCollapsed ? '&#9654;' : '&#9660;'}</span>`;
    html += `<span class="jt-bracket">{</span>`;
    html += `<span class="jt-collapsed-preview" id="${id}-p" style="display:${startCollapsed ? 'inline' : 'none'}"> ${escHtml(preview)} }</span>`;
    html += `<div class="jt-children ${startCollapsed ? 'collapsed' : ''}" id="${id}" style="padding-left:18px">`;
    keys.forEach((k, i) => {
      const comma = i < keys.length - 1 ? '<span class="jt-comma">,</span>' : '';
      html += `<div class="jt-row"><span class="jt-key">"${escHtml(k)}"</span>: ${jsonTree(value[k], depth + 1, false)}${comma}</div>`;
    });
    html += `<div class="jt-row"><span class="jt-bracket">}</span></div></div>`;
    return html;
  }
  return `<span class="jt-str">${escHtml(String(value))}</span>`;
}

// ─── Config Tree Renderer ────────────────────────────────────────
// Like jsonTree but assigns stable path-based IDs to each node
// so we can highlight specific JSON paths.

let _cfgId = 0;

function cfgTree(value, depth, path) {
  if (value === null || value === undefined) return '<span class="jt-null">null</span>';
  if (typeof value === 'boolean') return `<span class="jt-bool">${value}</span>`;
  if (typeof value === 'number') return `<span class="jt-num">${value}</span>`;
  if (typeof value === 'string') {
    if (value.length > 120) {
      const id = 'cfs' + (_cfgId++);
      const short = escHtml(value.substring(0, 100));
      return `<span class="jt-str" id="${id}">"${short}..." <span class="jt-toggle" onclick="document.getElementById('${id}').innerHTML=\`&quot;${escHtml(value).replace(/`/g,'\\`')}&quot;\`">+</span></span>`;
    }
    return `<span class="jt-str">"${escHtml(value)}"</span>`;
  }
  if (Array.isArray(value)) {
    if (value.length === 0) return '<span class="jt-bracket">[]</span>';
    const id = 'cfg-' + path;
    const startCollapsed = depth > 1;
    const preview = `${value.length} items`;
    let html = `<span class="jt-toggle" onclick="toggleTree('${id}')">${startCollapsed ? '&#9654;' : '&#9660;'}</span>`;
    html += `<span class="jt-bracket">[</span>`;
    html += `<span class="jt-collapsed-preview" id="${id}-p" style="display:${startCollapsed ? 'inline' : 'none'}"> ${preview} ]</span>`;
    html += `<div class="jt-children ${startCollapsed ? 'collapsed' : ''}" id="${id}" style="padding-left:18px">`;
    value.forEach((item, i) => {
      const itemPath = `${path}[${i}]`;
      const comma = i < value.length - 1 ? '<span class="jt-comma">,</span>' : '';
      html += `<div class="jt-row cfg-node" data-cfg-path="${escHtml(itemPath)}" id="cfgnode-${escHtml(itemPath)}">${cfgTree(item, depth + 1, itemPath)}${comma}</div>`;
    });
    html += `<div class="jt-row"><span class="jt-bracket">]</span></div></div>`;
    return html;
  }
  if (typeof value === 'object') {
    const keys = Object.keys(value);
    if (keys.length === 0) return '<span class="jt-bracket">{}</span>';
    const id = 'cfg-' + path;
    const startCollapsed = depth > 1;
    const preview = keys.length <= 4 ? keys.join(', ') : `${keys.slice(0, 3).join(', ')} +${keys.length - 3}`;
    let html = `<span class="jt-toggle" onclick="toggleTree('${id}')">${startCollapsed ? '&#9654;' : '&#9660;'}</span>`;
    html += `<span class="jt-bracket">{</span>`;
    html += `<span class="jt-collapsed-preview" id="${id}-p" style="display:${startCollapsed ? 'inline' : 'none'}"> ${escHtml(preview)} }</span>`;
    html += `<div class="jt-children ${startCollapsed ? 'collapsed' : ''}" id="${id}" style="padding-left:18px">`;
    keys.forEach((k, i) => {
      const keyPath = `${path}.${k}`;
      const comma = i < keys.length - 1 ? '<span class="jt-comma">,</span>' : '';
      html += `<div class="jt-row cfg-node" data-cfg-path="${escHtml(keyPath)}" id="cfgnode-${escHtml(keyPath)}"><span class="jt-key">"${escHtml(k)}"</span>: ${cfgTree(value[k], depth + 1, keyPath)}${comma}</div>`;
    });
    html += `<div class="jt-row"><span class="jt-bracket">}</span></div></div>`;
    return html;
  }
  return `<span class="jt-str">${escHtml(String(value))}</span>`;
}

function toggleTree(id) {
  const el = document.getElementById(id);
  const preview = document.getElementById(id + '-p');
  const toggle = el.previousElementSibling?.previousElementSibling;
  if (!el) return;
  const isCollapsed = el.classList.contains('collapsed');
  el.classList.toggle('collapsed');
  if (preview) preview.style.display = isCollapsed ? 'none' : 'inline';
  if (toggle && toggle.classList.contains('jt-toggle')) {
    toggle.innerHTML = isCollapsed ? '&#9660;' : '&#9654;';
  }
}

// ─── App State ───────────────────────────────────────────────────

const state = {
  events: [],
  crudStates: {},
  searchStates: {},
  flowConfigs: {},
  activeTab: 'actions',
  filter: 'all',
  configPanelOpen: false,
  selectedConfig: '',
};

const TAB_TITLES = {
  actions: 'Actions',
  state: 'State',
  search: 'Search',
  nav: 'Navigation',
  resolvers: 'Resolvers',
};

let ws = null;
let reconnectTimer = null;

function connect() {
  const proto = location.protocol === 'https:' ? 'wss:' : 'ws:';
  ws = new WebSocket(`${proto}//${location.host}/ws`);

  ws.onopen = () => {
    document.getElementById('statusDot').className = 'dot connected';
    document.getElementById('statusText').textContent = 'Connected';
    clearTimeout(reconnectTimer);
    ws.send(JSON.stringify({type: 'requestEvents'}));
    ws.send(JSON.stringify({type: 'requestState'}));
  };

  ws.onclose = () => {
    document.getElementById('statusDot').className = 'dot disconnected';
    document.getElementById('statusText').textContent = 'Disconnected';
    reconnectTimer = setTimeout(connect, 2000);
  };

  ws.onerror = () => ws.close();

  ws.onmessage = (e) => {
    const msg = JSON.parse(e.data);
    switch (msg.type) {
      case 'event':
        state.events.push(msg.data);
        renderIfRelevant(msg.data);
        // Auto-highlight config path for new events
        if (state.configPanelOpen && msg.data.configPath && msg.data.screenKey) {
          const isStarted = msg.data.status === 'started';
          highlightConfigPath(msg.data.screenKey, msg.data.configPath, isStarted);
        }
        break;
      case 'eventBatch':
        state.events = msg.data;
        render();
        break;
      case 'stateSnapshot':
        state.crudStates = msg.data.crudStates || {};
        state.searchStates = msg.data.searchStates || {};
        if (msg.data.flowConfigs) {
          const hadConfigs = Object.keys(state.flowConfigs).length > 0;
          state.flowConfigs = msg.data.flowConfigs;
          if (!hadConfigs) updateConfigSelect();
        }
        if (state.activeTab === 'state' || state.activeTab === 'search') render();
        updateBadges();
        break;
      case 'flowConfigs':
        state.flowConfigs = msg.data || {};
        updateConfigSelect();
        break;
      case 'eventsCleared':
        state.events = [];
        render();
        break;
    }
    updateBadges();
  };
}

function switchTab(tab) {
  state.activeTab = tab;
  document.querySelectorAll('.side-item').forEach(t => t.classList.toggle('active', t.dataset.tab === tab));
  document.getElementById('viewTitle').textContent = TAB_TITLES[tab] || tab;
  document.getElementById('filterBar').style.display = (tab === 'actions' || tab === 'nav' || tab === 'resolvers') ? 'flex' : 'none';
  render();
}

function setFilter(f) {
  state.filter = f;
  document.querySelectorAll('.filter-chip').forEach(c => c.classList.toggle('active', c.dataset.filter === f));
  render();
}

function clearEvents() {
  if (ws && ws.readyState === WebSocket.OPEN) {
    ws.send(JSON.stringify({type: 'clearEvents'}));
  }
}

function requestState() {
  if (ws && ws.readyState === WebSocket.OPEN) {
    ws.send(JSON.stringify({type: 'requestState'}));
  }
}

function toggleConfigPanel() {
  state.configPanelOpen = !state.configPanelOpen;
  document.getElementById('workspace').classList.toggle('no-config', !state.configPanelOpen);
  document.getElementById('configToggleBtn').classList.toggle('active', state.configPanelOpen);
  if (state.configPanelOpen) {
    updateConfigSelect();
    renderConfigPanel();
  }
}

function updateConfigSelect() {
  const select = document.getElementById('configSelect');
  const prev = select.value;
  const keys = Object.keys(state.flowConfigs);
  select.innerHTML = keys.map(k => `<option value="${escHtml(k)}"${k === prev ? ' selected' : ''}>${escHtml(k)}</option>`).join('');
  if (!prev && keys.length > 0) {
    state.selectedConfig = keys[0];
  } else {
    state.selectedConfig = prev;
  }
  if (state.configPanelOpen) renderConfigPanel();
}

function renderConfigPanel() {
  const select = document.getElementById('configSelect');
  state.selectedConfig = select.value;
  const body = document.getElementById('configBody');
  const config = state.flowConfigs[state.selectedConfig];
  if (!config) {
    body.innerHTML = '<div class="empty-state"><div class="icon">{ }</div><h3>No config selected</h3><div class="message">Pick a flow above, or click a config-path badge on any event.</div></div>';
    return;
  }
  _cfgId = 0;
  body.innerHTML = `<div class="json-tree">${cfgTree(config, 0, 'root')}</div>`;
}

// ─── Config Highlighting ─────────────────────────────────────────
// Given a screenKey and configPath like "initActions[2]", highlight
// that node in the config panel and scroll to it.

let _highlightTimer = null;

// Track the currently executing (started) action's config path
let _activeConfigPath = null;

function highlightConfigPath(screenKey, configPath, isStarted) {
  // Switch to the right config if needed
  if (screenKey && screenKey !== state.selectedConfig) {
    const select = document.getElementById('configSelect');
    if (state.flowConfigs[screenKey]) {
      select.value = screenKey;
      renderConfigPanel();
    }
  }

  // Clear previous highlight
  document.querySelectorAll('.cfg-node.highlighted').forEach(el => el.classList.remove('highlighted'));
  document.querySelectorAll('.cfg-node.active-exec').forEach(el => el.classList.remove('active-exec'));
  clearTimeout(_highlightTimer);

  // Build the element ID. configPath like "initActions[2]" → "cfgnode-root.initActions[2]"
  const nodeId = 'cfgnode-root.' + configPath;
  const node = document.getElementById(nodeId);
  if (!node) return;

  // Expand all ancestor collapsed nodes to make it visible
  let parent = node.parentElement;
  while (parent) {
    if (parent.classList && parent.classList.contains('jt-children') && parent.classList.contains('collapsed')) {
      parent.classList.remove('collapsed');
      const preview = document.getElementById(parent.id + '-p');
      if (preview) preview.style.display = 'none';
      const bracket = parent.previousElementSibling;
      const toggle = bracket && bracket.previousElementSibling;
      if (toggle && toggle.classList.contains('jt-toggle')) toggle.innerHTML = '▼';
    }
    parent = parent.parentElement;
  }

  if (isStarted) {
    // Use blinking active-exec class for in-progress actions
    node.classList.add('active-exec');
    _activeConfigPath = configPath;
    node.scrollIntoView({ behavior: 'smooth', block: 'center' });
    // No timeout — stays until completion event clears it
  } else {
    // Static highlight for completed actions
    node.classList.add('highlighted');
    node.scrollIntoView({ behavior: 'smooth', block: 'center' });
    _activeConfigPath = null;
    // Remove highlight after 5 seconds
    _highlightTimer = setTimeout(() => {
      node.classList.remove('highlighted');
    }, 5000);
  }
}

// Click handler: click a config-path-badge on an event card to highlight in config
function onConfigPathClick(ev, screenKey, configPath) {
  ev.stopPropagation();
  if (!state.configPanelOpen) toggleConfigPanel();
  setTimeout(() => highlightConfigPath(screenKey, configPath, false), 100);
}

function updateBadges() {
  const counts = { actions: 0, state: 0, search: 0, nav: 0, resolvers: 0 };
  state.events.forEach(e => {
    if (e.type === 'action') counts.actions++;
    else if (e.type === 'condition') counts.actions++;
    else if (e.type === 'stateChange') counts.state++;
    else if (e.type === 'navigation') counts.nav++;
    else if (e.type === 'resolver') counts.resolvers++;
  });
  counts.search = Object.keys(state.searchStates).length;
  document.getElementById('badge-actions').textContent = counts.actions;
  document.getElementById('badge-state').textContent = counts.state || Object.keys(state.crudStates).length;
  document.getElementById('badge-search').textContent = counts.search;
  document.getElementById('badge-nav').textContent = counts.nav;
  document.getElementById('badge-resolvers').textContent = counts.resolvers;
  document.getElementById('eventCount').textContent = `${state.events.length} events`;
}

function renderIfRelevant(event) {
  const tabMap = { action: 'actions', condition: 'actions', stateChange: 'state', navigation: 'nav', resolver: 'resolvers' };
  if (tabMap[event.type] === state.activeTab) render();
  updateBadges();
}

// ─── Expansion State Persistence ─────────────────────────────────

function saveExpansionState() {
  const s = { cards: new Set(), trees: new Set(), collapsedSections: new Set(), stacks: new Set(), ctxBodies: new Set() };
  document.querySelectorAll('#content .event-card').forEach((el, i) => {
    if (el.classList.contains('expanded')) s.cards.add(i);
  });
  document.querySelectorAll('#content .jt-children').forEach(el => {
    if (el.id && !el.classList.contains('collapsed')) s.trees.add(el.id);
  });
  document.querySelectorAll('#content .state-section').forEach((el, i) => {
    if (!el.classList.contains('expanded')) s.collapsedSections.add(i);
  });
  document.querySelectorAll('#content .stack-content').forEach(el => {
    if (el.id && el.classList.contains('visible')) s.stacks.add(el.id);
  });
  document.querySelectorAll('#content .ctx-body').forEach(el => {
    if (el.id && el.classList.contains('visible')) s.ctxBodies.add(el.id);
  });
  return s;
}

function restoreExpansionState(saved) {
  if (!saved) return;
  document.querySelectorAll('#content .event-card').forEach((el, i) => {
    if (saved.cards.has(i)) el.classList.add('expanded');
  });
  saved.trees.forEach(id => {
    const el = document.getElementById(id);
    if (el && el.classList.contains('collapsed')) {
      el.classList.remove('collapsed');
      const preview = document.getElementById(id + '-p');
      if (preview) preview.style.display = 'none';
      const bracket = el.previousElementSibling;
      const toggle = bracket && bracket.previousElementSibling;
      if (toggle && toggle.classList.contains('jt-toggle')) toggle.innerHTML = '▼';
    }
  });
  saved.collapsedSections.forEach(i => {
    const sections = document.querySelectorAll('#content .state-section');
    if (sections[i]) sections[i].classList.remove('expanded');
  });
  saved.stacks.forEach(id => {
    const el = document.getElementById(id);
    if (el) el.classList.add('visible');
  });
  saved.ctxBodies.forEach(id => {
    const el = document.getElementById(id);
    if (el) el.classList.add('visible');
  });
}

function render() {
  const saved = saveExpansionState();
  const hadExpanded = saved.cards.size > 0 || saved.stacks.size > 0 || saved.ctxBodies.size > 0;
  _treeId = 0; _stackId = 0; _ctxId = 0;
  const el = document.getElementById('content');
  switch (state.activeTab) {
    case 'actions': el.innerHTML = renderActions(); break;
    case 'state': el.innerHTML = renderCrudState(); break;
    case 'search': el.innerHTML = renderSearchState(); break;
    case 'nav': el.innerHTML = renderNavEvents(); break;
    case 'resolvers': el.innerHTML = renderResolvers(); break;
  }
  restoreExpansionState(saved);
  if (!hadExpanded) el.scrollTop = el.scrollHeight;
}

// ─── Helpers ─────────────────────────────────────────────────────

function statusIcon(s) {
  if (s === 'success') return '<span class="status-icon success">&#10003;</span>';
  if (s === 'failure') return '<span class="status-icon failure">&#10007;</span>';
  if (s === 'started') return '<span class="status-icon started">&#9654;</span>';
  return '<span class="status-icon skipped">&#8212;</span>';
}

function formatTime(ts) {
  const d = new Date(ts);
  return d.toLocaleTimeString('en-US', { hour12: false, hour: '2-digit', minute: '2-digit', second: '2-digit', fractionalSecondDigits: 3 });
}

function escHtml(s) {
  const d = document.createElement('div');
  d.textContent = String(s ?? '');
  return d.innerHTML;
}

let _stackId = 0;
function renderErrorTrace(event) {
  if (!event.error && !event.errorTrace) return '';
  const id = 'stack' + (_stackId++);
  const hasTrace = !!event.errorTrace;
  return `
    <div class="error-trace">
      <div class="error-msg">${escHtml(event.error || event.errorMessage || 'Unknown error')}</div>
      ${hasTrace ? `<span class="stack-toggle" onclick="event.stopPropagation();document.getElementById('${id}').classList.toggle('visible')">Show stack trace</span>
      <div class="stack-content" id="${id}">${escHtml(event.errorTrace)}</div>` : ''}
    </div>`;
}

function errorClass(event) {
  return (event.error || event.errorTrace) ? ' has-error' : '';
}

function configPathBadge(event) {
  if (!event.configPath) return '';
  return `<span class="config-path-badge" onclick="onConfigPathClick(event, '${escHtml(event.screenKey || '')}', '${escHtml(event.configPath)}')" title="Show in config">${escHtml(event.configPath)}</span>`;
}

let _ctxId = 0;
function renderContextSnapshot(event) {
  if (!event.contextData || Object.keys(event.contextData).length === 0) return '';
  const id = 'ctx' + (_ctxId++);
  const keyCount = Object.keys(event.contextData).length;
  const label = event.status === 'started' ? 'Input Context' : 'Output Context';
  return `
    <div class="context-snapshot">
      <div class="ctx-header" onclick="event.stopPropagation();document.getElementById('${id}').classList.toggle('visible')">${label} (${keyCount} keys) &#9660;</div>
      <div class="ctx-body" id="${id}"><div class="json-tree">${jsonTree(event.contextData, 0, false)}</div></div>
    </div>`;
}

function emptyState(icon, title, msg) {
  return `<div class="empty-state"><div class="icon">${icon}</div><h3>${escHtml(title)}</h3><div class="message">${escHtml(msg)}</div></div>`;
}

// ─── Tab Renderers ───────────────────────────────────────────────

function renderActions() {
  const events = state.events.filter(e => e.type === 'action' || e.type === 'condition');
  const filtered = state.filter === 'all' ? events : events.filter(e => e.status === state.filter);
  if (!filtered.length) return emptyState('&#9881;', 'No action events yet', 'Actions & conditions will stream in as the app runs.');
  _stackId = 0;
  _ctxId = 0;
  return filtered.map(e => {
    const startedClass = e.status === 'started' ? ' started' : '';
    return `
    <div class="event-card ${e.type}${errorClass(e)}${startedClass}" onclick="this.classList.toggle('expanded')">
      <div class="header-row">
        <span class="type-badge ${e.type}">${e.type}${e.status === 'started' ? ' &#9654;' : ''}</span>
        <span class="summary">${escHtml(e.summary)}</span>
        ${configPathBadge(e)}
        ${statusIcon(e.status)}
        ${e.durationMs != null ? `<span class="time">${e.durationMs}ms</span>` : ''}
        <span class="time">${formatTime(e.timestamp)}</span>
      </div>
      ${renderContextSnapshot(e)}
      ${renderErrorTrace(e)}
      <div class="details"><div class="json-tree">${jsonTree(e, 0, false)}</div></div>
    </div>`;
  }).join('');
}

function renderNavEvents() {
  const events = state.events.filter(e => e.type === 'navigation');
  const filtered = state.filter === 'all' ? events : events.filter(e => e.status === state.filter);
  if (!filtered.length) return emptyState('&#9654;', 'No navigation events yet', 'Route pushes/pops will appear here.');
  _stackId = 0;
  return filtered.map(e => `
    <div class="event-card navigation${errorClass(e)}" onclick="this.classList.toggle('expanded')">
      <div class="header-row">
        <span class="type-badge navigation">nav</span>
        <span class="summary">${escHtml(e.summary)}</span>
        <span class="time">${formatTime(e.timestamp)}</span>
      </div>
      ${renderErrorTrace(e)}
      <div class="details"><div class="json-tree">${jsonTree(e, 0, false)}</div></div>
    </div>
  `).join('');
}

function renderCrudState() {
  const keys = Object.keys(state.crudStates);
  if (!keys.length) {
    const stateEvents = state.events.filter(e => e.type === 'stateChange');
    if (!stateEvents.length) return emptyState('&#128202;', 'No state data yet', 'CrudState registries + stateChange events will show here.');
    return stateEvents.map(e => `
      <div class="event-card stateChange" onclick="this.classList.toggle('expanded')">
        <div class="header-row">
          <span class="type-badge stateChange">state</span>
          <span class="summary">${escHtml(e.summary)}</span>
          <span class="time">${formatTime(e.timestamp)}</span>
        </div>
        <div class="details"><div class="json-tree">${jsonTree(e, 0, false)}</div></div>
      </div>
    `).join('');
  }
  return keys.map(k => {
    const s = state.crudStates[k];
    const wrapperLen = s.stateWrapperLength ?? (s.stateWrapper ? s.stateWrapper.length : 0);
    return `
    <div class="state-section expanded">
      <div class="section-header" onclick="this.parentElement.classList.toggle('expanded')">
        <span class="arrow">&#9654;</span>
        <span style="color:var(--accent-2)">${escHtml(k)}</span>
        ${s.isLoading ? '<span style="color:var(--orange);font-size:10px">loading&hellip;</span>' : ''}
        <span style="color:var(--text-muted);font-size:10px;margin-left:auto">wrapper: ${wrapperLen}</span>
      </div>
      <div class="section-body">
        <div class="sub-label">stateWrapper (${wrapperLen} items)</div>
        <div class="json-tree">${jsonTree(s.stateWrapper, 0, false)}</div>
        <div class="sub-label">formData</div>
        <div class="json-tree">${jsonTree(s.formData, 0, false)}</div>
        <div class="sub-label">widgetData</div>
        <div class="json-tree">${jsonTree(s.widgetData, 0, false)}</div>
      </div>
    </div>`;
  }).join('');
}

function renderSearchState() {
  const keys = Object.keys(state.searchStates);
  if (!keys.length) return emptyState('&#128269;', 'No search state yet', 'Filters, orderBy, and pagination windows will appear here.');
  return keys.map(k => {
    const s = state.searchStates[k];
    return `
    <div class="state-section expanded">
      <div class="section-header" onclick="this.parentElement.classList.toggle('expanded')">
        <span class="arrow">&#9654;</span>
        <span style="color:var(--cyan)">${escHtml(k)}</span>
      </div>
      <div class="section-body">
        <div class="json-tree">${jsonTree(s, 0, false)}</div>
      </div>
    </div>`;
  }).join('');
}

function renderResolvers() {
  const events = state.events.filter(e => e.type === 'resolver');
  const filtered = state.filter === 'all' ? events : events.filter(e => e.status === state.filter);
  if (!filtered.length) return emptyState('&#128270;', 'No resolver events yet', 'Template resolutions (navigation.*, item.*, formData.*) will show here.');
  _stackId = 0;
  _ctxId = 0;
  return filtered.map(e => {
    const isNull = e.resolvedValue === 'null';
    const hasError = e.error || e.errorTrace;
    return `
    <div class="event-card resolver${errorClass(e)}" onclick="this.classList.toggle('expanded')">
      <div class="header-row">
        <span class="type-badge resolver">${escHtml(e.matchedPrefix || 'resolve')}</span>
        <span class="summary" style="font-family:var(--mono);font-size:12px">
          <span style="color:var(--cyan)">${escHtml(e.input)}</span>
          <span style="color:var(--text-muted)"> &rarr; </span>
          <span style="color:${hasError ? 'var(--red)' : isNull ? 'var(--red)' : 'var(--green)'}">${hasError ? 'ERROR' : escHtml(e.resolvedValue)}</span>
          ${!hasError ? `<span style="color:var(--text-muted);font-size:10px"> (${escHtml(e.resolvedType)})</span>` : ''}
        </span>
        <span class="time">${formatTime(e.timestamp)}</span>
      </div>
      ${renderContextSnapshot(e)}
      ${renderErrorTrace(e)}
      <div class="details"><div class="json-tree">${jsonTree(e, 0, false)}</div></div>
    </div>`;
  }).join('');
}

connect();
</script>
</body>
</html>
''';
