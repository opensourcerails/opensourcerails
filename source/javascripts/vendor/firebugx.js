(function(){
  try {
    window.console = window.console || {};

    var names = ["log", "debug", "info", "warn", "error", "assert", "dir", "dirxml", "group", "groupEnd", "time", "timeEnd", "count", "trace", "profile", "profileEnd"];

    var nada = function(){};
  
    for (var i = 0; i < names.length; ++i)
      window.console[names[i]] = window.console[names[i]] || nada;
  }catch(e){};
})();