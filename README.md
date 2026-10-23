# 🥮 mooncakes.io

The MoonBit package distribution platform, built with [Rabbita](https://github.com/moonbit-community/rabbita) and [Tailwind CSS](https://tailwindcss.com/).

## Build & Run

Homepage search uses `GET /api/v0/search?kw=...&limit=20` with 250 ms debounce;
the backend performs Meilisearch matching and relevance-first ordering. Results
include package summaries, safe text highlights and summary-version links. Local
fuzzy matching is no longer used for search. The full-module browse remains.

To preview against a locally running backend (for example port 18001):

```sh
VITE_DEV_API_PROXY=http://127.0.0.1:18001 VITE_API_ENDPOINT=/api \
VITE_ASSETS_ENDPOINT=http://127.0.0.1:5173 pnpm dev --host 127.0.0.1 --port 5173
```

`VITE_DEV_API_PROXY` is development-only; production continues using
`VITE_API_ENDPOINT`. The backend's former `/api/v0/search_v2` route is removed.

Use Node.js 20.19+ or 22.12+ as required by Vite.

```bash
npm i
moon update
moon install
moon build --target js
npm run dev
```

The skill marketplace is served at `/skills` on the main site. The retired
`skills.mooncakes.io` host redirects there through Nginx.

By default API requests use the same-origin `/api` path. To build with a
different API endpoint, set `VITE_API_ENDPOINT` to the value that should replace
`/api`:

```bash
VITE_API_ENDPOINT=https://api.example.com/new-api \
  npm run build
```

## Contribution

We welcome contributions! Please review our [contributing guidelines](CONTRIBUTING.md) before submitting.
