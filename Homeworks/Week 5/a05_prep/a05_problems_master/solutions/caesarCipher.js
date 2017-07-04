const caesarCipher = (str, shift) => {
  const alpha = "abcdefghijklmnopqrstuvwxyz".split("");

  var ciphered = [];
  for (var i = 0; i < str.length; i++) {
   if (str[i] === " ") {
     ciphered.push(" ");
     continue;
   }
   let oldIdx = alpha.indexOf(str[i]);
   let newIdx = (oldIdx + shift) % alpha.length;

   ciphered.push(alpha[newIdx]);
  }
  return ciphered.join("");
};

console.log(caesarCipher("aaa", 1)); // bbb
console.log(caesarCipher("abc xyz", 3)); // def abc
console.log(caesarCipher("the bear", 3)); // wkh ehdu
