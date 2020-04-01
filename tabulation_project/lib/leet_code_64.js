// Work through this problem on https://leetcode.com/problems/minimum-path-sum/ and use the specs given there.
// Feel free to use this file for scratch work.

var minPathSum = function(grid) {
  
  return 5;
};
  
  
function createTable(m, n, val) {
  const arr = new Array(m);
  for (let i = 0; i < m; i++) arr[i] = new Array(n).fill(val);
  return arr;
}

const input = [
  [1,2,5],
  [3,2,1]
];

console.log(minPathSum(input));