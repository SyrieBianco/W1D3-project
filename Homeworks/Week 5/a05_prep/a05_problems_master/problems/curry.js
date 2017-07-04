// Write a method Function.prototype.curry(numArgs). This should return a function that will:
//
// Collect up arguments until there are numArgs of them,
// If there are too few arguments still, it should return itself.
// When there are numArgs arguments, it should call the original function.
// Write a version that uses Function.prototype.apply and another one that uses ... the spread operator.


// using spread
Function.prototype.curry = function (numArgs) {
  const args = [];

  const _curry = (arg) => {
    args.push(arg);
    if (args.length === numArgs){
      return this(...args);
    } else {
      return _curry;
    }
  };
  return _curry;
};

function sumThree(num1, num2, num3) {
  return num1 + num2 + num3;
}
let cur = sumThree.curry(3)(4)(20)(6);
console.log(cur); // 30


// using apply
Function.prototype.curry1 = function(numArgs){

};

function sumThree2(num1, num2, num3) {
  return num1 + num2 + num3;
}
// let cur1 = sumThree2.curry1(3)(4)(20)(6);
// console.log(cur1); // 30
