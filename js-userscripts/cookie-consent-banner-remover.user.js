// ==UserScript==
// @name         cookie consent remover
// @version      0.1.0
// @description  Removes cookie consent banners
// @author       Aravinth Manivannan
// @match        https://*/*
// @match        http://*/*
// @grant        AGPLv3 or above
// ==/UserScript==

const SCRIPT_NAME = 'cookie consent remover userscript';
let removedNode = null;
let removedNodeDisplay = null;
let show = false;

const hideElement = () => {
  if (show) {
    return;
  }
  let body = document.querySelector('body');
  let children = body.children;
  Array.from(children).forEach(x => {
    if (x.innerText.toLowerCase().includes('accept all cookies')) {
      removedNodeDisplay = x.style.display;
      x.style.display = 'none';
      removedNode = x;
      console.log(`[${SCRIPT_NAME}]: removed: ${x}`);
    }
  });
};

const observer = new MutationObserver(hideElement);

const showElement = () => {
  if (!removedNode === null) {
    console.log(`[${SCRIPT_NAME}]: added: ${removedNode}`);
    removedNode.display = removedNodeDisplay;
    show = true;
    observer.disconnect();
  } else {
    console.log(`[${SCRIPT_NAME}]: no nodes were removed`);
  }
};

(function() {
  'use strict';
  let body = document.querySelector('body');
  hideElement();
  console.log(`[${SCRIPT_NAME}]: all okay`);
  document.addEventListener('DOMContentLoaded', hideElement());
  const config = {attributes: true, childList: true, subtree: true};
  observer.observe(body, config);
})();
