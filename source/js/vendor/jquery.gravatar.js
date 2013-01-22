/*
 * jQuery.gravatar 1.0.1 (2009-01-08)
 *
 * Written by Zach Leatherman
 * http://zachleat.com
 *
 * Licensed under the WTFPL (http://sam.zoy.org/wtfpl/)
 *
 * Requires jQuery http://jquery.com (1.2.6 at time of release)
 * Requires http://pajhome.org.uk/crypt/md5/md5.js
 */

(function($)
{
    $.gravatar = function(emailAddress, overrides)
    {
        var options = $.extend({
            // Defaults are not hardcoded here in case gravatar changes them on their end.
            // integer size: between 1 and 512, default 80 (in pixels)
            size: '',
            // rating: g (default), pg, r, x
            rating: '',
            // url to define a default image (can also be one of: identicon, monsterid, wavatar)
            image: '',
            // secure
            secure: false
        }, overrides);

        var baseUrl = options.secure ? 'https://secure.gravatar.com/avatar/' : 'http://www.gravatar.com/avatar/';

        return $('<img src="' + baseUrl +
            hex_md5(emailAddress) +
            '.jpg?' +
            (options.size ? 's=' + options.size + '&' : '') +
            (options.rating ? 'r=' + options.rating + '&' : '') +
            (options.image ? 'd=' + encodeURIComponent(options.image) : '') +
            '"/>').bind('error', function()
            {
                $(this).remove();
            });
    };
})(jQuery);