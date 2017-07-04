// Jumble sort takes a string and an alphabet. It returns a copy of the string
// with the letters re-ordered according to their positions in the alphabet. If
// no alphabet is passed in, it defaults to normal alphabetical order (a-z).
//
// Example:
// jumbleSort("hello") => "ehllo"
// jumbleSort("hello", ['o', 'l', 'h', 'e'])  // 'ollhe'

// Short version:
const jumbleSort = (str, alpha = 'abcdefghijklmnopqrstuvwxyz') => {
  return str.split("").sort((a,b) => alpha.indexOf(a) - alpha.indexOf(b)).join("");
};



// BubbleSort Version

// const jumbleSort2 = (str, alphabet = "abcdefghijklmnopqrstuvwxyz") => {
//   let letters = str.split("");
//   let sorted = false;
//   while (sorted === false) {
//     sorted = true;
//
//     for (var i = 0; i < letters.length; i++) {
//       if (i === letters.length - 1){
//         break;
//       }
//       let first = letters[i];
//       let second = letters[i+1];
//       if (alphabet.indexOf(first) > alphabet.indexOf(second)) {
//         letters[i] = second;
//         letters[i+1] = first;
//         sorted = false;
//       }
//     }
//   }
//   return letters.join("");
// };


const test = jumbleSort("hello"); // ehllo
console.log(test);
