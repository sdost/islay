module.exports = config:
  conventions:
    assets:  /^app\/public\//
    ignored: /^(bower_components\/bootstrap-less(-themes)?|app\/styles\/overrides|(.*?\/)?[_]\w*)/
  modules:
    definition: false
    wrapper: false
  paths:
    public: '.'
  files:
    stylesheets:
      defaultExtension: 'scss'
      joinTo:
        'assets/css/styles.css': /^(app|vendor|bower_components)/
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
        'assets/js/vendor.js': /^(bower_components|vendor)/

  plugins:
    uglify:
      mangle: true
    autoReload:
      enabled: true
    assetsmanager:
        copyTo:
          'assets': ['app/images', 'app/fonts']

  minify: true