function treeHeight(root) {
    if (!root) return -1;
    let total = 0;

    if (root.left) {
        total = Math.max(total, 1 + treeHeight(root.left));
    }

    if (root.right) {
        total = Math.max(total, 1 + treeHeight(root.right));
    }

    return total;
}


module.exports = {
    treeHeight
};