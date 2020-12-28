var Dice = function(){
  this.sides = 6;
  this.roll = function() {
    return Math.floor(this.sides * Math.random() + 1)
  }
}
const a = new Dice()
console.log("a = ", a);

const obj = {
  x: 5,
  y: 10,
  setCoord(x,y) {
    this.x = x;
    this.y = y;
  }
}
obj.x
obj.y
obj.setCoord(0,0)
console.log('obj = ', obj);

const Coord = function(x,y) {
  this.x = x;
  this.y = y;
  this.setCoord = function (x,y) {
    this.x = x;
    this.y = y;
  }
}
const coord = new Coord(4,5);
console.log('coord = ', coord);
coord.setCoord(0,0)
console.log('coord = ', coord);

new Promise()
