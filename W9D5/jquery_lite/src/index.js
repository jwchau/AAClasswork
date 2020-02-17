const DNC = require('./dom_node_collection.js')

window.$l = function(arg) {
  if (arg instanceof HTMLElement) {
    return new DNC([arg]);
  }
  const domObj = document.querySelectorAll(arg);
  return new DNC(Array.from(domObj));
};

