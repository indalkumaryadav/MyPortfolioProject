// wap to accept and display an array
// wap to find sum of element of the array
//wap to count number element in  array
//wap to count total number of odd and even number in the array
//wap to search in the array
//wap to count frequency of given number
//wap to sort asc and desc
//reverse array

const reverseArray = (array) => {
  let arr = [];
  for (let i = array.length - 1; i >= 0; i--) {
    arr.push(array[i]);
  }
  return arr;
};

// console.log(reverseArray([10, 20, 30, 40, 50]));

// Array Find the maximum and minimum element in an array

function findMax(arr) {
  let max = arr[0];

  for (let val of arr) {
    if (val > max) {
      max = val;
    }
  }
  return max;
}

function findMin(array) {
  let min = array[0];
  for (let i of array) {
    if (i < min) {
      min = i;
    }
  }
  return min;
}

function sumFind(array) {
  let sum = 0;
  for (let i in array) {
    sum = sum + array;
  }
  return sum;
}

function countArray(array) {
  let count = 0;
  for (let i = 0; i < array.length; i++) {
    count = array.length;
  }
  return count;
}

function searchArray(array, element) {
  for (let e in array) {
    if (e === element) {
      element = e;
    }
  }
  return element;
}

function countArrayElementFreq(array, element) {
  let count = 0;
  for (let i = 0; i < array.length; i++) {
    if (array[i] === element) {
      count++;
    }
  }
  return count;
}

const arrayOrderAsc = (array) => {
  for (let i = 0; i < array.length; i++) {
    let temp = [];
    for (let j = 1; j < array.length; j++) {
      if (array[i] > array[j]) {
        console.log(array[i]);
        temp.push(array[i]);
      }
    }
    array = temp;
  }
  return array;
};
console.log(arrayOrderAsc([10, 20, 1, 2, 3, 5, 10]));
