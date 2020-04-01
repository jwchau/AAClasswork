function binarySearch(array, target) {
    if (array.length < 1) return false;
    let m = Math.floor(array.length / 2);
    let mid = array[m];
    
    if (mid < target) {
        return binarySearch(array.slice(m + 1), target);
    } else if (mid > target) {
        return binarySearch(array.slice(0, m), target);
    } else {
        return true;
    }
}

function binarySearchIndex(array, target) {
    if (array.length < 1) return -1;
    let m = Math.floor(array.length / 2);
    let mid = array[m];
    
    if (mid < target) {
        let right = binarySearchIndex(array.slice(m + 1), target);
        return (right === -1) ? -1 : right + 1 + m;
    } else if (mid > target) {
        return binarySearchIndex(array.slice(0, m), target);
    } else {
        return m;
    }
}


module.exports = {
    binarySearch,
    binarySearchIndex
};