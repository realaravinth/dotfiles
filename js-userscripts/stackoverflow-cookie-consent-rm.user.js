// ==UserScript==
// @name         Go Away
// @version      0.1.0
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

const CLASS_NAME =
  'ff-sans ps-fixed z-nav-fixed ws4 sm:w-auto p32 bg-black-750 fc-white bar-lg b16 l16 r16 js-consent-banner';

const run = () => {
  document.getElementsByClassName(CLASS_NAME)[0].style.visibility = 'hidden';
};

(function() {
  'use strict';
  run();
  document.addEventListener('DOMContentLoaded', run);
})();
