// Function.prototype.inherits = function(parent) {
//   function Surrogate() {}
//   Surrogate.prototype = parent.prototype; 
//   this.prototype = new Surrogate();
//   this.prototype.constructor = this;

// };

Function.prototype.inherits = function(parent) {
  this.prototype = Object.create(parent.prototype);
  this.prototype.constructor = this;
}


function MovingObject(x = 0, y = 0) {
  this.x = x;
  this.y = y;
}

MovingObject.prototype.moveRight = function(x) {
  return this.x += x;
};

function Ship() { 
  MovingObject.call(this);
  this.sails = 'blue';
}
Ship.inherits(MovingObject);

function Asteroid() {
  MovingObject.call(this);
  this.size = 'hooj';
}
Asteroid.inherits(MovingObject);

let block = new MovingObject(50, 102);
let ship1 = new Ship();
let ast1 = new Asteroid();
// debugger;

// .load inherit.js