const Game = require('./game.js');
const key = require('./keymaster.js');
const Bullet = require('./bullet.js');

function GameView(ctx) {
  this.game = new Game();
  this.ctx = ctx
}

GameView.prototype.start = function() {
  // debugger
  this.bindKeyHandlers();
  this.game.addAsteroids();
  const that = this
  // that.ctx.translate(500, 500);
  setInterval(function() {
    
    that.game.step();
    that.game.render(that.ctx);
  }, 20);
}

GameView.prototype.bindKeyHandlers = function() {
  let that = this;
  let sheep = this.game.ship;
  key('a', function () { sheep.power([-1, 0]) });
  key('w', function () { sheep.power([0, -1]) });
  key('d', function () { sheep.power([1, 0]) });
  key('s', function () { sheep.power([0, 1]) });
  key('=', function () { debugger });
  key('z', function () { 
    this.game.rotation += 0.01;
  });
  key('space', function () {
    that.game.bullets.push(new Bullet([...sheep.pos], sheep.vel))
  });
}

module.exports = GameView;