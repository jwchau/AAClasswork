function breadthFirstArray(root) {
    // if (!root) return [];

    // const left = breadthFirstArray(root.left);
    // const right = breadthFirstArray(root.right);
    // return [root.val, ...left, ...right];

    const queue = [root];
    const res = [];

    while (queue.length) {
        const curr = queue.pop();
        res.push(curr.val);
        if (curr.left) queue.unshift(curr.left);
        if (curr.right) queue.unshift(curr.right);
    }

    return res;

}

module.exports = {
    breadthFirstArray
};