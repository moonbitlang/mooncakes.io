import { defineConfig } from 'vite'
import rabbita from '@rabbita/vite'
import tailwindcss from '@tailwindcss/vite'
import viteCompression from 'vite-plugin-compression'

const testAssetsServer = {
  name: 'static',
  configureServer(server) {
    server.middlewares.use(async (req, res, next) => {
      if (req.url?.startsWith('/assets')) {
        const target = `https://mooncakes.io${req.url}`
        try {
          const upstream = await fetch(target, {
            method: req.method || 'GET',
            headers: {
              'accept-encoding': 'identity',
            },
          })

          res.statusCode = upstream.status
          const hopByHopHeaders = new Set([
            'connection',
            'keep-alive',
            'proxy-authenticate',
            'proxy-authorization',
            'te',
            'trailers',
            'transfer-encoding',
            'upgrade',
            'content-encoding',
            'content-length',
          ])
          for (const [k, v] of upstream.headers.entries()) {
            if (!hopByHopHeaders.has(k.toLowerCase())) {
              res.setHeader(k, v)
            }
          }

          const body = Buffer.from(await upstream.arrayBuffer())
          res.setHeader('content-length', String(body.length))
          if (req.method === 'HEAD') {
            res.end()
          } else {
            res.end(body)
          }
          console.log('Request proxied:', req.url, '->', target)
        } catch (err) {
          res.statusCode = 502
          res.end('Bad Gateway')
          console.log('Request proxy failed:', req.url, err)
        }
      } else {
        next()
      }
    })
  }
}

export default defineConfig({
  root: 'src',
  publicDir: '../public',
  build: {
    outDir: '../dist',
    assetsDir: '',
    // Use esbuild minify (default, faster than terser)
    minify: 'esbuild',
  },
  server: {
    proxy: {
      '/api': {
        target: 'https://mooncakes.io',
        changeOrigin: true,
        secure: false,
        configure: (proxy, options) => {
          proxy.on('error', (err, req, res) => {
            console.log('Proxy error:', err)
          })
          proxy.on('proxyReq', (proxyReq, req, res) => {
            console.log('Proxying:', req.method, req.url)
          })
        }
      }
    }
  },
  plugins: [
    rabbita({ main: 'main' }),
    tailwindcss(),
    testAssetsServer,
    // Gzip compression
    viteCompression({
      algorithm: 'gzip',
      ext: '.gz',
      threshold: 10240, // Only compress files > 10KB
      deleteOriginFile: false
    }),
    // Brotli compression (higher compression ratio)
    viteCompression({
      algorithm: 'brotliCompress',
      ext: '.br',
      threshold: 10240,
      deleteOriginFile: false
    })
  ],
})
