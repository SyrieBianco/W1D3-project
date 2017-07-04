// Takes a multi-dimentional array and returns a single array of all the elements
// myFlatten uses loops, ControlledFlatten uses forEach.



Array.prototype.myFlatten = function() {
  let flat = [];
  // console.log(this);
  for (var i = 0; i < this.length; i++) {
    if (this[i] instanceof Array) {
      flat = flat.concat(this[i].myFlatten());
    } else {
      flat.push(this[i]);
    }
  }
  // console.log(flat);
  return flat;

};

const test = [1,[2,3], [4,[5]]].myFlatten(); // [1,2,3,4,5]
console.log(test);



// Write a version of flatten that only flattens n levels of an array.
// E.g. If you have an array with 3 levels of nested arrays, and run
// my_flatten(1), you should return an array with 2 levels of nested
// arrays

Array.prototype.myControlledFlatten = function(n) {
  let flat = [];
  this.forEach(function(ele){
    if (ele instanceof Array && ele.length > 1) {
      flat = flat.concat(ele.myControlledFlatten(n-1));
    } else {
      flat.push(ele);
    }
  });
  return flat;
};


const tester = [1,[2,3], [4,[5]]].myControlledFlatten(1); // [1,2,3,4,[5]]
console.log(tester);
