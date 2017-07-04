// Write a curriedSum function that takes an integer (how many numbers
// to sum) and returns a function that can be successively called with
// single arguments until it finally returns a sum. That is:

function curriedSum(numArgs) {
  const numbers = [];

  function _curriedSum(num) {
    numbers.push(num);

    if (numbers.length === numArgs) {
      let total = 0;

      numbers.forEach((n) => { total += n; });

      return total;
    } else {
      return _curriedSum;
    }
  }

  return _curriedSum;
}


const sum = curriedSum(4);
console.log(sum(5)(30)(20)(1)); // => 56
