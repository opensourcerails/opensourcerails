window.Lizi ||= {};
lizi = window.Lizi

#
lizi.mixpanel = (callback) ->
  if lizi.mixpanelFired
    if Settings.mixpanel.enabled
      callback() if typeof(callback) == "function"
  else
    # queue up callback, trigger it after window load
    lizi.mixpanelQueued ||= []
    lizi.mixpanelQueued.push(callback)

# fires off all the queued up mixpanel events
lizi.fireMixpanels = ->
  queued = lizi.mixpanelQueued || []
  lizi.mixpanelFired = true
  lizi.mixpanelQueued = []
  if Settings.mixpanel.enabled
    for callback in queued
      callback() if typeof(callback) == "function"
