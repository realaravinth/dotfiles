// ==UserScript==
// @name         Morty proxy
// @version      0.1
// @description  Proxies websites to a morty proxies by re-writing links in a document
// @author       Aravinth Manivannan
// @match        https://*/*
// @match        http://*/*
// @grant        AGPLv3 or above
// ==/UserScript==

// websites to be proxied
const blacklist = ["medium.com", "blog.discord.com", "lifehacker.com"];

// Location of the proxy
const mortyHost = "https://morty.batsense.net";

(function() {
    'use strict';

    if (!window.location.href.includes(mortyHost)) {
        let urls = document.getElementsByTagName('a');

        for(let i=0; i<urls.length; i++){
            blacklist.forEach(url => {
                if(urls[i].href.includes(url)) {
                    let newLocation = `${mortyHost}/?mortyurl=${encodeURIComponent(urls[i].href)}`;
                    urls[i].href = newLocation;
                }
            })
        }
    }
})();
