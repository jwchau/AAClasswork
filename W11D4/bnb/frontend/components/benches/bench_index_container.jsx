import { connect } from 'react-redux';
import { fetchBenches } from '../../actions/bench_actions';
import BenchIndex from './bench_index';

const MSTP = (state, ownProps) => ({
    benches: state.benches
});

const MDTP = dispatch => ({
    fetchBenches: () => dispatch(fetchBenches())
});

export default connect(MSTP, MDTP)(BenchIndex);