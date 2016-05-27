bourbon = require("bourbon")
neat = require("bourbon-neat")

module.exports = config:
  conventions:
    assets:  /^app\/public\//
    ignored: /^(app\/styles\/overrides|(.*?\/)?[_]\w*)/
  paths:
    public: 'dist'
  files:
    stylesheets:
      joinTo:
        'assets/css/styles.css': /^(app|vendor)/
      order:
        before: [
          'vendor/styles/font-awesome.min.css'
        ]
        after: [
          'vendor/styles/monokai.css'
        ]

    javascripts:
      joinTo:
        'assets/js/scripts.js': /^app/
        'assets/js/vendor.js': /^vendor/

  plugins:
    uglify:
      mangle: true
    autoReload:
      enabled: true
    assetsmanager:
      copyTo:
        'assets': ['app/images', 'app/fonts']
    sass:
      options:
        mode: 'native'
        includePaths: [bourbon.includePaths..., neat.includePaths...]
