//return the sum of the first n even numbers recursively. Assume n > 0

function firstEvenNumbersSum(n) {
  // Since n is > 0, that means the base case is 1, and
  // the first even number is 2.
  if (n === 1) {
    return 2;
  }

  return firstEvenNumbersSum(n-1) + n * 2;


}

console.log(firstEvenNumbersSum(3)); //12
