// return the first n prime numbers.


const isPrime = (num) => {
  for (var i = 2; i < num; i++){
    if (num % i === 0) {
      return false;
    }
  }
  return true;
};

const primes = (n) => {
  const primeNums = [];

  let i = 2;
  while (primeNums.length < n){
    if (isPrime(i)) {
      primeNums.push(i);
    }
    i ++;
  }

  return primeNums;
};

console.log(primes(4));
