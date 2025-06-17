import { defineConfig } from 'vite'
import rabbitTEA from 'rabbit-tea-vite'
import tailwindcss from '@tailwindcss/vite'
import path from 'path'
import fs from 'fs'

const testAssetsServer = {
    name: 'static',
    configureServer(server) {
        server.middlewares.use((req, res, next) => {
            if (req.url.startsWith('/assets')) {
                const p = path.join('test', req.url)
                try {
                    const content = fs.readFileSync(p)
                    res.write(content)
                    console.log('Request succeed:', req.url)
                } catch {
                    res.statusCode = 404
                    console.log('Request failed:', req.url)
                }
                res.end()
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
        assetsDir: ''
    },
    plugins: [
        rabbitTEA(),
        tailwindcss(),
        testAssetsServer
    ],
})