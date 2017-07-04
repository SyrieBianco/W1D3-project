Array.prototype.myForEach = function(cb) {
  for (var i = 0; i < this.length; i++) {
    cb(this[i]);
  }
  return;
};

console.log([1,2,3,4].myForEach(function(el){
  console.log(el + 1);
}));
