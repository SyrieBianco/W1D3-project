// write a method that returns an exclusive range of the numbers between start
// and end. Use recursion!
function range(start, end) {
  if (start === end){
    return end;
  }

  return [start].concat(range(start+1, end));
}

console.log(range(3, 10));
