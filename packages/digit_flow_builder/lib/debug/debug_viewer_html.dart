const String debugViewerHtml = r'''
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Flow Debugger</title>
<style>
:root {
  --bg: #0d1117;
  --surface: #161b22;
  --surface2: #21262d;
  --border: #30363d;
  --text: #c9d1d9;
  --text-muted: #8b949e;
  --accent: #58a6ff;
  --green: #3fb950;
  --orange: #d29922;
  --red: #f85149;
  --purple: #bc8cff;
  --pink: #f778ba;
  --cyan: #39d2c0;
  --str-color: #a5d6ff;
  --num-color: #79c0ff;
  --bool-color: #ff7b72;
  --null-color: #8b949e;
  --key-color: #d2a8ff;
  --highlight: rgba(88,166,255,0.15);
  --highlight-border: var(--accent);
}
* { margin: 0; padding: 0; box-sizing: border-box; }
body { font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Helvetica, Arial, sans-serif; background: var(--bg); color: var(--text); height: 100vh; overflow: hidden; }
.app { display: flex; flex-direction: column; height: 100vh; }
.header { background: var(--surface); border-bottom: 1px solid var(--border); display: flex; align-items: center; padding: 0 16px; height: 48px; gap: 12px; flex-shrink: 0; }
.header h1 { font-size: 14px; font-weight: 600; color: var(--purple); white-space: nowrap; }
.header .status { font-size: 11px; display: flex; align-items: center; gap: 6px; }
.header .status .dot { width: 8px; height: 8px; border-radius: 50%; }
.header .status .dot.connected { background: var(--green); }
.header .status .dot.disconnected { background: var(--red); }
.header .actions { margin-left: auto; display: flex; gap: 8px; }
.btn { padding: 4px 12px; border-radius: 6px; border: 1px solid var(--border); background: var(--surface2); color: var(--text); font-size: 12px; cursor: pointer; transition: all 0.15s; }
.btn:hover { border-color: var(--accent); color: var(--accent); }
.btn.danger:hover { border-color: var(--red); color: var(--red); }
.btn.active { border-color: var(--accent); color: var(--accent); background: rgba(88,166,255,0.1); }
.event-count { font-size: 11px; color: var(--text-muted); margin-left: auto; }
.tab-bar { display: flex; border-bottom: 1px solid var(--border); background: var(--surface); flex-shrink: 0; }
.tab { padding: 10px 18px; font-size: 12px; font-weight: 500; color: var(--text-muted); cursor: pointer; border-bottom: 2px solid transparent; transition: all 0.15s; }
.tab:hover { color: var(--text); }
.tab.active { color: var(--accent); border-bottom-color: var(--accent); }
.tab .badge { display: inline-block; background: var(--surface2); color: var(--text-muted); font-size: 10px; padding: 1px 6px; border-radius: 10px; margin-left: 6px; }

/* Split panel layout */
.main-area { flex: 1; display: flex; overflow: hidden; }
.events-panel { flex: 1; display: flex; flex-direction: column; overflow: hidden; min-width: 0; }
.config-panel { width: 0; border-left: 1px solid var(--border); display: flex; flex-direction: column; overflow: hidden; transition: width 0.2s ease; }
.config-panel.open { width: 45%; }
.config-panel .panel-header { padding: 8px 12px; background: var(--surface); border-bottom: 1px solid var(--border); display: flex; align-items: center; gap: 8px; flex-shrink: 0; }
.config-panel .panel-header .panel-title { font-size: 12px; font-weight: 600; color: var(--orange); }
.config-panel .panel-header select { background: var(--surface2); color: var(--text); border: 1px solid var(--border); border-radius: 4px; padding: 2px 6px; font-size: 11px; flex: 1; }
.config-panel .panel-body { flex: 1; overflow: auto; padding: 12px; }
.config-panel .panel-body::-webkit-scrollbar { width: 8px; }
.config-panel .panel-body::-webkit-scrollbar-track { background: var(--bg); }
.config-panel .panel-body::-webkit-scrollbar-thumb { background: var(--surface2); border-radius: 4px; }

.content { flex: 1; overflow: auto; padding: 12px; }
.content::-webkit-scrollbar { width: 8px; }
.content::-webkit-scrollbar-track { background: var(--bg); }
.content::-webkit-scrollbar-thumb { background: var(--surface2); border-radius: 4px; }

/* Event cards */
.event-card { background: var(--surface); border: 1px solid var(--border); border-radius: 8px; padding: 10px 14px; margin-bottom: 8px; cursor: pointer; transition: border-color 0.15s; }
.event-card:hover { border-color: var(--accent); }
.event-card.action { border-left: 3px solid var(--purple); }
.event-card.condition { border-left: 3px solid var(--cyan); }
.event-card.stateChange { border-left: 3px solid var(--orange); }
.event-card.navigation { border-left: 3px solid var(--pink); }
.event-card.resolver { border-left: 3px solid var(--green); }
.event-card .header-row { display: flex; align-items: center; gap: 8px; flex-wrap: wrap; }
.event-card .type-badge { font-size: 9px; font-weight: 700; text-transform: uppercase; padding: 2px 6px; border-radius: 4px; }
.event-card .type-badge.action { background: rgba(188,140,255,0.15); color: var(--purple); }
.event-card .type-badge.condition { background: rgba(57,210,192,0.15); color: var(--cyan); }
.event-card .type-badge.stateChange { background: rgba(210,153,34,0.15); color: var(--orange); }
.event-card .type-badge.navigation { background: rgba(247,120,186,0.15); color: var(--pink); }
.event-card .type-badge.resolver { background: rgba(63,185,80,0.15); color: var(--green); }
.event-card .summary { font-size: 13px; font-weight: 500; flex: 1; }
.event-card .status-icon { font-size: 12px; }
.event-card .status-icon.success { color: var(--green); }
.event-card .status-icon.failure { color: var(--red); }
.event-card .status-icon.skipped { color: var(--text-muted); }
.event-card .status-icon.started { color: var(--orange); animation: blink 1s infinite; }
.event-card.started { border-color: var(--orange); background: rgba(210,153,34,0.05); }

/* Context data snapshot */
.context-snapshot { margin-top: 8px; padding: 8px 10px; background: rgba(88,166,255,0.05); border: 1px solid rgba(88,166,255,0.15); border-radius: 6px; }
.context-snapshot .ctx-header { font-size: 11px; font-weight: 600; color: var(--accent); margin-bottom: 4px; cursor: pointer; user-select: none; }
.context-snapshot .ctx-header:hover { color: var(--text); }
.context-snapshot .ctx-body { display: none; max-height: 250px; overflow: auto; }
.context-snapshot .ctx-body.visible { display: block; }
.event-card .time { font-size: 10px; color: var(--text-muted); }
.event-card .config-path-badge { font-size: 9px; padding: 1px 6px; border-radius: 4px; background: rgba(210,153,34,0.15); color: var(--orange); font-family: 'SF Mono','Fira Code',monospace; cursor: pointer; }
.event-card .config-path-badge:hover { background: rgba(210,153,34,0.3); }
.event-card .details { margin-top: 8px; padding-top: 8px; border-top: 1px solid var(--border); display: none; }
.event-card.expanded .details { display: block; }

/* State sections */
.state-section { background: var(--surface); border: 1px solid var(--border); border-radius: 8px; margin-bottom: 12px; overflow: hidden; }
.state-section .section-header { padding: 10px 14px; background: var(--surface2); font-size: 12px; font-weight: 600; display: flex; align-items: center; gap: 8px; cursor: pointer; user-select: none; }
.state-section .section-header .arrow { transition: transform 0.15s; display: inline-block; font-size: 10px; color: var(--text-muted); }
.state-section.expanded .section-header .arrow { transform: rotate(90deg); }
.state-section .section-body { padding: 12px 14px; display: none; }
.state-section.expanded .section-body { display: block; }

/* JSON tree */
.json-tree { font-family: 'SF Mono','Fira Code','Cascadia Code',monospace; font-size: 12px; line-height: 1.6; }
.json-tree .jt-row { padding-left: 0; }
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

/* Config tree highlighting */
.cfg-node { position: relative; }
.cfg-node.highlighted { background: var(--highlight); border-left: 2px solid var(--highlight-border); margin-left: -2px; }
.cfg-node.highlighted > .jt-row:first-child::before { content: '\25B6'; color: var(--accent); font-size: 10px; margin-right: 4px; }
.cfg-node.active-exec { background: rgba(210,153,34,0.15); border-left: 2px solid var(--orange); margin-left: -2px; animation: exec-pulse 1.5s infinite; }
.cfg-node.active-exec > .jt-row:first-child::before { content: '\25B6'; color: var(--orange); font-size: 10px; margin-right: 4px; animation: blink 1s infinite; }
@keyframes exec-pulse { 0%, 100% { background: rgba(210,153,34,0.15); } 50% { background: rgba(210,153,34,0.05); } }
.cfg-pointer { display: inline-block; color: var(--accent); font-size: 10px; margin-right: 4px; animation: blink 1s infinite; }
@keyframes blink { 0%, 100% { opacity: 1; } 50% { opacity: 0.3; } }

/* Subsection labels */
.sub-label { font-size: 11px; font-weight: 600; color: var(--text-muted); text-transform: uppercase; letter-spacing: 0.5px; margin: 12px 0 6px 0; padding-bottom: 4px; border-bottom: 1px solid var(--border); }
.sub-label:first-child { margin-top: 0; }

/* Error trace */
.error-trace { background: rgba(248,81,73,0.1); border: 1px solid rgba(248,81,73,0.3); border-radius: 6px; padding: 10px 12px; margin-top: 8px; }
.error-trace .error-msg { color: var(--red); font-weight: 600; font-size: 12px; margin-bottom: 6px; }
.error-trace .stack-toggle { font-size: 11px; color: var(--text-muted); cursor: pointer; user-select: none; }
.error-trace .stack-toggle:hover { color: var(--accent); }
.error-trace .stack-content { display: none; margin-top: 6px; padding: 8px; background: rgba(0,0,0,0.3); border-radius: 4px; font-family: 'SF Mono','Fira Code','Cascadia Code',monospace; font-size: 11px; line-height: 1.5; color: var(--text-muted); white-space: pre-wrap; word-break: break-all; max-height: 300px; overflow: auto; }
.error-trace .stack-content.visible { display: block; }
.event-card.has-error { border-color: var(--red); background: rgba(248,81,73,0.05); }

.empty-state { text-align: center; padding: 60px 20px; color: var(--text-muted); }
.empty-state .icon { font-size: 48px; margin-bottom: 12px; opacity: 0.4; }
.empty-state .message { font-size: 14px; }
.filter-bar { display: flex; gap: 6px; padding: 8px 12px; background: var(--surface); border-bottom: 1px solid var(--border); flex-shrink: 0; }
.filter-chip { font-size: 11px; padding: 3px 10px; border-radius: 12px; border: 1px solid var(--border); background: transparent; color: var(--text-muted); cursor: pointer; transition: all 0.15s; }
.filter-chip:hover, .filter-chip.active { border-color: var(--accent); color: var(--accent); background: rgba(88,166,255,0.1); }
</style>
</head>
<body>
<div class="app">
  <div class="header">
    <h1>Flow Debugger</h1>
    <div class="status">
      <div class="dot disconnected" id="statusDot"></div>
      <span id="statusText" style="color:var(--text-muted);font-size:11px">Connecting...</span>
    </div>
    <span class="event-count" id="eventCount">0 events</span>
    <div class="actions">
      <button class="btn" id="configToggleBtn" onclick="toggleConfigPanel()">Config</button>
      <button class="btn" onclick="requestState()">Refresh State</button>
      <button class="btn danger" onclick="clearEvents()">Clear</button>
    </div>
  </div>
  <div class="tab-bar">
    <div class="tab active" data-tab="actions" onclick="switchTab('actions')">Actions <span class="badge" id="badge-actions">0</span></div>
    <div class="tab" data-tab="state" onclick="switchTab('state')">State <span class="badge" id="badge-state">0</span></div>
    <div class="tab" data-tab="search" onclick="switchTab('search')">Search <span class="badge" id="badge-search">0</span></div>
    <div class="tab" data-tab="nav" onclick="switchTab('nav')">Nav <span class="badge" id="badge-nav">0</span></div>
    <div class="tab" data-tab="resolvers" onclick="switchTab('resolvers')">Resolvers <span class="badge" id="badge-resolvers">0</span></div>
  </div>
  <div class="main-area">
    <div class="events-panel">
      <div class="filter-bar" id="filterBar">
        <div class="filter-chip active" data-filter="all" onclick="setFilter('all')">All</div>
        <div class="filter-chip" data-filter="started" onclick="setFilter('started')">In-Progress</div>
        <div class="filter-chip" data-filter="success" onclick="setFilter('success')">Success</div>
        <div class="filter-chip" data-filter="failure" onclick="setFilter('failure')">Failure</div>
        <div class="filter-chip" data-filter="skipped" onclick="setFilter('skipped')">Skipped</div>
      </div>
      <div class="content" id="content"></div>
    </div>
    <div class="config-panel" id="configPanel">
      <div class="panel-header">
        <span class="panel-title">Flow Config</span>
        <select id="configSelect" onchange="renderConfigPanel()"></select>
      </div>
      <div class="panel-body" id="configBody">
        <div class="empty-state"><div class="message">Select a flow config</div></div>
      </div>
    </div>
  </div>
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
  document.querySelectorAll('.tab').forEach(t => t.classList.toggle('active', t.dataset.tab === tab));
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
  document.getElementById('configPanel').classList.toggle('open', state.configPanelOpen);
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
    body.innerHTML = '<div class="empty-state"><div class="message">No config selected</div></div>';
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
      if (toggle && toggle.classList.contains('jt-toggle')) toggle.innerHTML = '\u25BC';
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
      if (toggle && toggle.classList.contains('jt-toggle')) toggle.innerHTML = '\u25BC';
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

// ─── Tab Renderers ───────────────────────────────────────────────

function renderActions() {
  const events = state.events.filter(e => e.type === 'action' || e.type === 'condition');
  const filtered = state.filter === 'all' ? events : events.filter(e => e.status === state.filter);
  if (!filtered.length) return '<div class="empty-state"><div class="icon">&#9881;</div><div class="message">No action events yet</div></div>';
  _stackId = 0;
  _ctxId = 0;
  return filtered.map(e => {
    const startedClass = e.status === 'started' ? ' started' : '';
    return `
    <div class="event-card ${e.type}${errorClass(e)}${startedClass}" onclick="this.classList.toggle('expanded')">
      <div class="header-row">
        <span class="type-badge ${e.type}">${e.type}${e.status === 'started' ? ' ▶' : ''}</span>
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
  if (!filtered.length) return '<div class="empty-state"><div class="icon">&#9654;</div><div class="message">No navigation events yet</div></div>';
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
    if (!stateEvents.length) return '<div class="empty-state"><div class="icon">&#128202;</div><div class="message">No state data yet</div></div>';
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
        <span style="color:var(--accent)">${escHtml(k)}</span>
        ${s.isLoading ? '<span style="color:var(--orange);font-size:10px">loading...</span>' : ''}
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
  if (!keys.length) return '<div class="empty-state"><div class="icon">&#128269;</div><div class="message">No search state yet</div></div>';
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
  if (!filtered.length) return '<div class="empty-state"><div class="icon">&#128270;</div><div class="message">No resolver events yet</div></div>';
  _stackId = 0;
  _ctxId = 0;
  return filtered.map(e => {
    const isNull = e.resolvedValue === 'null';
    const hasError = e.error || e.errorTrace;
    return `
    <div class="event-card resolver${errorClass(e)}" onclick="this.classList.toggle('expanded')">
      <div class="header-row">
        <span class="type-badge resolver">${escHtml(e.matchedPrefix || 'resolve')}</span>
        <span class="summary" style="font-family:'SF Mono','Fira Code',monospace;font-size:12px">
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
