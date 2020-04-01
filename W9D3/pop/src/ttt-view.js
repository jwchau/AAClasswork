class View {
  constructor(game, $el) {
    this.game = game;
    this.$el = $el;
    this.setupBoard();
  }

  bindEvents() {
    $('ul').on('click', (e) => {
      let $li = $(e.target);
      // console.log($li.data('pos'));
      

      this.game.playMove($li.data('pos'));
      if (this.game.isOver()) {
        if (this.game.winner()) {
          alert(`${this.game.winner()} has won!`)
        } else {
          alert('NO ONE WINS!');
        }
      };
      this.makeMove($li);

      

    });
  }

  makeMove($square) {
    $square.addClass(`${this.game.currentPlayer}`)
    $square.append(`${this.game.currentPlayer}`)
    // $square.html(`${this.game.currentPlayer}`)
  }

  setupBoard() {
    // alert("setting up board");
    let figure = this.$el;
    figure.append("<ul></ul>");
    let $ul = $('ul');
    $ul.addClass('grid');
    for (let i = 0; i < 3; i++) {
      for (let j = 0; j < 3; j++) {
        let $cell = $("<li class='cell'>");
        $cell.data('pos', [i, j]);
        $ul.append($cell);
      }
    }
  }
}


module.exports = View;
