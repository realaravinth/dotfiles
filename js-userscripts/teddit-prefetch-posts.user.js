// ==UserScript==
// @name         Teddit Posts Prefetch
// @version      0.1.2
// @description  Prefetches all posts in a page on teddit
// @author       Aravinth Manivannan
// @match        https://teddit.batsense.net/*
// @match        http://teddit.batsense.net/*
// @grant        AGPLv3 or above
// ==/UserScript==

const preload = async url => {
  fetch(url)
    .then(console.log('Page preloaded'))
    .catch(e => console.error(e));
};

const libRedditProcess = async () => {
  Array.from(
    document.querySelector('footer').getElementsByTagName('a'),
  ).forEach(async link => {
    if (link.innerHTML.includes('NEXT')) {
      await preload(link.href);
    }
  });
};

const tedditProcess = async () => {
  let urls = document.links;
  for (let i = 0; i < urls.length; i++) {
    if (urls[i].className == 'comments') {
      await preload(urls[i].href);
    }
  }
};

(function() {
  'use strict';
  libRedditProcess();
})();
