// in Javascript Array.some is essesntially Ruby's Array.any

Array.prototype.mySome = function (cb) {

};

// Tester Callback
function isBigEnough(num) {
  return num >= 10;
}

const test = [11, 2, 3].mySome(isBigEnough);
const test2 = [1,2,3].mySome(isBigEnough);

console.log(test);
console.log(test2);
