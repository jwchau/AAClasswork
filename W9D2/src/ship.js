const Util = require('./utils.js');
const MovingObject = require('./moving_object.js');

Ship.COLOR = 'red';
Ship.LENGTH = 25;

function Ship(pos2 = [500, 500]) {
  const info = {
    pos: pos2,
    vel: [0, 0],
    radius: Ship.LENGTH,
    color: Ship.COLOR
  }
  this.length = Ship.LENGTH;
  MovingObject.call(this, info);
}
//ParentClass.prototype.myMethod.call(this);
Util.inherits(Ship, MovingObject);

Ship.prototype.draw = function (ctx) {
  // debugger
  ctx.fillStyle = this.color;
  ctx.beginPath();
  let x = this.pos[0];
  let y = this.pos[1];
  ctx.moveTo(x - 15, y - 10);
  ctx.lineTo(x + 15, y + length);
  ctx.lineTo(x + 15, y - 20);
  ctx.fill();

  ctx.strokeStyle = 'white';
  ctx.beginPath();
  ctx.arc(
    this.pos[0],
    this.pos[1],
    this.radius,
    0,
    2 * Math.PI,
    false
  );
  ctx.stroke();
} 

Ship.prototype.power = function(impulse) {
  this.vel[0] += impulse[0];
  this.vel[1] += impulse[1];
}



module.exports = Ship;