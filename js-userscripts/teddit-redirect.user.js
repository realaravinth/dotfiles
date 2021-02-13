// ==UserScript==
// @name         teddit proxy
// @version      0.1
// @description  Re-writing reddit links to teddit
// @author       Aravinth Manivannan
// @match        https://*/*
// @match        http://*/*
// @grant        AGPLv3 or above
// ==/UserScript==

// websites to be proxied
const blacklist = ['reddit.com'];

// Location of the Teddit instance
const tedditHost = 'teddit.batsense.net';

(function() {
  'use strict';

  // teddit has a button to go to the original site, re-writing that would be stupid
  if (!window.location.href.includes(tedditHost)) {
    let urls = document.links;

    for (let i = 0; i < urls.length; i++) {
      blacklist.forEach(url => {
        if (urls[i].host.includes(url)) {
          urls[1].host = tedditHost;
        }
      });
    }
  }
})();
