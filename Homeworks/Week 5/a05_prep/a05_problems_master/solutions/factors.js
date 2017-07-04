const factors = (num) => {
  const results = [];
  for (var i = 0; i <= num; i++) {
    if (num % i === 0){
      results.push(i);
    }
  }
  return results;
};

console.log(factors(10));
