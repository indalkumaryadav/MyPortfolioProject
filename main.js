function getSumPairZero(array) {
  for (let number in array) {
    for (let j = 1; j < array.length; j++) {
      if (number + array[j]) {
        return [number, array[j]];
      }
    }
  }
}

function getSumPairZero2(array) {
  let left = 0;
  let right = array.length - 1;
  while (left < right) {
    sum = array[left] + array[right];
    if (sum === 0) {
      return [array[left], array[right]];
    } else if (sum > 0) {
      right--;
    } else {
      left++;
    }
  }
}

console.log(getSumPairZero2([-5, -4, -3, -2, 2, 4, 6, 8]));
