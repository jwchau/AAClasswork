import * as BenchAPI from '../util/bench_api_util';

export const RECEIVE_BENCHES = "RECEIVE_BENCHES";

export const receiveBenches = benches => ({
    type: RECEIVE_BENCHES,
    benches
});

export const fetchBenches = () => dispatch => (
    BenchAPI.fetchBenches()
        .then(resp => dispatch(receiveBenches(resp)))
);