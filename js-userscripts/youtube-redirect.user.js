// ==UserScript==
// @name         youtube proxy
// @version      0.1.1
// @description  Re-writing reddit links to tube
// @author       Aravinth Manivannan
// @match        https://*/*
// @match        http://*/*
// @grant        AGPLv3 or above
// ==/UserScript==

// websites to be proxied
const blacklist = ["www.youtube.com", "mobile.youtube.com", "youtube.com"];

// Location of the Piped instance
const tubeHost = "tube.batsense.net";

(function () {
  "use strict";

  if (!window.location.href.includes(tubeHost)) {
    let urls = document.links;

    for (let i = 0; i < urls.length; i++) {
      blacklist.forEach((url) => {
        if (urls[i].host.includes(url)) {
          urls[i].host = tubeHost;
        }
      });
    }

    const iframes = document.querySelectorAll("iframe");
    iframes.forEach((frame) => {
      blacklist.forEach((url) => {
        if (frame.src.host.includes(url)) {
          frame.src.host = tubeHost;
        }
      });
    });
  }
})();
