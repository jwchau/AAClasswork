import React from 'react';
import Tile from './tile.jsx';
import { render } from 'react-dom';

class Board extends React.Component {
    constructor(props) {
        super(props);
        // this.state = {
        //     board: props.board,
        //     update: props.update
        // }
    }
    
    componentDidUpdate(prevProps) {
        
        if (this.props.board.grid[0][0].explored !== prevProps.board.grid[0][0].explored) {
           console.log("it different") 
            this.setState({});
        }
    }

    render() {
        let rows = this.props.board.grid.map( (row, y) => {
            let singleRow = row.map( (item, x) => { 
                return (
                <Tile
                    key={[x, y]}
                    position={[x, y]}
                    obj={item}
                    update={this.props.update}
                />);
            });
            return (
                <div className="row" key={y}>
                    {singleRow}
                </div>
            );
        });

        return (
            <div className="board">
                {rows}
            </div > 
        );
    }    
};

export default Board;