import React from "react";
import BenchIndexItem from './bench_index_item';

class BenchIndex extends React.Component {
    componentDidMount() {
        // request benches from your API here
    }


    //START HERE IOANSDFOAINSDFOANISDOFIN
    render() {
        let { benches } = Object.values(this.props.benches);
        benches = benches.map(bench =>  <BenchIndexItem /> );
    }
}

export default BenchIndex;