// Write a String#symmetric_substrings method that returns an array of substrings
// that are palindromes, e.g. "cool". symetricSubstrings => ["oo"]
// Only include substrings of length > 1.



// I'm sure theres a much more elegant way to write this.
String.prototype.symetricSubstrings = function () {
  const subs = [];
  const arr = this.split("");
  for (var i = 0; i < this.length; i++) {
    for (var j = i+1; j < this.length; j++) {
      let subArr = arr.slice(i,j);
      let rev = Array.from(subArr);
      if (subArr.toString() === rev.reverse().toString()){
        subs.push(subArr.join(""));
      }
    }
  }
  return subs.filter(function(el){
    return el.length > 1;
  });
};

console.log("cool".symetricSubstrings()); // ['oo']
