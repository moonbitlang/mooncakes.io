# 🥮 mooncakes.io

The MoonBit package distribution platform, built with [Rabbita](https://github.com/moonbit-community/rabbita) and [Tailwind CSS](https://tailwindcss.com/).

## Build & Run

To preview against a locally running backend (for example port 18001):

```sh
VITE_DEV_API_PROXY=http://127.0.0.1:18001 \
MOONCAKES_ASSETS_ENDPOINT=http://127.0.0.1:5173 pnpm dev --host 127.0.0.1 --port 5173
```

`VITE_DEV_API_PROXY` configures the development server's `/api` proxy.

Use Node.js 20.19+ or 22.12+ as required by Vite.

```bash
npm i
moon update
moon install
moon build --target js
npm run dev
```

Skills is available at `/skills` on the same origin, with the main site's
navigation and account controls. Development and production use the same route.

## Contribution

We welcome contributions! Please review our [contributing guidelines](CONTRIBUTING.md) before submitting.
