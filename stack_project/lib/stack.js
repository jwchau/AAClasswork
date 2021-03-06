// ============================================================================
// Implementation Exercise: Stack
// ============================================================================
//
// -------
// Prompt:
// -------
//
// Implement a Stack and all of its methods below!
//
// ------------
// Constraints:
// ------------
//
// Make sure the time and space complexity of each is equivalent to those 
// in the table provided in the Time and Space Complexity Analysis section
// of your Stack reading!
//
// -----------
// Let's Code!
// -----------

class Node {
  constructor(val) {
    this.value = val;
    this.next = null;
  }
}

class Stack {
  constructor() {
    this.top = null;
    this.bottom = null;
    this.length = 0;
  }

  push(val) {
    const node = new Node(val);

    if (this.top) node.next = this.top;
    this.top = node;
    if (!this.bottom) this.bottom = node;

    this.length++;
    return this.length;
  }

  pop() {
    if (!this.top) return null;
    let temp = this.top;
    this.top = this.top.next;
    this.length--;
    if (this.length === 0) {
      this.top = null;
      this.bottom = null;
    }
    return temp.value;
  }

  size() {
    return this.length;
  }

}

exports.Node = Node;
exports.Stack = Stack;
