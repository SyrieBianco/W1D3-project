// Write your myBind method so that it can take both
// bind-time arguments and call-time arguments.


// alright. WHAT THE EFF do we have going on here?
// we have to capture this in fn, becasue of scope.
    // this doesnt persist!!
// we have to captture bindArgs for the same reason
    //dont forget about Array.from!!!
// then, inside the function, we grab the SECOND group of args
    // the args that are passed to the callback
//and then we simply return w/ apply like usual!

// when using the ... op, things are going to be differne
  //1. ...args are already in an array
  //2. fat arrow ALLOWS the shit to persist. (so no 'fn')

// pt 1 is the ANTI fat arrow method;
Function.prototype.myBind1 = function (ctx) {

};



Function.prototype.myBind2 = function (ctx, ...bindArgs) {

};



class Cat {
  constructor(name) {
    this.name = name;
  }

  says(sound, person) {
    console.log(`${this.name} says ${sound} to ${person}!`);
    return true;
  }
}

const markov = new Cat("Markov");
const breakfast = new Cat("Breakfast");

// bind time args are "meow" and "Kush", no call time args
markov.says.myBind2(breakfast, "meow", "Kush")();
// Breakfast says meow to Kush!
// true

// no bind time args (other than context), call time args are "meow" and "me"
markov.says.myBind2(breakfast)("meow", "a tree");
// Breakfast says meow to a tree!
// true

// bind time arg is "meow", call time arg is "Markov"
markov.says.myBind2(breakfast, "meow")("Markov");
// Breakfast says meow to Markov!
// true

//  no bind time args (other than context), call time args are "meow" and "me"
const notMarkovSays2 = markov.says.myBind2(breakfast);
notMarkovSays2("meow", "me");
// Breakfast says meow to me!
// true
