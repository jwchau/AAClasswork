Function.prototype.myThrottle = function(interval) {
  let tooSoon = false;
  // debugger
  return () => {
    if (!tooSoon) {
      this();
      tooSoon = true;
      setTimeout(() => tooSoon = false, interval);
    }
  };
};

// Using Function#myThrottle, we should be able to throttle
// the #fire function of our neuron so that it can only fire
// once every 500ms:

class Neuron {
  fire() {
    console.log("Firing!");
  }
}

const neuron = new Neuron();

neuron.fire = neuron.fire.myThrottle(500);

const interval = setInterval(() => {
  neuron.fire();
}, 10);

setTimeout(() => clearInterval(interval), 2000);

// // This time, if our Function#myThrottle worked correctly,
// // the Neuron#fire function should only be able to execute
// // every 500ms, even though we're still trying to invoke it
// // every 10ms!

// // If we want this behavior for ALL neurons, we can do the same logic in the constructor:

// class Neuron {
//   constructor() {
//     this.fire = this.fire.myThrottle(500);
//   }

//   fire() {
//     console.log("Firing!");
//   }
// }


