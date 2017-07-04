function myMerge(obj1, obj2) {
  Object.keys(obj2).forEach(function(key){
    obj1[key] = obj2[key];
  });
  return obj1;
}

const obj1 = {a: 1, b:2, c:3 };
const obj2 = {a: 1, b:2, d:4 };
console.log(myMerge(obj1, obj2));

// above: destructive
// below: doesn't modify origial hashes

// The above solution is obviously superior than the following one.
// But, incase some of the built in functionallity above is new to you,
// check out the solution below with is much more descriptive:

function myMerge(obj, moreObj) {
  const newObj = {};

  Object.keys(obj).forEach(function(key){
    if (!Object.keys(newObj).includes(key)){
      newObj[key] = obj[key];
    }
  });

  Object.keys(moreObj).forEach(function(key){
    if (!Object.keys(newObj).includes(key)){
      newObj[key] = moreObj[key];
    }
  });

  return newObj;
}

const obj3 = {a: 1, b:2, c:3 };
const obj4 = {a: 1, b:2, d:4 };
console.log(myMerge(obj3, obj4));
