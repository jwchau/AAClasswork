function depthFirstSearch(root, targetVal) {

    const stack = [root];
    while (stack.length !== 0) {
        const curr = stack.pop();
        if (curr.val === targetVal) return curr;
        if (curr.right) stack.push(curr.right);
        if (curr.left) stack.push(curr.left);
    }

    return null;
}


module.exports = {
    depthFirstSearch
};