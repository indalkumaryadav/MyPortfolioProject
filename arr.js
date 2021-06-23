function numSum(num) {
  return (num * (num + 1)) / 2;
}

function addSum(num) {
  let sum = 0;
  for (let i; i < num; i++) {
    sum += i;
  }
  return sum;
}

let t1 = performance.now();
addSum(10);
let t2 = performance.now();
