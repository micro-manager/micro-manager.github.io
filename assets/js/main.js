/*
	Photon by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
*/

(function($) {

	var	$window = $(window),
		$body = $('body');

	// Breakpoints.
		breakpoints({
			xlarge:   [ '1141px',  '1680px' ],
			large:    [ '981px',   '1140px' ],
			medium:   [ '737px',   '980px'  ],
			small:    [ '481px',   '736px'  ],
			xsmall:   [ '321px',   '480px'  ],
			xxsmall:  [ null,      '320px'  ]
		});

	// Play initial animations on page load.
		$window.on('load', function() {
			window.setTimeout(function() {
				$body.removeClass('is-preload');
			}, 100);
		});

	// Scrolly.
		$('.scrolly').scrolly();

	// remove TOC if few headings exist
	if($('#content h1, #content h2').length < 3) {
		$('.toc').remove();
	}

})(jQuery);

/*
 * Set the anchor offset to match the nav-bar height. Otherwise, clicking
 * an anchor link results in the header being concealed beneath the nav-bar.
 */
var navBar = document.getElementById('nav-bar');
if (navBar != null) {
  var anchorOffsetRule = document.styleSheets[0].cssRules[
    document.styleSheets[0].insertRule(
      `[id] { scroll-margin-top: ${navBar.offsetHeight+10}px }`, 0)
  ];
  document.defaultView.addEventListener('resize', function(e) {
    anchorOffsetRule.style['scroll-margin-top'] = `${navBar.offsetHeight+10}px`;
  }, false);
}
