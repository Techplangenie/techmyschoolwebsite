/**
 * Tech My School — GA4 donation tracking.
 *
 * OWNER: paste the real GA4 Measurement ID below (GA4 → Admin →
 * Data streams → your web stream → Measurement ID). It looks like G-1A2BCD3EFG.
 * Leave the quotes. This is the only place the ID lives.
 *
 * Until that placeholder is replaced, events are queued on window.dataLayer
 * and gtag.js is not requested, so the live site does not set analytics cookies.
 */
(function () {
  var GA_MEASUREMENT_ID = 'G-XXXXXXXXXX';

  var measurementId = String(GA_MEASUREMENT_ID || '').replace(/^\s+|\s+$/g, '').toUpperCase();
  var measurementReady = /^G-[A-Z0-9]+$/.test(measurementId) && !/^G-X+$/.test(measurementId);

  window.dataLayer = window.dataLayer || [];
  window.gtag = window.gtag || function gtag() { window.dataLayer.push(arguments); };

  window.gtag('js', new Date());
  if (measurementReady) {
    var loader = document.createElement('script');
    loader.async = true;
    loader.src = 'https://www.googletagmanager.com/gtag/js?id=' + encodeURIComponent(measurementId);
    document.head.appendChild(loader);
    window.gtag('config', measurementId);
  }

  function language() {
    var lang = (document.documentElement.getAttribute('lang') || 'en').toLowerCase();
    return lang.indexOf('es') === 0 ? 'es' : 'en';
  }

  function pagePath() {
    return location.pathname + location.search;
  }

  function absoluteUrl(href) {
    return new URL(href, location.href);
  }

  // Donation destinations only. Mobile STEM Lab PayPal checkouts
  // (/ncp/payment/...) are program fees, not gifts, and are ignored.
  function donationTarget(anchor) {
    if (!anchor || anchor.classList.contains('lang-switch')) return null;
    var href = anchor.getAttribute('href');
    if (!href || href.charAt(0) === '#') return null;

    var url;
    try { url = absoluteUrl(href); } catch (e) { return null; }
    if (url.protocol !== 'http:' && url.protocol !== 'https:') return null;

    var host = url.hostname.replace(/^www\./, '').toLowerCase();
    var path = url.pathname.replace(/\/+$/, '') || '/';

    if (host === 'paypal.com' && path === '/donate') return url.href;
    if (host === 'givebutter.com') return url.href;
    if (host === 'cash.app') return url.href;

    var here = location.hostname.replace(/^www\./, '').toLowerCase();
    var onThisSite = host === here || host === 'techmyschool.org';
    if (onThisSite && (path === '/donate' || path === '/donate.html' || path === '/es/donate' || path === '/es/donate.html')) {
      return url.href;
    }
    return null;
  }

  function onPointer(event) {
    try {
      if (event.type === 'auxclick' && event.button !== 1) return;
      var node = event.target;
      if (!node || !node.closest) return;
      var linkUrl = donationTarget(node.closest('a'));
      if (!linkUrl) return;
      window.gtag('event', 'donate_click', {
        link_url: linkUrl,
        page_path: pagePath(),
        language: language(),
        transport_type: 'beacon'
      });
    } catch (e) {}
  }

  document.addEventListener('click', onPointer, true);
  document.addEventListener('auxclick', onPointer, true);

  // No thank-you page and no embedded form exist. A completed gift can
  // only be seen if PayPal or GiveButter sends the donor back here.
  // Fires once per return URL (refresh does not count twice):
  //   ?donation_complete=1
  //   PayPal auto-return ?st=Completed (amt / cc / tx used when present)
  function amount(raw) {
    if (!raw) return null;
    var value = parseFloat(String(raw).replace(/[^0-9.]/g, ''));
    return isFinite(value) && value > 0 ? value : null;
  }

  function maybeDonationComplete() {
    try {
      var params = new URLSearchParams(location.search);
      var flagged = params.get('donation_complete') === '1' || params.get('donation_complete') === 'true';
      var paypalDone = String(params.get('st') || '').toLowerCase() === 'completed';
      if (!flagged && !paypalDone) return;

      var transactionId = params.get('tx') || params.get('txn_id') || params.get('transaction_id') || '';
      var dedupeKey = 'tms_donation_complete:' + location.pathname + location.search + ':' + transactionId;
      try {
        if (window.sessionStorage.getItem(dedupeKey)) return;
        window.sessionStorage.setItem(dedupeKey, '1');
      } catch (e) {}

      var payload = {
        page_path: pagePath(),
        language: language(),
        transport_type: 'beacon'
      };
      var value = amount(params.get('amt') || params.get('amount') || params.get('value'));
      if (value !== null) {
        payload.value = value;
        payload.currency = String(params.get('cc') || params.get('currency') || 'USD').toUpperCase();
      }
      if (transactionId) payload.transaction_id = transactionId;
      window.gtag('event', 'donation_complete', payload);
    } catch (e) {}
  }

  if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', maybeDonationComplete);
  } else {
    maybeDonationComplete();
  }
})();
