// ==UserScript==
// @name         nitter proxy
// @version      0.1.2
// @description  Re-writing twitter links to nitter
// @author       Aravinth Manivannan
// @match        https://*/*
// @match        http://*/*
// @grant        AGPLv3 or above
// ==/UserScript==

// websites to be proxied
const blacklist = ['twitter.com'];

// Location of the Neddit instance
const nitterHost = 'nitter.batsense.net';

(function() {
  'use strict';

  // nitter has a button to go to the original site, re-writing that would be stupid
  if (!window.location.href.includes(nitterHost)) {
    let urls = document.links;

    for (let i = 0; i < urls.length; i++) {
      blacklist.forEach(url => {
        if (urls[i].host.includes(url)) {
          urls[i].host = nitterHost;
        }
      });
    }
  }
})();
