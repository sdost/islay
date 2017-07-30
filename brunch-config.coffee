bourbon = require("bourbon")
neat = require("bourbon-neat")

module.exports = config:
  conventions:
    assets:  /^src\/public\//
    ignored: /^(src\/styles\/overrides|(.*?\/)?[_]\w*)/
  paths:
    public: 'dist'
  files:
    stylesheets:
      joinTo:
        'assets/css/styles.css': /^(src|vendor)/
      order:
        before: [
          'vendor/styles/font-awesome.min.css'
        ]
        after: [
          'vendor/styles/monokai.css'
        ]

    javascripts:
      joinTo:
        'assets/js/scripts.js': /^src/
        'assets/js/vendor.js': /^vendor/

  plugins:
    uglify:
      mangle: true
    autoReload:
      enabled: true
    assetsmanager:
      copyTo:
        'assets': ['images', 'fonts']
    sass:
      options:
        mode: 'native'
        includePaths: [bourbon.includePaths..., neat.includePaths...]
