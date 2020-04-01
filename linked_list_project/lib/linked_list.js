// ============================================================================
// Implementation Exercise: Singly Linked List
// ============================================================================
//
// -------
// Prompt:
// -------
//
// Implement a Singly Linked List and all of its methods below!
//
// ------------
// Constraints:
// ------------
//
// Make sure the time and space complexity of each is equivalent to those 
// in the table provided in the Time and Space Complexity Analysis section
// of your Linked List reading!
//
// -----------
// Let's Code!
// -----------

// TODO: Implement a Linked List Node class here
class Node {
    constructor(val) {
        this.value = val;
        this.next = null;
    }

}

// TODO: Implement a Singly Linked List class here
class LinkedList {
    constructor() {
        this.head = null;
        this.tail = null;
        this.length = 0;
    }

    // TODO: Implement the addToTail method here
    addToTail(val) {
        const node = new Node(val);
        
        if (!this.head) {
            this.head = node;
        } else {
            this.tail.next = node;
        }

        this.tail = node;
        this.length++;
        return this;
    }

    // TODO: Implement the removeTail method here
    removeTail() {
        this.tail = null;
        this.length--;
    }

    // TODO: Implement the addToHead method here
    addToHead(val) {
        const node = new Node(val);

        this.length++;
    }

    // TODO: Implement the removeHead method here
    removeHead() {
        this.head = null;
        this.length--;
    }

    // TODO: Implement the contains method here
    contains(target) {
        let curr = this.head;
        
        while (curr !== undefined) {
            if (curr.value === target) return true;
            curr = curr.next;
        }

        return false;
    }

    // TODO: Implement the get method here
    get(index) {

    }

    // TODO: Implement the set method here
    set(index, val) {

    }

    // TODO: Implement the insert method here
    insert(index, val) {
        let curr = this.head;
        let count = 0;
        while (count < index && curr.next != undefined) {
            curr = curr.next;
            count++;
        }
        let temp = curr.next;
        curr.next = new Node(val);
        curr.next.next = temp;

        this.length++;
    }

    // TODO: Implement the remove method here
    remove(index) {
        let curr = this.head;
        let count = 0;
        while (count < index - 1 && curr != undefined) {
            curr = curr.next;
            count++;
        }
        curr.next = curr.next.next;
        this.length--;
    }

    // TODO: Implement the size method here
    size() {
        return this.length;
    }
}

exports.Node = Node;
exports.LinkedList = LinkedList;
