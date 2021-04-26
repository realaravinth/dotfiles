// ==UserScript==
// @name         Go Away
// @version      0.1.4
// @description  Makes things disappear on screen
// @author       Aravinth Manivannan
// @match        *://stackoverlflow.com/*
// @match        *://stackoverlflow.com/*
// @match        *://stackexchange.com/*
// @match        *://stackexchange.com/*
// @match        *://stackexchange.com/*
// @match        *://stackoverflow.com/*
// @match        *://meta.stackoverflow.com/*
// @match        *://serverfault.com/*
// @match        *://meta.serverfault.com/*
// @match        *://superuser.com/*
// @match        *://meta.superuser.com/*
// @match        *://askubuntu.com/*
// @match        *://meta.askubuntu.com/*
// @match        *://stackapps.com/*
// @match        *://stackexchange.com/*
// @match        *://stackoverflow.com/*
// @match        *://meta.stackoverflow.com/*
// @match        *://serverfault.com/*
// @match        *://meta.serverfault.com/*
// @match        *://superuser.com/*
// @match        *://meta.superuser.com/*
// @match        *://askubuntu.com/*
// @match        *://meta.askubuntu.com/*
// @match        *://stackapps.com/*
// @match        *://*.stackexchange.com/*
// @match        *://stackoverflow.com/*
// @match        *://meta.stackoverflow.com/*
// @match        *://serverfault.com/*
// @match        *://meta.serverfault.com/*
// @match        *://superuser.com/*
// @match        *://meta.superuser.com/*
// @match        *://askubuntu.com/*
// @match        *://meta.askubuntu.com/*
// @match        *://stackapps.com/*
// @grant        AGPLv3 or above
// ==/UserScript==

const CLASS_NAME = [
  'ff-sans ps-fixed z-nav-fixed ws4 sm:w-auto p32 bg-black-750 fc-white bar-lg b16 l16 r16 js-consent-banner',
  'ff-sans ps-fixed z-nav-fixed wmx4 p16 bg-black-750 fc-white bar-lg b16 l16 r16 js-consent-banner',
  'grid wmx12 mx-auto px8 py12 jc-space-between ai-center lg:pl24 lg:pr24 md:fd-column sm:fd-row sm:ai-center'
];

const run = () => {
  CLASS_NAME.forEach(cls => {
    let element = document.getElementsByClassName(cls);
    if (element.length != 0) {
      element[0].remove();
    }
  });
};

(function() {
  'use strict';
  run();
  document.addEventListener('DOMContentLoaded', run);
})();
