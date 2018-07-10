const detectIE = () => {
  var ua = window.navigator.userAgent;

  var msie = ua.indexOf('MSIE ');
  if (msie > 0) {
    // IE 10 or older => return version number
    return parseInt(ua.substring(msie + 5, ua.indexOf('.', msie)), 10);
  }

  var trident = ua.indexOf('Trident/');
  if (trident > 0) {
    // IE 11 => return version number
    var rv = ua.indexOf('rv:');
    return parseInt(ua.substring(rv + 3, ua.indexOf('.', rv)), 10);
  }

  var edge = ua.indexOf('Edge/');
  if (edge > 0) {
    // Edge (IE 12+) => return version number
    return parseInt(ua.substring(edge + 5, ua.indexOf('.', edge)), 10);
  }

  // other browser
  return false;
}

const copyToClipboard = str => { const el = document.createElement('textarea'); el.value = str; el.setAttribute('readonly', ''); el.style.position = 'absolute'; el.style.left = '-9999px'; document.body.appendChild(el); el.select(); document.execCommand('copy'); document.body.removeChild(el); }

const rgbToHex = (r, g, b) => '#' + ((1 << 24) + (r << 16) + (g << 8) + b).toString(16).slice(1)

const beautifyHtml = str => { const div = document.createElement('div'); div.innerHTML = str.trim(); return formatHtml(div, 0).innerHTML; }

const formatHtml = (node, level) => { let indentBefore = new Array(level++ + 1).join('  '); let indentAfter  = new Array(level - 1).join('  '); let textNode; for(let i = 0; i < node.children.length; i++) { textNode = document.createTextNode('\n' + indentBefore); node.insertBefore(textNode, node.children[i]); formatHtml(node.children[i], level); if (node.lastElementChild == node.children[i]) { textNode = document.createTextNode('\n' + indentAfter); node.appendChild(textNode); } } return node; }

module.exports = {
  detectIE: detectIE,
  copyToClipboard: copyToClipboard,
  rgbToHex: rgbToHex,
  beautifyHtml: beautifyHtml,
  formatHtml: formatHtml,
}
