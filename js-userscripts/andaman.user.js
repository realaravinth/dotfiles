// ==UserScript==
// @name         Google Analytics Shim
// @version      0.1.0
// @description  Shows reading progress
// @author       Mozilla
// @match        https://*/*
// @match        http://*/*
// @grant        AGPLv3 or above
// ==/UserScript==

const UPDATE_PERIOD = 250;

const ID_FRAME = 'firefox_strict_privacy_protection';

const makeFrame = () => {
  let frame = document.createElement('iframe');
  frame.src = 'http://localhost:5000/';
  frame.style.position = 'sticky';
  frame.style.height = '50px';
  frame.style.width = '50px';
  frame.style.opacity = "0.3";
  frame.id = ID_FRAME;
  return frame;
};

const modDom = () => {
  let frame = document.getElementById(ID_FRAME);
  if (frame === undefined || frame === null) {
    let frame = makeFrame();
    let body = document.getElementsByTagName('body')[0];
    body.appendChild(frame);
  }
};

const check = () => {
  setTimeout(() => {
    modDom();
    check();
  }, UPDATE_PERIOD);
};

(function() {
  'use strict';
  check();
})();
