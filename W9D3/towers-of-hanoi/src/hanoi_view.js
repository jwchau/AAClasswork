function View(game, $el) {
    this.game = game;
    this.$el = $el;
    this.setupTowers();
    this.render();
}

View.prototype.setupTowers = function() {
    for (let i = 0; i < 3; i++) {
        this.$el.append('<ul>');
    }
    for (let i = 0; i < 3; i++) {
        $disc = $('<li>')
        $disc.addClass("disc")
        $disc.attr('id', i)
        $('ul').first().append($disc);
    }

    $('ul').addClass("pile")
    
}

View.prototype.render = function() {

}

View.prototype.clickTower = function() {

}

module.exports = View;
