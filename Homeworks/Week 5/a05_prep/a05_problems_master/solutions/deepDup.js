// Recursive
const deepDup = (arr) => {
  var dooped = arr.map(function(el) {
    if (el instanceof Array) {
      return deepDup(el);
    } else {
      return el;
    }
  });
  return dooped;
};


 console.log(deepDup([1,2,[3], 5, 6, [7,6]]));

// sexy version
const deepDup1 = (arr) => {
  return arr.map(el => el instanceof Array ? deepDup(el) : el);
};
console.log(deepDup1([1,2,[3], 5, 6, [7,6]]));


// Cheater Method.
//wouldn't work if spec required recursive call.
var array = [1,2,[3], 5, 6, [7,6]];
var copy = JSON.parse(JSON.stringify(array));
//console.log(copy);
