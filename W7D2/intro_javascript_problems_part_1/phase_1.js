/* doesnt work because var x will be accessible outside of the block
and a const x is already in that outer scope*/

function mysteryScoping3() {
    const x = 'out of block';
    if (true) {
        var x = 'in block';
        console.log(x);
    }
    console.log(x);
}


// var will pass it's state from scope to scopt
// let will not


/* this one has nothing to do with the scope of the conditional
you just can't use let for the same variable more than once in the same scope*/
function mysteryScoping5() {
    let x = 'out of block';
    if (true) {
        let x = 'in block';
        console.log(x);
    }
    let x = 'out of block again';
    console.log(x);
}


//uppercases and interpolates them into the sentence
function madlib(verb, adj, noun) {
    return `We shall ${verb.toUpperCase()} the ${adj.toUpperCase()} ${noun.toUpperCase()}`
}

// console.log(madlib("award", "selfless", "people"));


function isSubstring(searchString, subString) {
    return searchString.includes(subString)
}

//console.log(isSubstring("cool if it works", " it w"))

function fizz_buzz(arr) {
    let new_arr = []  // i forgot the ; but it still worked
    arr.forEach(ele => {
        if ((ele % 3 === 0 || ele % 5 === 0) && !(ele % 3 === 0 && ele % 5 === 0)) new_arr.push(ele);
    });
    return new_arr  // once again forgot the ; but it still worked
}

// console.log(fizz_buzz([3, 15, 5, 18, 30, 35, 38, 50, 60]));


function isPrime(num) {
    if (num < 2) return false;
    for(let i = 2; i < num ; i++) {
        if (num % i === 0) return false  // forgot ; again but still works is vscode helping me or does it not matter?
    }
    return true
}


// console.log(isPrime(1))
// console.log(isPrime(2))
// console.log(isPrime(3))
// console.log(isPrime(4))
// console.log(isPrime(0))
// console.log(isPrime(-3))
// console.log(isPrime(15485863))
// console.log(isPrime(3548563))


function sumOfNPrimes(n) {
    let arr = [];
    function firstNPrimes(n) {
        let count = 0;
        
        for (let i = 2; count < n; i++) {
            
            if (isPrime(i)) {
                
                arr.push(i);
                count += 1;
            }
        }
    }
    firstNPrimes(n)
    let sum = 0
    arr.forEach(ele => sum += ele)
    return sum
}

console.log(sumOfNPrimes(6))