Array.prototype.myReject = function (cb) {

};

//tester callback
function lessThan10(num){
  return num < 10;
}

console.log([1,2,3,4,12,13,14].myReject(lessThan10));
