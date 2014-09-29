var cinterval = setInterval('countdownTimer()', 1000);
var hours;
var minutes;
var seconds;
var result = "Auction closed.";

function countdownTimer(){
    remaining--;
    updateOutput(remaining);
    if(remaining == 0){
        clearInterval(cinterval);
    }
}

// returns duration formatted in hh:mm:ss
function formatDuration(duration){
    hours = parseInt( duration / 3600 );
    minutes = parseInt( duration / 60 ) % 60;
    seconds = Math.floor(duration % 60);
    return ((hours < 10 ? "0" + hours : hours) + ":" + (minutes < 10 ? "0" + minutes : minutes) + ":" + (seconds  < 10 ? "0" + seconds : seconds));
}

// updates the output of the remaining time in the 'countdown' span.
// shows hh:mm:ss if duration > 0, "Auction closed:" otherwise.
function updateOutput(duration){
    if (duration >= 0){
        result = formatDuration(duration);
    }
    else {
        result = "Auction closed.";
    }
    document.getElementById('countdown').innerHTML = result;
}

function refreshPageIn(seconds){
    setTimeout(function () {
        window.location.reload(1);
    }, remaining * 1000);
}