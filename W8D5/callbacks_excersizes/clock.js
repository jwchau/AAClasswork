class Clock {
  constructor() {
    // 1. Create a Date object.
    let date = new Date();

    // 2. Store the hours, minutes, and seconds.
    this.hours = date.getHours();
    this.minutes = date.getMinutes();
    this.seconds = date.getSeconds();

    // 3. Call printTime.
    this.printTime();

    // 4. Schedule the tick at 1 second intervals.
    let that = this;
    // debugger
    setInterval(() => this._tick.call(this), 1000);
  }

  printTime() {
    let {hours:HH, minutes:MM, seconds:SS} = this;
    console.log(`${HH}:${MM}:${SS}`);
  }

  _tick() {
    // 1. Increment the time by one second.
    this.seconds++;
    // 2. Call printTime.
    // debugger
    this.printTime();
  }
}


const clock = new Clock();
// .load callbacks.js