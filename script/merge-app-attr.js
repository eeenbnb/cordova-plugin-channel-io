#!/usr/bin/env node

module.exports = function (context) {
  const fs = require('fs')
  const path = require('path')
  const xml2js = require('xml2js')
  const parser = new xml2js.Parser()

  const manifestPath = path.join(context.opts.projectRoot, 'platforms/android/app/src/main/AndroidManifest.xml')
  const manifestXml = fs.readFileSync(manifestPath, 'utf8')

  parser.parseString(manifestXml, (err, result) => {
    if (err) {
      console.error(err)
      return
    }
    const applicationTag = result['manifest']['application'][0]['$']
    applicationTag['android:usesCleartextTraffic'] = 'true'
    const builder = new xml2js.Builder()
    const xml = builder.buildObject(result)
    fs.writeFileSync(manifestPath, xml, 'utf8')
  })
}
