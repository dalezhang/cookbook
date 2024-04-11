const path = require('path')
const esbuild = require('esbuild')
esbuild.build({
  entryPoints: ['application.js'],
  bundle: true,
  outdir: path.join(process.cwd(), 'app/assets/builds'),
  absWorkingDir: path.join(process.cwd(), 'app/javascript'),
  // watch: process.argv.includes('--watch'),
  plugins: []
}).catch(() => process.exit(1))