Array.prototype.myTranspose = function () {
  const columns = [];

  // build the array to push vals into
for (let i = 0; i < this[0].length; i++) {
  columns.push([]);
  }

  for (let i = 0; i < this.length; i++) {
    for (let j = 0; j < this[i].length; j++) {
      columns[j].push(this[i][j]);
    }
  }

  return columns;
};

console.log([[0, 1, 2], [3, 4, 5], [6, 7, 8]].myTranspose()); //[ [ 0, 3, 6 ], [ 1, 4, 7 ], [ 2, 5, 8 ] ]
