// We've learned a couple of ways to implement class inheritance
// in Javascript. Let's first look at using a Surrogate.
//
// There are a number of steps:

// Define a Surrogate class
// Set the prototype of the Surrogate (Surrogate.prototype = SuperClass.prototype)
// Set Subclass.prototype = new Surrogate()
// Set Subclass.prototype.constructor = Subclass

// Write a Function.prototype.inherits method that will do this for you.
//Do not use Object.create right now; you should deeply understand
//what the new keyword does and how the __proto__ chain is constructed.

//----------------------------
// Using Surrogates
//----------------------------
Function.prototype.inherits1 = function (BaseClass) {
  function Surrogate () {}
  Surrogate.prototype = BaseClass.prototype;
  this.prototype = new Surrogate();
  this.prototype.constructor = this;
};

//----------------------------
// Using Object.Create
//----------------------------

// After you have written Function.prototype.inherits
// using the surrogate trick, refactor your solution using
// Object.create. Make sure to test that your updated solution works.

Function.prototype.inherits2 = function (BaseClass) {
  this.prototype = Object.create(BaseClass.prototype);
  this.prototype.constructor = this;
};


//----------------------------
// Test Set Up
//----------------------------

function Dog (name) {
  this.name = name;
}

Dog.prototype.bark = function () {
  console.log(this.name + " barks!");
};

function Corgi (name) {
  Dog.call(this, name);
}

Corgi.inherits1(Dog); // change to inherits2 to test your second method

Corgi.prototype.waddle = function () {
  console.log(this.name + " waddles!");
};

const blixa = new Corgi("Blixa");
blixa.bark();
blixa.waddle();
