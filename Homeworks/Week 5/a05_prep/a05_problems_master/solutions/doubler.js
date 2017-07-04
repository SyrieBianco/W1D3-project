const doubler = (array) => {
  let doubled = array.map((el) => el * 2);
  return doubled;
};

console.log(doubler([1,2,3])); // [2,4,6]
