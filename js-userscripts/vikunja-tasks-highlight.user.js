// ==UserScript==
// @name         highlightTasks userscript
// @version      0.1
// @description  highlight tasks in Vikunja
// @author       Aravinth Manivannan
// @match        https://tasks.batsense.net/*
// @grant        AGPLv3 or above
// ==/UserScript==

(function() {
  'use strict';

  // Your code here...
  //const hightlightText = (text, e) => {
  //       if (text.search(/Due/) !== -1){
  //          e.style.background = "yellow"
  //          if (text.search(/hours/) !== -1) {
  //              e.style.background = "pink";
  //          }
  //      }
  // };
  const highlight = () => {
    document.getElementsByClassName('task').forEach(e => {
      let text = e.innerText;
      if (text.search(/Due/) !== -1) {
        e.style.background = 'yellow';
        if (text.search(/hours/) !== -1) {
          e.style.background = 'pink';
        }
        if (text.search(/ago/) !== -1) {
          e.style.background = '#e35b32';
          e.style.font_weight = 'bold';
          e.style.color = 'white';
        }

        // general styling
        // apply only once
        document.getElementsByClassName('overdue').forEach(e => {
          e.style.color = '#990000';
          e.style.font_weight = 'bold';
        });

        document.getElementsByClassName('task-list').forEach(e => {
          e.style.color = 'cyan';
          //e.style.margin_right = "100px";
          //e.style.border = "solid 1px grey";
          //e.style.border_redius = "5px";
          //                e.style.font_weight = "bold";
        });
      }
    });
  };
  window.setInterval(() => highlight(), 1000);
  //let html = e.innherHtml;
  //if (html.search(/Due/) !== -1){
  //    e.style.background = "yellow"
  //    if (html.search(/hours/) !== -1) {
  //        e.style.background = "pink";
  //    }
  // }

  //hightlightText(text, e);
  //hightlightText(html,e);
})();
