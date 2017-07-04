// Monkey patch the Array class and add a myInject method.
// In the JS exercises, you are required to use myForEach.
// So make sure you can write this for forEach opposed to a for loop!

Array.prototype.myInject = function (cb) {

};


//tester callback
let test = [1,2,3,4].myInject(function(a,b){
  return a + b;
});
console.log(test);
