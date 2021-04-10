const timesFrames = {
  'tf.ティータイム': 0,
  'tf.ディナー': 23695,
  'tf.ランチ': 39180,
  'tf.貸切': 0,
  'tf.部門外': -132,
  'tf.ﾃｲｸｱｳﾄ/ﾃﾞﾘﾊﾞﾘｰ': 14150,
}

const timeFramesArray = Object.keys(timesFrames)
.map((key, index) => {
  console.log(key);
  console.log(timesFrames[key]);
  return {
    name: key.replace('tf.', ''),
    value: timesFrames[key]
  }
})

console.log(timeFramesArray)