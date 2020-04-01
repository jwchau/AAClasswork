import React from 'react';

class Tile extends React.Component {
    
    constructor(props) {
        super(props);
        // this.state = { tile: props.obj, updateGame: props.update }
        this.handleClick = this.handleClick.bind(this);
    }

    render() {
        let { explored, bombed, flagged } = this.props.obj;
        let result = " ";
        let type = "";

        if (bombed) {
            result = '\uD83D\uDCA3';
            type = "bomb";
        } else if (explored) {
            let count = this.props.obj.adjacentBombCount();
            if (count === 0) result = " ";
            else result = `${count}`;
            type = `explore num${count}`;
        }

        if (!explored) {
            type = 'unexplore';
            result = " ";
        }

        if (flagged) {
            result = "\u2691";
            type = "unexplore flag";
        }
        
        return(
            <div onClick={this.handleClick} className={"tile" + " " + type}>
                {result}
            </div>
        );
    }

    handleClick(e) {
        // let isMarked = this.state.tile.explored || this.state.tile.flagged;
        if (e.altKey) {
            this.props.update(this.props.obj, true);
        } else {
            this.props.update(this.props.obj, false); 
        }
    }


};

export default Tile;