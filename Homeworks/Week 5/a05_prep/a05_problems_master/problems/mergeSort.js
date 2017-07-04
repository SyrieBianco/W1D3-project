//Write an Array#merge_sort method; it should not modify the original array.
// If a comparator is passed, it should sort according to that callback.


Array.prototype.mergeSort = function(comparator) {


};

function merge(left, right, comparator) {

}






const compA = (a,b) => {

  if (a > b) {
    return -1;
  } else if (a < b){
    return 1;
  } else {
    return 0;
  }

};

console.log([1,9,2,3,0,5,6,43,24].mergeSort(compA)); // ONE WITH COMPARATOR
console.log([1,9,2,3,0,5,6,43,24].mergeSort()); // ONE WITHOUT
