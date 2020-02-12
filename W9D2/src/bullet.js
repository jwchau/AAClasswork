const Util = require('./utils.js');
const MovingObject = require('./moving_object.js');

Bullet.COLOR = 'yellow';
Bullet.RADIUS = 3;
Bullet.SPEED = 50;

function Bullet(pos2 = [0, 0], shipVelocity) {
  // debugger
  let xDir = shipVelocity[0] / Util.norm(shipVelocity);
  let yDir = shipVelocity[1] / Util.norm(shipVelocity);
  const info = {
    pos: pos2,
    vel: [xDir * Bullet.SPEED, yDir * Bullet.SPEED],
    radius: Bullet.RADIUS,
    color: Bullet.COLOR
  }
  MovingObject.call(this, info);
}
//ParentClass.prototype.myMethod.call(this);

Util.inherits(Bullet, MovingObject);

module.exports = Bullet;