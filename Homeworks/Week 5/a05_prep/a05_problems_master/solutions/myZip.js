Array.prototype.myZip = function (...arrays) {
  let zipped = [];
  for (let i = 0; i < this.length; i++) {
    zipped.push([this[i]]);
    for (let j = 0; j < this.length-1; j++) {
      zipped[i].push(arrays[j][i]);
    }
  }
  return zipped;
};

console.log([1,2,3].myZip([4,5,6],[7,8,9])); // [[1,4,7], [2,5,8], [3,6,9]]
console.log([4,5,6].myZip([1,2], [8])); // [[4,1,8], [5,2, undefined], [6, undefined, undefined]]
