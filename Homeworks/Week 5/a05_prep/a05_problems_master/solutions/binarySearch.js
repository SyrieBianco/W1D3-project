function myBsearch(array, target) {
  // base case, because if the array is empty, the target wasn't found.
  if (array.length === 0) {
     return -1;
   }

   // grab the middle number to search by. Have to use floor because
   // JS does math with 'floats' aka the real way to do math
   const mid = Math.floor(array.length / 2);
   //if the target is equal to the element at mid, you win
   if (array[mid] === target) {
     return mid;
  //else if its larger than target, search the left side
   } else if (array[mid] > target) {
     const left = array.slice(0, mid);
     return myBsearch(left, target);
  //finally, you may need to search the right side, but its trickier
   } else {
     const right = array.slice(mid + 1);
     const subproblem =  myBsearch(right, target);
     // if subproblem doesn't find any results, return -1,
     // else, return the result of subproblem + mid+1 because you need to
     // be returning the index of the FULL array
     return subproblem === -1 ? -1 : subproblem + (mid + 1);
   }
 }

console.log(myBsearch([1,2,3,4,5], 2)); // 1
console.log(myBsearch([1,2,3,4,5], 5)); // 4
console.log(myBsearch([1,2,3,4,5], 6)); // -1
