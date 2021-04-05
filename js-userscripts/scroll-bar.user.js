// ==UserScript==
// @name         Scroll Bar
// @version      0.1.1
// @description  Shows reading progress
// @author       Aravinth Manivannan
// @match        https://*/*
// @match        http://*/*
// @grant        AGPLv3 or above
// ==/UserScript==

const PROGRESS_BAR_ID = 'user-script-progress-bar';
const UPDATE_PERIOD = 250;

let throttling = false;

const processScroll = () => {
  let docElem = document.documentElement;
  let docBody = document.body;
  let scrollTop = docElem['scrollTop'] || docBody['scrollTop'];
  let scrollBottom =
    (docElem['scrollHeight'] || docBody['scrollHeight']) - window.innerHeight;
  let scrollPercent = (scrollTop / scrollBottom) * 100 + '%';

  document.getElementById(PROGRESS_BAR_ID).style.width = scrollPercent;
};

const throttledUpdate = () => {
  // if the variable is true, don't run the function
  if (throttling) {
    return;
  }

  throttling = true;

  // use setTimeout to run the function with time = update_period
  setTimeout(() => {
    processScroll();
    throttling = false;
  }, UPDATE_PERIOD);
};

const makeBar = () => {
  let bar = document.createElement('div');
  bar.id = PROGRESS_BAR_ID;
  bar.style.height = '5px';
  bar.style.position = 'fixed';
  bar.style.top = '0';
  bar.style.backgroundColor = '#40ff40';
  bar.style.zIndex = '5000';
  bar.style.opacity = '0.6';

  let body = document.getElementsByTagName('body')[0];
  // body.unshift(bar);
  body.appendChild(bar);
};

(function() {
  'use strict';

  makeBar();
  processScroll();
  if (UPDATE_PERIOD > 0) {
    document.addEventListener('scroll', throttledUpdate);
  } else {
    document.addEventListener('scroll', processScroll);
  }
})();
