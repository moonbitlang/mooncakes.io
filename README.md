# 🥮 mooncakes.io

The distribution platform for MoonBit library, developed in collaboration with [Rabbit Tea](https://github.com/Yoorkin/rabbit-tea) and [Tailwindcss](https://tailwindcss.com/).

## Build & Run

```bash
npm i
moon update
moon install
moon build --target js
npm run dev
```

By default API requests use the same-origin `/api` path. To build with a
different API endpoint, set `VITE_API_ENDPOINT` to the value that should
replace `/api`:

```bash
VITE_API_ENDPOINT=https://api.example.com/new-api npm run build
```

## Contribution

We welcome contributions! Please review our [contributing guidelines](CONTRIBUTING.md) before submitting.
