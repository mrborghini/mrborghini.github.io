const cords = ['x', 'z'];
let input = [document.getElementById('x'), document.getElementById('z')];
let inputY = document.getElementById('y');
let answer = [];
const output = document.getElementById('result');

function nether() {
    for (let i = 0; i < cords.length; i++) {
        answer[i] = input[i].value / 8;
    }
    check();
}

function overworld() {
    for (let i = 0; i < cords.length; i++) {
        answer[i] = input[i].value * 8;
    }
    check();
}
function check() {
    output.innerHTML = answer[0] + " " + inputY.value + " " + answer[1];
}