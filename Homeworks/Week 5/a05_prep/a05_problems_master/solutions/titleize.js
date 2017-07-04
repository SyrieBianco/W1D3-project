// Write a method that capitalizes each word in a string like a book title
// Do not capitalize words like 'a', 'and', 'of', 'over' or 'the'

const titleize = (title) => {
  const littleWords = ["and", "over", "a", "of", "the"];
  const words = title.split(" ");

  let titled = words.map(function(word){
    if (littleWords.includes(word)){
      return word.toLowerCase();
    } else {
      return word[0].toUpperCase() + word.slice(1);
    }
  });

  let results = titled.join(" ");
  return results[0].toUpperCase() + results.slice(1);
};


console.log(titleize("the bridge over the river kwai"));
