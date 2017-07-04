// in JAvascript Array.every is essesntially Ruby's Array.all

Array.prototype.myEvery = function (cb) {
  for (var i = 0; i < this.length; i++) {
    if (!cb(this[i])) {
      return false;
    }
  }
  return true;
};


// Tester Callback
function isBigEnough(num) {
  return num >= 10;
}

const test = [11,12,13].myEvery(isBigEnough);
const test2 = [11,12,13, 9].myEvery(isBigEnough);

console.log(test);
console.log(test2);
