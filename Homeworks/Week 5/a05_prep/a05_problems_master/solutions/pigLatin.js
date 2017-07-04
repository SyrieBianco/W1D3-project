// Write a method that translates a sentence into pig latin. You may want a helper method.
// 'apple' => 'appleay'
// 'pearl' => 'earlpay'
// 'quick' => 'ickquay'

const translateWord = (word) => {
  const vowels = ["a", "e", "i", "o", "u"];
  if (vowels.includes(word[0])){
    return `${word}ay`;
  } else {
    let phonemeEnd = 0;
    while (!vowels.includes(word[phonemeEnd])){
      phonemeEnd += 1;
    }
    if (word[phonemeEnd-1] === "q") {
      phonemeEnd += 1;
    }
    return `${word.slice(phonemeEnd)}${word.slice(0, phonemeEnd)}ay`;
  }
};

const pigLatin = (sentence) => {
  let words = sentence.split(" ");
  let translated = words.map(function(word){
    return translateWord(word);
  });
  return translated.join(" ");
};

console.log(pigLatin("quick"));
console.log(pigLatin("banana"));
console.log(pigLatin("apple"));
console.log(pigLatin("a banana each day helps you learn javascript"));
