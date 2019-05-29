//when to return and when not to is super confusing

function titleize(arr, cb) {
    let newArr = arr.map(ele => {
        return `Mx. ${ele} Jingleheimer Schmidt`;
    })
    cb(newArr);
};

// titleize(["Steph", "Curry", "Lebron", "James"], (titleized) => {
//     titleized.forEach(whatever => console.log(whatever));
// });



function Elephant(name, height, tricks) {
    this.name = name
    this.height = height
    this.tricks = tricks
}

Elephant.prototype.trumpet = function () {
    console.log(`${this.name} the elephant goes thrrrrrrrrrr!!!`)
}

Elephant.prototype.grow = function () { this.height += 12 };

Elephant.prototype.addTrick = function (trick) { this.tricks.push(trick) };

Elephant.prototype.play = function () {
    random = Math.floor(Math.random() * this.tricks.length);
    console.log(`${this.name} is ${this.tricks[random]}`)
}

// let ele = new Elephant("Dumbo", 10, ["running with scissors", "eating jelly beans"]);
// ele.trumpet()
// ele.grow()
// console.log(ele.height)
// ele.addTrick("riding a pony")
// console.log(ele.tricks)
// console.log(ele.play())
// console.log(ele.play())
// console.log(ele.play())


// let ellie = new Elephant("Ellie", 185, ["giving human friends a ride", "playing hide and seek"]);
// let charlie = new Elephant("Charlie", 200, ["painting pictures", "spraying water for a slip and slide"]);
// let kate = new Elephant("Kate", 234, ["writing letters", "stealing peanuts"]);
// let micah = new Elephant("Micah", 143, ["trotting", "playing tic tac toe", "doing elephant ballet"]);

// let herd = [ellie, charlie, kate, micah];

Elephant.paradeHelper = function (ele) {
    console.log(`${ele.name} is walking by!`)
}

// herd.forEach(Elephant.paradeHelper)

function dinerFood() {
    let order = "I'd like some milk please.";

    return function(addToOrder) {
        console.log(order = order.slice(0, order.length - 8) + ' and ' + addToOrder + ' please.');
    }
    
};




let foodOrder = dinerFood("pizza");
foodOrder("pickles")
foodOrder("burgers")



// def titleize(arr, &blk)
//     newarr = arr.map do |ele|
//         'Mx. #{ele} Jinklgeheimer Schimdt'
//     end

//     blk.call(newarr)

// end

// p titleize(["Steph", "lebron"]) { |arr| arr.each { |ele| p ele } }