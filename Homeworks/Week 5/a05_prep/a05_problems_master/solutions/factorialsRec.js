// Write a recursive method that returns the first "num" factorial numbers.
// Note that the 1st factorial number is 0!, which equals 1. The 2nd factorial
// is 1!, the 3rd factorial is 2!, etc.




const factorialsRec = (num) => {
  if (num === 1) {
    return [1];
  } else {
    let facs = factorialsRec(num-1);
    facs.push((facs.slice(-1)) * (num - 1));
    return facs;
  }
};

console.log(factorialsRec(5)); // [1,1,2,6,24]
