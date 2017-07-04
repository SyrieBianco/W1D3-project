Array.prototype.bubbleSort = function() {

  let sorted = false;
  while (sorted === false) {
    sorted = true;

    for (var i = 0; i < this.length; i++) {
      // is there a more elegant way to do this swapping in JS?
      let first = this[i];
      let second = this[i+1];
      if (first > second){
        this[i] = second;
        this[i+1] = first;
        sorted = false;
      }
    }
  }
  return this;
};

// console.log([1,6,3,8,6,5,10].bubbleSort()); // [1,3,5,6,6,8.10]
