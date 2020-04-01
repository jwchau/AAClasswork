const readline = require('readline');

const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

const absurdBubbleSort = function(arr, sortCompletionCallback) {
  const outerBubbleSortLoop = function(madeAnySwaps) {
    if (madeAnySwaps) {
      innerBubbleSortLoop(arr, 0, false, outerBubbleSortLoop);
    } else {
      sortCompletionCallback(arr);
      reader.close();
    }
  };
  outerBubbleSortLoop(true);
};

const innerBubbleSortLoop = function(arr, i, madeAnySwaps, outerBubbleSortLoop) {
  if (i < arr.length - 1) {
    askIfGreaterThan(arr[i], arr[i + 1], (isGreaterThan) => {
      if (isGreaterThan) {
        [arr[i], arr[i + 1]] = [arr[i + 1], arr[i]];
        madeAnySwaps = true;
      }
      innerBubbleSortLoop(arr, i + 1, madeAnySwaps, outerBubbleSortLoop);
    });
  }
  if (i == (arr.length - 1)) outerBubbleSortLoop(madeAnySwaps);
}

const askIfGreaterThan = function(el1, el2, callback) {
  reader.question(`${el1} greater than ${el2}?\n`, (res) => {
    if (res === "yes") {
      callback(true);
      // reader.close();
    }
    else if (res === "no") {
      callback(false);
      // reader.close();
    }
    else {
      askIfGreaterThan(el1, el2, callback);
    } 
  });
};

//.load bubblesort.js
// askIfGreaterThan(1, 2, (el) => console.log(el));


// innerBubbleSortLoop(arr, 0, false, (el) => {
  //   reader.close();
  //   console.log(arr);
  // });

const logMe = function(el) {
  console.log(el);
};
  
const arr = [1,2,3,4];

// absurdBubbleSort(arr, logMe); 
