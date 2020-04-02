function treeSum(root) {
    if (!root) return 0;
    let total = root.val;

    if (root.left) {
        const leftVal = treeSum(root.left);
        total += leftVal;
    }

    if (root.right) {
        const rightVal = treeSum(root.right);
        total += rightVal;
    }

    return total;
}


module.exports = {
    treeSum
};