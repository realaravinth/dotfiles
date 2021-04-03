// ==UserScript==
// @name         Scroll Bar
// @version      0.1.0
// @description  Shows reading progress
// @author       Aravinth Manivannan
// @match        https://*/*
// @match        http://*/*
// @grant        AGPLv3 or above
// ==/UserScript==

const processScroll = () => {
  let docElem = document.documentElement;
  let docBody = document.body;
  let scrollTop = docElem['scrollTop'] || docBody['scrollTop'];
  let scrollBottom =
    (docElem['scrollHeight'] || docBody['scrollHeight']) - window.innerHeight;
  let scrollPercent = (scrollTop / scrollBottom) * 100 + '%';
  //document.getElementById(PROGRESS_BAR_ID).style.setProperty("--scrollAmount", scrollPercent);
  document.getElementById(PROGRESS_BAR_ID).style.width = scrollPercent;
};
const PROGRESS_BAR_ID = 'user-script-progress-bar';
const PROGRESS_BAR_STYLING = `#${PROGRESS_BAR_ID} {
  --scrollAmount: 0%;
  
 /* background-image: linear-gradient(120deg, #84fab0 0%, #8fd3f4 100%); */
  width: var(--scrollAmount);

    /* background: linear-gradient(to right, #F24E1E var(--scrollAmount), transparent 0); */
  /* width: 100%; */
  background: red;
  
  height: 25px;
  position: fixed;
  top: 100;
  
}`;

(function() {
  'use strict';
  let bar = document.createElement('div');
  bar.id = PROGRESS_BAR_ID;
  bar.style.cssText = PROGRESS_BAR_STYLING;
  bar.style.height = '5px';
  bar.style.position = 'fixed';
  bar.style.top = '0';
  bar.style.backgroundColor = '#40ff40';
  bar.style.zIndex = '5000';
  bar.style.opacity = '0.6';
  //bar.style
  bar.style.width = 'var(--scrollAmmount)';
  let body = document.getElementsByTagName('body')[0];
  // body.unshift(bar);
  body.appendChild(bar);
  processScroll();
  document.addEventListener('scroll', processScroll);
})();
