let bal = 0;
let socialCredit = 0;

function gooiButton() {
    bal++;
    console.log(bal);
}
function vangButton() {
    console.log(bal);
    bal = 0;
}
function resetButton() {
    location.reload();
}
console.log(bal);

function checkAir() {
    try {
        if (bal >= 2) {
            throw document.getElementById('status').innerHTML = "WRONG THE BALL IS ALREADY IN THE AIR - 10000000 Social credits";
        }
        console.log("Variable is groter dan 1");
        document.getElementById('status').innerHTML = "De bal is in de Lucht.";
    } catch (error) {
        socialCredit -= 10000000;
        alert("CIA wants to know your location");
    }
    finally{
        document.getElementById('credits').innerHTML = socialCredit + " Social credits";
    }
}

function check() {
    try {
        if (bal <= 0) {
            throw document.getElementById('status').innerHTML = "WRONG THE BALL IS NOT IN THE AIR - 10000000 Social credits";
        }
        document.getElementById('status').innerHTML = "The ball has been catched + 10 Social credits";
        console.log("Variable is bigger than 0");
        socialCredit += 10;
    } catch (error) {
        socialCredit -= 10000000;
        console.log(error);
        alert("FBI wants to know your location");
        console.log(socialCredit);
    }
    finally {
        document.getElementById('credits').innerHTML = socialCredit + " Social credits";
    }
}