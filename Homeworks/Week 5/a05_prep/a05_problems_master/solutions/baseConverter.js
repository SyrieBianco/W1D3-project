// Write a recursive method that takes in a base 10 number n and
// converts it to a base b number. Return the new number as a string
//
// E.g. base_converter(5, 2) == "101"
// base_converter(31, 16) == "1f"

function baseConverter(n, b) {
  // NB: base converter always returns a string!
  if (n === 0) {
    return "";
  }
  const digits = "0123456789abcdef".split("");

  return baseConverter(Math.floor(n/b), b) + digits[n % b];
}

console.log(baseConverter(31, 16)); //
console.log(baseConverter(5, 2)); //
