const Asteroid = require('./asteroid.js');
const Ship = require('./ship.js')
// Game.DIM_X = window.innerWidth;
// Game.DIM_Y = window.innerHeight;
Game.DIM_X = 1000;
Game.DIM_Y = 1000;
Game.NUM_ASTEROIDS = 20;

function Game() {
  this.width = Game.DIM_X;
  this.height = Game.DIM_Y;
  this.asteroids = [];
  this.ship = new Ship();
  this.bullets = [];
  this.rotation = 0;
}

Game.prototype.addAsteroids = function() {
  for (let i = 0; i < Game.NUM_ASTEROIDS; i++) {
    const x = Math.random() * this.width;
    const y = Math.random() * this.height;
    this.asteroids.push(new Asteroid([x, y]));
  }
}


Game.prototype.render = function(ctx) {
  ctx.fillStyle = `rgb(0, 0, 0, 0.33)`;
  ctx.fillRect(-this.width, -this.height,
      this.width * 2, this.height * 2);

  // ctx.rotate(this.rotation);

  for ( let i = 0; i < this.asteroids.length; i++) {
    this.asteroids[i].draw(ctx);
  }
  for (let i = 0; i < this.bullets.length; i++) {
    this.bullets[i].draw(ctx);
  }
  // debugger
  this.ship.draw(ctx);
}

Game.prototype.moveObjects = function() {
  this.ship.move();
  for (let i = 0; i < this.asteroids.length; i++) {
    this.asteroids[i].move();
  }
  for (let i = 0; i < this.bullets.length; i++) {
    this.bullets[i].move();
  }
}

Game.prototype.checkCollisions = function() {
  for (let i = 0; i < this.asteroids.length; i++) {
    for (let j = i + 1; j < this.asteroids.length; j++) {
      let ast1 = this.asteroids[i];
      let ast2 = this.asteroids[j];
      if (ast1.isCollidedWith(ast2)) {
        this.remove(i);
        this.remove(j - 1);
        if (this.asteroids.length <= 2) this.addAsteroids();
      }  
    }
  }

}

Game.prototype.remove = function(asteroid_idx) {
  this.asteroids.splice(asteroid_idx, 1);
}

Game.prototype.step = function() {
  this.moveObjects();
  this.checkCollisions();
}

module.exports = Game;

