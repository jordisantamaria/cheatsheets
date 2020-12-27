// sintaxis new Promise((resolve, reject) => resolve(returnValue);

function getGreet() {
  return new Promise((resolve, reject) => {
    try {
      setTimeout(resolve("Hello world"), 5000)
    } catch (e) {
      reject(e)
    }
  })
}
