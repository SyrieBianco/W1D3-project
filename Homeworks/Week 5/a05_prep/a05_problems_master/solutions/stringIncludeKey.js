// Write a recursive method that takes in a string to search and a key string.
// Return true if the string contains all of the characters in the key
// in the same order that they appear in the key.



const stringIncludeKey = (string, key) => {
  // this is the base case because we remove letters
  // from the key as we find them (in order) in the string
  if (key.length === 0){
    return true;
  }

  // grab the current first letter, which is the letter we'll be
  // looking for in the string/
  let nextKey = key.slice(0,1);

  // look for that key in the string. (if keyIndex is -1, it wasn't found.)
  let keyIndex = string.indexOf(nextKey);

  if (keyIndex === -1) {
    return false;
  }

  return stringIncludeKey(string.slice(keyIndex+1), key.slice(1));
};


console.log(stringIncludeKey("cadbpc", "abc")); //true
console.log(stringIncludeKey("cba", "abc")); // false
