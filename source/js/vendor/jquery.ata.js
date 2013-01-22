/**
 *  Another TextArea Autogrow plugin (0.2) alpha's alpha
 *  by Nikolay Borisov aka KOSIASIK
 *  mne@figovo.com
 *
 *  http://figovo.com/
 *
 *  Example:
 *  $('textarea').ata();
 *
 *  jQuery required. Download it at http://jquery.com/
 *
 */


(function(jQuery){

  jQuery.fn.ata = function(options){

    options = jQuery.extend({
      timer: 100,
      minus: 0
    }, options);

    return this.each(function(i){

      var $t = jQuery(this),
        t = this;

      t.style.resize = 'none';
      t.style.overflow = 'hidden';

      var tVal = t.value;
      t.style.height = '0px';
      t.value = "W\nW\nW";
      var H3 = t.scrollHeight;
      t.value = "W\nW\nW\nW";
      var H4 = t.scrollHeight;
      var H = H4 - H3;
      t.value = tVal;
      tVal = null;

      $t.before("<div id=\"ataa_"+i+"\"></div>");

      var $c = jQuery('#ataa_'+i),
        c = $c.get(0);

      c.style.padding = '0px';
      c.style.margin = '0px';

      $t.appendTo($c);

      $t.bind('focus', function(){
        t.startUpdating()
      }).bind('blur', function(){
        t.stopUpdating()
      });

      this.heightUpdate = function(){

        if (tVal != t.value){

          tVal = t.value;
          t.style.height = '0px';
          var tH = (t.scrollHeight - options.minus) + H;
          t.style.height = tH + 'px';
          c.style.height = 'auto';
          c.style.height = c.offsetHeight + 'px';
        }

      }

      this.startUpdating = function(){
        t.interval = window.setInterval(function(){
          t.heightUpdate()
        }, options.timer);
      }

      this.stopUpdating = function(){
        clearInterval(t.interval);
      }

      jQuery(function(){
        t.heightUpdate()
      });

    });

  };

})(jQuery);