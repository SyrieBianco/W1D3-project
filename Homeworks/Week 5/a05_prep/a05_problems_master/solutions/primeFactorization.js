// Write a recursive function that returns the prime factorization of
// a given number. Assume num > 1

const primeFactorization = (num) => {
  if (num === 1) {
    return [];
  }

  for (var i = 2; i <= num; i++) {
    if (num % i === 0) {
      return [i].concat(primeFactorization(num/i));
    }
  }

  return [num];
};


console.log(primeFactorization(12)); // [2,2,3]
