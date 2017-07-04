// Implement a method that finds the sum of the first n
// fibonacci numbers recursively. Assume n > 0

const fibSum = (num) => {
  // two base cases necessary because you have to know
  // the first two fib nums to solve any fib problems (0 and 1)
  if (num === 0) {
    return 0;
  } else if (num === 1) {
    return 1;
  }

  return fibSum(num-1) + fibSum(num-2) + 1;


};
console.log(fibSum(4));
