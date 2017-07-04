Array.prototype.myReverse = function () {
  const result = [];
  while (this.length > 0) {
    result.push(this.pop());
  }

  return result;
};

console.log([1,2,3,4].myReverse());
