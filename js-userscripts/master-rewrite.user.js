// ==UserScript==
// @name         Privacy rules
// @version      0.1.1
// @description  Rewrites URLs to point to a collection of privacy oriented alternatives
// @author       Aravinth Manivannan
// @match        https://*/*
// @match        http://*/*
// @grant        AGPLv3 or above
// ==/UserScript==

let location = window.location.href;

class Domain {
  blacklist;
  whitelist;
  host;

  rewrite(url) {
    if (location.includes(nitterHost)) {
      blacklist.forEach(badUrl => {
        if (url.host.includes(badUrl)) {
          url.host = this.host;
        }
      });
    }
  }

  setBlacklist(blacklist) {
    this.blacklist = blacklist;
  }

  setHost(host) {
    this.host = host;
    this.whitelist.push(host);
  }
  setWhitelist(whitelist) {
    this.whitelist = whitelist;
  }
}

class Morty extends Domain {
  rewrite(url) {
    if (location.href.includes(nitterHost)) {
      this.blacklist.forEach(badUrl => {
        if (urls.host.includes(badUrl)) {
          let newLocation = `${this.host}/?mortyurl=${encodeURIComponent(
            url.href,
          )}`;
          url.href = newLocation;
        }
      });
    }
  }
}

// sanitizy HTML
const morty = new Morty()
  .setHost('https://morty.batsense.net')
  .setBlacklist(['medium.com', 'blog.discord.com', 'lifehacker.com']);

// twitter proxy
const nitter = new Domain()
  .setBlacklist(['twitter.com'])
  .setHost('nitter.batsense.net');

// reddit proxy
const teddit = new Domain()
  .setBlacklist(['reddit.com'])
  .setHost('teddit.batsense.net');

// rule set
const rules = [morty, nitter, teddit];

(function() {
  'use strict';

  for (let i = 0; i < urls.length; i++) {
    rules.forEach(rule => {
      rule.rewrite(urls[i]);
    });
  }
})();
