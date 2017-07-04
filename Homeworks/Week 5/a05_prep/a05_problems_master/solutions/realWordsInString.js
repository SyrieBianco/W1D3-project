// Returns an array of all the subwords of the string that appear in the
// dictionary argument. The method does NOT return any duplicates.

String.prototype.realWords = function (dictionary) {
  const words = [];
  for (var i = 0; i < this.length; i++) {
    for (var j = 1; j < this.length; j++) {
      if (dictionary.includes(this.slice(i,j+1))) {
        words.push(this.slice(i,j+1));
      }
    }
  }
  return words;
};

console.log("asdfcatqwer".realWords(["cat", "car"])); // ['cat']
