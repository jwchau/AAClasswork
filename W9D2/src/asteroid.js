const Util = require('./utils.js');
const MovingObject = require('./moving_object.js');

Asteroid.COLOR = 'grey';
Asteroid.RADIUS = 20;

function Asteroid(pos2 = [0,0]) {
  const info = {
    pos: pos2,
    vel: Util.randomVec(10),
    radius: Asteroid.RADIUS,
    color: Asteroid.COLOR
  }
  MovingObject.call(this, info);
}


//ParentClass.prototype.myMethod.call(this);

Util.inherits(Asteroid, MovingObject);

module.exports = Asteroid;