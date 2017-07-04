// Write a recursive method that returns all of the permutations of an array

// Similar to the subsets problem, we observe that to get the permutations
// of [1, 2, 3] we can look at the permutations of [1, 2] which are
// [1, 2] and [2, 1] and add the last element to every possible index getting
// [3, 1, 2], [1, 3, 2], [1, 2, 3], [3, 2, 1], [2, 3, 1]


const permutations = (array) => {
  if (array.length === 1) {
    return [array];
  }

  const first = array.shift();
  let perms = permutations(array);

  let totalPerms = [];
  perms.forEach(function(perm) {
    for (let i = 0; i < perms.length+1; i++) {
      totalPerms.push(perm.slice(0,i).concat([first], perm.slice(i,perms.length)));
      }
  });

  return totalPerms;
};

console.log(permutations([1,2,3]));
