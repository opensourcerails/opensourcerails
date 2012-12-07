#= require "vendor/firebugx.js"
#= require "vendor/json2.js"
#= require "vendor/cookies.js"
#= require "vendor/md5.js"
#= require "vendor/modernizr.js"
#= require "vendor/jquery-1.7.1.js"
#= require "vendor/jquery.utils.js"
#= require "vendor/jquery.ata.js"
#= require "vendor/jquery.scrollTo.js"
#= require "vendor/jquery.hotkeys.js"
#= require "vendor/rails.js"
#= require "vendor/underscore.js"
#= require "vendor/underscore.strings.js"
#= require "vendor/underscore.utils.js"

#= require "bootstrap-setup"
#= require "vendor/holder.js"
#= require "vendor/fastclick.js"
#= require "vendor/hammer.js"
#= require "vendor/jquery.hammer.js"

#= require "handlebars"
#= require_tree "../hbs_support"
#= require_tree "./"
#= require_self

window.isSpeechCapable = ->
  elem = document.createElement('input')
  support = `'onwebkitspeechchange' in elem || 'speech' in elem`
  return support

