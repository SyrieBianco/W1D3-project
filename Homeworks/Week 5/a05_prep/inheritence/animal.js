
function inherits(child, parent) {
  function Surrogate(){}
  Surrogate.prototype = parent.prototype;
  child.prototype = new Surrogate();
  child.prototype.constructor = child;

}

function lessAnnoyingInherits(child, parent){
  child.prototype = Object.create(parent.prototype);
  child.prototype.constructor = child;
}


// animal constructor
function Animal(name){
  this.name = name;
}

Animal.prototype.eat = function () {
  console.log(`mmm. ${this.name} hungry`);
};

function Dog(name){
  Animal.call(this, name);
}

function Cat(name, legs){
  Animal.call(this, name);
  this.legs = legs;
}



lessAnnoyingInherits(Dog, Animal);
lessAnnoyingInherits(Cat, Animal);


Dog.prototype.woof = function(){
    console.log(`woof. i am ${this.name}`);
};

Cat.prototype.meow = function(){
  console.log(`purrrrr. ${this.name} missed you`);
};

Cat.prototype.complain = function(){
  console.log(`i only has ${this.legs} legs`);
};


module.exports = Animal;
window.Dog = Dog;
window.Animal = Animal;
window.Cat = Cat;
