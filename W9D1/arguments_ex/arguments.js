// function sum(...args) {
//   //arguments
//   let total = 0;
//   for (let i = 0; i < args.length; i++) {
//     total += args[i];
//   }
//   return total;
// }

// console.log(sum(1, 2, 3, 4));
// console.log(sum(1, 2, 3, 4, 5));


class Cat {
  constructor(name) {
    this.name = name;
  }

  says(sound, person) {
    console.log(`${this.name} says ${sound} to ${person}!`);
    return true;
  }
}

class Dog {
  constructor(name) {
    this.name = name;
  }
}

// const markov = new Cat("Markov");
// const pavlov = new Dog("Pavlov");

// markov.says("meow", "Ned");
// // Markov says meow to Ned!
// // true
// Function.prototype.myBind = function(ctx, ...args) {
//   let that = this;
//   // debugger
//   return function(...names) {
//     return that.call(ctx, ...args.concat(names));
//   };
// };

// bind time args are "meow" and "Kush", no call time args
// markov.says.myBind(pavlov, "meow", "Kush")();
// // Pavlov says meow to Kush!
// // true

// // no bind time args (other than context), call time args are "meow" and "a tree"
// markov.says.myBind(pavlov)("meow", "a tree");
// // Pavlov says meow to a tree!
// // true

// // bind time arg is "meow", call time arg is "Markov"
// markov.says.myBind(pavlov, "meow")("Markov");
// Pavlov says meow to Markov!
// true

// no bind time args (other than context), call time args are "meow" and "me"
// const notMarkovSays = markov.says.myBind(pavlov);
// notMarkovSays("meow", "me");
// Pavlov says meow to me!
// true


// ctx_pav = markov.says.myBind(pavlov, "oians");
// ctx_pav();
// ctx_pav('HSOIDNFSDF', "sokdnf", "osdnf"); //pavlov says undefined to undefined


// function sumThree(num1, num2, num3) {
//   return num1 + num2 + num3;
// }

// sumThree(4, 20, 6); // == 30

// // you'll write `Function#curry`!

// Function.prototype.curry = function(...numArgs) {
//   let args = [];
//   let sum = 0;
//   sumCurry = function(num) {
//     args = args.concat(numArgs);
//     if (args.length -1 === args[0]) {
//       return args.reduce((a, b) => a + b, 0);
//     } else {
//       return sumCurry;
//     }
//   };
//   return sumCurry;
// };

// let f1 = sumThree.curry(3); // tells `f1` to wait until 3 arguments are given before running `sumThree`
// // debugger
// f1 = f1(4); // [Function]
// f1 = f1(20); // [Function]
// f1 = f1(6); // = 30

// // or more briefly:
// sumThree.curry(3)(4)(20)(6); // == 30
// // console.log(sumThree.curry(3)(4)(20)(6)); // == 30

// console.log(f1(300));


// const curriedSum = function(numArgs) {
//   const numbers = [];

//   const _curriedSum = function(num) {
//     if (numbers.length === numArgs) {
//       let sum = 0;
//       for (let i = 0; i < numbers.length; i++) {
//         sum += numbers[i];
//       }
//       return sum;
//     } else {
//       numbers.push(num);
//       return _curriedSum;
//     }
//   };

//   return _curriedSum;
// };


// const curried = curriedSum(4);
// const t = curried(5)(30)(20)(1); // => 56
// console.log(t());


// const curry = function(n) {

// }

Function.prototype.myBind = function(ctx, ...args) {
  let that = this;
  let words = Array.from(args);
  return function(...otherWords) {
    that.call(ctx, ...words, ...otherWords);
  };
};

const markov = new Cat("Markov");
const pavlov = new Dog("Pavlov");

let dog = markov.says.myBind(pavlov, 'hello');

dog('screuffy', 'helele');
