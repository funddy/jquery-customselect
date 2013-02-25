fs = require "fs"
{exec} = require "child_process"

appFiles = [
  "funddy"
  "custom_select_presenter"
  "custom_select_view"
  "jquery_plugin"
]

task "build", "Build jQuery custom select file", (options) ->
  output = "jquery.customselect-1.0"
  appContents = new Array remaining = appFiles.length

  for file, index in appFiles then do (file, index) ->
    fs.readFile "src/#{file}.coffee", 'utf8', (err, fileContents) ->
      throw err if err
      appContents[index] = fileContents
      process() if --remaining is 0

  process = ->
    fs.writeFile "lib/#{output}.coffee", appContents.join("\n\n"), "utf8", (err) ->
      throw err if err
      exec "coffee --compile lib/#{output}.coffee", (err, stdout, stderr) ->
        throw err if err
        console.log stdout + stderr
        fs.unlink "lib/#{output}.coffee", (err) ->
          throw err if err
          console.log "Done"