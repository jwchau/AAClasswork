class SearchBar {
  constructor() {
    this.query = "";

    this.type = this.type.bind(this);
    this.search = this.search.bind(this);
  }

  type(letter) {
    this.query += letter;
    this.search();
  }

  search() {
    console.log(`searching for ${this.query}`);
  }
}

// Function.prototype.myDebounce = function(interval) {
//   return () => {
//     let bounce = true;
//     this();
//     if (bounce) {
//       bounce = false;
//       setTimeout(() => bounce = true, interval);
//     }
//   };
// };

Function.prototype.myDebounce = function (interval) {
  return () => {
    // this();
    const bounceDown = setTimeout(this, interval);
    //if time elapsed after this() === interval, call this();
  };
};

const searchBar = new SearchBar();

searchBar.search = searchBar.search.myDebounce(500);

const queryForHelloWorld = () => {
  searchBar.type("h");
  searchBar.type("e");
  searchBar.type("l");
  searchBar.type("l");
  searchBar.type("o");
  searchBar.type(" ");
  searchBar.type("w");
  searchBar.type("o");
  searchBar.type("r");
  searchBar.type("l");
  searchBar.type("d");
};
queryForHelloWorld();