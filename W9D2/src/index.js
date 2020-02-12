const MovingObject = require('./moving_object.js');
const Asteroid = require('./asteroid.js');
const Game = require('./game.js');
const GameView = require('./game_view.js');

console.log("Webpack is working!");

window.MovingObject = MovingObject;

window.addEventListener('DOMContentLoaded', (event) => {
  console.log('DOM fully loaded and parsed');
  const canvas = document.getElementById('game-canvas');
  const ctx = canvas.getContext("2d");
  window.view = new GameView(ctx)
  window.view.start()
});

