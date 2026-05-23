# 🏠 Home Assistant

A lightweight, privacy-first home inventory chatbot. Ask it where anything is — it searches your inventory and tells you exactly where to look.

No backend. No account. No AI. Just a single HTML file + a JSON inventory that lives in your browser.

---

## Features

- 🔍 **Fuzzy search** — finds items even with typos
- 💬 **Chat interface** — natural language queries
- 📋 **Inventory panel** — browse, filter, and delete items
- ➕ **Add & remove** items directly from the chat
- ☁️ **Optional Gist sync** — cross-device sync via a free GitHub Gist
- ⬇ **Export / ⬆ Import** — backup or migrate your inventory as JSON
- 📱 **Mobile-friendly** — works in any browser

---

## Getting Started

### Run locally

No install needed. Just open `index.html` in any browser.

```bash
git clone https://github.com/yourusername/home-assistant.git
cd home-assistant
open index.html        # macOS
# or double-click index.html on Windows/Linux
```

Your inventory is stored in `localStorage` and seeded once from `inventory.json` on first load.

---

### Add your items

Edit `inventory.json` directly, or use the chat:

| Action | Example |
|---|---|
| Find something | `where are the bandaids?` |
| Add an item | `add: item name → location` |
| Update location | `add: item name → new location` |
| Remove an item | `delete: item name` |
| List everything | `list` |

---

## Deploy to GitHub Pages (free)

```bash
git init
git add .
git commit -m "init"
gh repo create home-assistant --public --push --source=.
# Repo Settings → Pages → Branch: main → / (root) → Save
```

Live at: `https://yourusername.github.io/home-assistant`

---

## Cross-device Sync (optional)

Uses a free [GitHub Gist](https://gist.github.com) as a zero-cost backend.

1. [Create a personal access token](https://github.com/settings/tokens/new) with only the `gist` scope
2. Create a blank public or secret Gist at gist.github.com
3. Open the app → ⚙️ → paste your token + Gist ID → **Save & Sync**

Every add/delete auto-syncs silently. Works offline too — syncs on next load.

---

## Inventory format

`inventory.json` is a plain JSON array:

```json
[
  {
    "item": "bandaids",
    "location": "Bathroom → Left bottom drawer",
    "notes": "Inside the blue box"
  }
]
```

---

## Tech stack

| Layer | Choice |
|---|---|
| Frontend | Vanilla HTML + CSS + JS (zero build step) |
| Search | [Fuse.js](https://fusejs.io) (fuzzy matching) |
| Storage | `localStorage` + optional GitHub Gist |
| Hosting | GitHub Pages |
| Font | [Inter](https://fonts.google.com/specimen/Inter) via Google Fonts |

---

## License

MIT © 2025 Trupti Natu
