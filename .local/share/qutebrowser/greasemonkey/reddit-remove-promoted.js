// ==UserScript==
// @description Remove promoted links and ads on reddit.
// @include     https://www.reddit.com/
// @version     0.1
// ==/UserScript==

console.log("UserScript Reddit Remove Promoted");

// Delete the reddit premium element
const premiumBanner = document.getElementsByClassName("premium-banner-outer");
if (premiumBanner.length > 0) {
  console.log("Removing premium ad")
  premiumBanner[0].parentNode.removeChild(premiumBanner[0]);
}
