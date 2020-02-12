const Util = require('./utils.js')

function MovingObject(info) {
  this.pos = info.pos;
  this.vel = info.vel;
  this.radius = info.radius;
  this.color = info.color;
}

MovingObject.prototype.draw = function(ctx) {
  // debugger
  ctx.fillStyle = this.color;
  ctx.beginPath();
  ctx.arc(
    this.pos[0],
    this.pos[1],
    this.radius,
    0,
    2 * Math.PI,
    false
  );
  ctx.fill();
}

MovingObject.prototype.move = function() {
  this.pos[0] += this.vel[0];
  this.pos[1] += this.vel[1];

  if (this.pos[0] < -this.radius) this.pos[0] = 1000 + this.radius;
  else if (this.pos[0] > this.radius + 1000) this.pos[0] = -this.radius + 1;
  else if (this.pos[1] < -this.radius) this.pos[1] = 1000 + this.radius;
  else if (this.pos[1] > this.radius + 1000) this.pos[1] = -this.radius + 1;
}

MovingObject.prototype.isCollidedWith = function(otherObj) {
  return Util.dist(this.pos, otherObj.pos) <= this.radius * 2;
}


module.exports = MovingObject;