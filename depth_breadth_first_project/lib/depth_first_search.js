function depthFirstSearch(root, targetVal) {

    const queue = [root];
    while (queue.length !== 0) {
        const curr = queue.pop();
        if (curr.val === targetVal) return curr;
        queue.unshift(curr.left);
        queue.
    }

    return null;
}


module.exports = {
    depthFirstSearch
};