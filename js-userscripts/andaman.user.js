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

const ID_FRAME_TRUE = 'firefox_strict_privacy_protection--true';
const ID_FRAME_FALSE = 'firefox_strict_privacy_protection--false';

const fetchTrue = () => fetch('http://localhost:5000/true');

const fetchFalse = () => fetch('http://localhost:5000/false');

function dragElement(elmnt) {
  var pos1 = 0, pos2 = 0, pos3 = 0, pos4 = 0;
  if (document.getElementById(elmnt.id + "header")) {
    // if present, the header is where you move the DIV from:
    document.getElementById(elmnt.id + "header").onmousedown = dragMouseDown;
  } else {
    // otherwise, move the DIV from anywhere inside the DIV:
    elmnt.onmousedown = dragMouseDown;
  }

  function dragMouseDown(e) {
    e = e || window.event;
    e.preventDefault();
    // get the mouse cursor position at startup:
    pos3 = e.clientX;
    pos4 = e.clientY;
    document.onmouseup = closeDragElement;
    // call a function whenever the cursor moves:
    document.onmousemove = elementDrag;
  }

  function elementDrag(e) {
    e = e || window.event;
    e.preventDefault();
    // calculate the new cursor position:
    pos1 = pos3 - e.clientX;
    pos2 = pos4 - e.clientY;
    pos3 = e.clientX;
    pos4 = e.clientY;
    // set the element's new position:
    elmnt.style.top = (elmnt.offsetTop - pos2) + "px";
    elmnt.style.left = (elmnt.offsetLeft - pos1) + "px";
  }

  function closeDragElement() {
    // stop moving when mouse button is released:
    document.onmouseup = null;
    document.onmousemove = null;
  }
}


const makeFrameFalse = () => {
  let frame = document.createElement('button');
  frame.addEventListener('click', fetchFalse);
//  frame.src = 'http://localhost:5000/false';
  frame.style.position = 'absolute';
  frame.style.background = 'pink';
  frame.style.height = '50px';
  frame.style.width = '50px';
  //frame.style.margin = "100px"
  frame.style.bottom = "10px";
  frame.style.left = "300px";
  frame.style.opacity = "0.3";
  frame.id = ID_FRAME_FALSE;
  frame.style.zIndex = 1000;
  dragElement(frame);
  return frame;
};


const makeFrameTrue = () => {
  let frame = document.createElement('button');
  frame.addEventListener('click', fetchTrue);
  frame.src = 'http://localhost:5000/true';
  frame.style.background = 'lightgreen';
  frame.style.position = 'absolute';
  frame.style.height = '50px';
  frame.style.width = '50px';
  //frame.style.margin = "100px"
  frame.style.bottom = "10px";
  frame.style.left = "200px";
  frame.style.opacity = "0.3";
  frame.id = ID_FRAME_TRUE;
  frame.style.zIndex = 1000;
  dragElement(frame);
  return frame;
};

const modDom = () => {
  let frame_true = document.getElementById(ID_FRAME_TRUE);
  let frame_false = document.getElementById(ID_FRAME_FALSE);
  if (frame_true === undefined || frame_true === null || frame_false === undefined || frame_false === null) {
    let frame_true = makeFrameTrue();
    let frame_false = makeFrameFalse();
    let body = document.getElementsByTagName('body')[0];
    body.appendChild(frame_true);
    body.appendChild(frame_false);
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
