// ==UserScript==
// @name         Teddit Prefetch
// @version      0.1
// @description  Prefetches Next page on teddit
// @author       Aravinth Manivannan
// @match        https://teddit.batsense.net/*
// @match        http://teddit.batsense.net/*
// @grant        AGPLv3 or above
// ==/UserScript==

(function() {
  'use strict';

  let urls = document.links;
  for (let i = 0; i < urls.length; i++) {
    if (urls[i].innerText.includes('next')) {
      fetch(urls[i].href)
        .then(console.log('teddit warmped up'))
        .catch(e => console.error(e));
    }
  }
})();
