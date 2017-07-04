Array.prototype.dups = function () {
  const uniqArr = [];
  for (var i = 0; i < this.length; i++) {
    if (!uniqArr.includes(this[i])){
      uniqArr.push(this[i]);
    }
  }

  return uniqArr;
};

console.log([1,1,1,2,2,3,4,4,3,4,5,5,5].dups()); // [1,2,3,4,5]
