function sumNumbers(x,y) {
  return x+y
}
const sum = require('./sum');

describe('Sample test', () => {
  test('tabs change active on click', () => {
    expect(sum(4,5)).toEqual(9)
  })

});
