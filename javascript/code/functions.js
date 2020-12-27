function callback() {
  console.log('callback called');
 return 5
}
function sample(callback) {
  // fetch
  callback()

}


function main() {
  // sample()
  console.log('asdf');
  const array = [1,2]
  function modifyArray(x = 3,y = 4) {
    return [1,2,4, x]
  }
  const array2 = modifyArray()
  console.log(array2);

}
main()
