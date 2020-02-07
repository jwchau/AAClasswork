let Piece = require("./piece");

/**
 * Returns a 2D array (8 by 8) with two black pieces at [3, 4] and [4, 3]
 * and two white pieces at [3, 3] and [4, 4]
 */
function _makeGrid () {
  let grid = [];
  for (let i = 0; i < 8; i++) {
    let row = [];
    for (let j = 0; j < 8; j++) {
        row.push(undefined);
    }
    grid.push(row);
  }
  grid[3][4] = new Piece("black");
  grid[4][3] = new Piece("black");
  grid[3][3] = new Piece("white");
  grid[4][4] = new Piece("white");

  return grid;
}
// _makeGrid();
// debugger;
/**
 * Constructs a Board with a starting grid set up.
 */
function Board () {
  
  this.grid = _makeGrid();
}

Board.DIRS = [
  [ 0,  1], [ 1,  1], [ 1,  0],
  [ 1, -1], [ 0, -1], [-1, -1],
  [-1,  0], [-1,  1]
];

/**
 * Returns the piece at a given [x, y] position,
 * throwing an Error if the position is invalid.
 */
Board.prototype.getPiece = function (pos) {
  if (this.isValidPos(pos)) {
    return this.grid[pos[0]][pos[1]];
  } else {
    throw new Error(); 
  }
};


/**
 * Checks if there are any valid moves for the given color.
 */
Board.prototype.hasMove = function (color) {
};

/**
 * Checks if the piece at a given position
 * matches a given color.
 */
Board.prototype.isMine = function (pos, color) {
  if (this.isOccupied(pos) && this.getPiece(pos).color === color) {
    return true;
  }
  return false;
};

/**
 * Checks if a given position has a piece on it.
 */
Board.prototype.isOccupied = function (pos) {
  return !!(this.getPiece(pos));
};

/**
 * Checks if both the white player and
 * the black player are out of moves.
 */
Board.prototype.isOver = function () {
};

/**
 * Checks if a given position is on the Board.
 */
Board.prototype.isValidPos = function (pos) {
  let range = [0, 1, 2, 3, 4, 5, 6, 7];
  if (range.includes(pos[0]) && range.includes(pos[1])) {
    return true; 
  } else {
    return false;
  }
};


/**
 * Recursively follows a direction away from a starting position, adding each
 * piece of the opposite color until hitting another piece of the current color.
 * It then returns an array of all pieces between the starting position and
 * ending position.
 *
 * Returns null if it reaches the end of the board before finding another piece
 * of the same color.
 *
 * Returns null if it hits an empty position.
 *
 * Returns null if no pieces of the opposite color are found.
 */
function _positionsToFlip (board, pos, color, dir, piecesToFlip) {
  let dx = dir[0];
  let dy = dir[1];

  const newpos = [pos[0] + dx, pos[1] + dy];
  debugger;

  if (!board.isValidPos(newpos)) {
    return null;
  }

  if (!board.isOccupied(newpos)) {
    return null;
  }

  if (board.isMine(newpos, color)) {
    if (piecesToFlip.length === 0) {
      return null;
    } else {
      return piecesToFlip;
    }
  }
  piecesToFlip.push(newpos);
  return _positionsToFlip(board, newpos, color, dir, piecesToFlip);
}

// let b = new Board();
// let arr = [];
// _positionsToFlip(b, [3,3], 'white', [0, 1], arr);


/**
 * Adds a new piece of the given color to the given position, flipping the
 * color of any pieces that are eligible for flipping.
 *
 * Throws an error if the position represents an invalid move.
 */
Board.prototype.placePiece = function (pos, color) {
  if (this.validMove(pos, color)) {
    
    for (dir of Board.DIRS) {
    const flips = _positionsToFlip(this, pos, color, dir, []);
      if (flips) {
        flips.forEach(position => {
          debugger;
        this.getPiece(position).flip();
        });
      }
    }
  } else {
    throw new Error();
  }
};
let b = new Board();
b.placePiece([5,3], "white");
/**
 * Prints a string representation of the Board to the console.
 */
Board.prototype.print = function () {
};

/**
 * Checks that a position is not already occupied and that the color
 * taking the position will result in some pieces of the opposite
 * color being flipped.
 */
Board.prototype.validMove = function (pos, color) {

  if (!this.isOccupied(pos)) {
    for (dir of Board.DIRS) {
      const flips = _positionsToFlip(this, pos, color, dir, []);
      if (flips) {
        return true;
      }
    }
  }
  return false;

};
// const b = new Board();

// b.validMove([5,3], 'white'); //false
// debugger;

// b.validMove([0,0], 'white'); //false
// debugger;

/**
 * Produces an array of all valid positions on
 * the Board for a given color.
 */
Board.prototype.validMoves = function (color) {
};


module.exports = Board;


