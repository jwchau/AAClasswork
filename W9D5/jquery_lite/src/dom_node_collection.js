
function DOMNodeCollection(arr) {
  this.collection = arr;
}

DOMNodeCollection.prototype.html = function(arg) {
  if (!arg) {
    return this.collection[0].innerHTML;
  } else {
    this.collection.forEach(element => {
      element.innerHTML = arg;
    });
  }
};

DOMNodeCollection.prototype.empty = function() {
  this.collection.forEach(element => {
    element.innerHTML = "";
  });
};

DOMNodeCollection.prototype.append = function(arg) {
  // debugger
  if (arg instanceof DOMNodeCollection) {
    for (let i = 0; i < this.collection.length; i++) {
      const this_el = this.collection[i];
      for (let j = 0; j < arg.collection.length; j++) {
        // debugger
        const arg_el = arg.collection[j];
        this_el.innerHTML += arg_el.outerHTML;
      }
    }
  } else {
    for (let i = 0; i < this.collection.length; i++) {
      this.collection[i].innerHTML += arg;
    }
  }

};

DOMNodeCollection.prototype.attr = function(name, value) {
  if (value === undefined) {
    return this.collection[0].attributes[`${name}`];
  } else {
    this.collection[0].attributes[`${name}`] = value;
  }
};

DOMNodeCollection.prototype.addClass = function(...names) {
  for (let i = 0; i < this.collection.length; i++) {
    const el = this.collection[i];
    el.classList.add(...names);
  }
};

DOMNodeCollection.prototype.removeClass = function(...names) {
  for (let i = 0; i < this.collection.length; i++) {
    const el = this.collection[i];
    el.classList.remove(...names);
  }
};





module.exports = DOMNodeCollection;






