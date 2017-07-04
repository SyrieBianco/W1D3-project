//Hint: quicksort checks by pivoting!


Array.prototype.quickSort = function () {
  if (this.length < 2) {
    return this;
  }
  let pivot = this[0];
  let left = [];
  let right = [];
  for (var i = 1; i < this.length; i++) {
    if (this[i] < pivot) {
      left.push(this[i]);
    } else {
      right.push(this[i]);
    }
  }

  return left.quickSort().concat(pivot, right.quickSort());
};

// this call back is essentially the prc we would pass in ruby.


const test = [7,3,5,2,8,7,1,9,3,4,].quickSort();
console.log(test);
