//From the A/A curriculum:
// No one has told me that this could be on there, but it couldn't hurt to
// practice some kind of ASync problem.
const readline = require("readline");
const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

function addNumbers(sum, numsLeft, completionCallback) {

}

addNumbers(0, 3, function (sum) {
  console.log("Total Sum: " + sum);
  reader.close();
});
