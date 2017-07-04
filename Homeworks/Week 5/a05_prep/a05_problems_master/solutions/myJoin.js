// Add your own myJoin to the ArrayClass. If no arg is given,
// set the seperator to "".



Array.prototype.myJoin = function (seperator) {
  if (seperator === undefined) {
    seperator = "";
  }

  let joined = "";
  for (var i = 0; i < this.length; i++) {
    joined+= this[i]; // + automatically coerses to string type.
    if (i < this.length-1){
      joined+= seperator;
    }
  }

  return joined;

};

console.log([1,2,3].myJoin());
console.log(["javascript","is","weird"].myJoin(" "));
