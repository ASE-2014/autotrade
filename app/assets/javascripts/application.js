// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

//= require bootstrap.min

var cinterval;
var hours;
var minutes;
var seconds;
var result = "Auction closed.";

function countdownTimer(){
    remaining--;
    formatDurationPos(remaining);
    if(remaining == 0){
        clearInterval(cinterval);
    }
}

function formatDuration(duration){
    hours = parseInt( duration / 3600 );
    minutes = parseInt( duration / 60 ) % 60;
    seconds = Math.floor(duration % 60);
    result = (hours < 10 ? "0" + hours : hours) + ":" + (minutes < 10 ? "0" + minutes : minutes) + ":" + (seconds  < 10 ? "0" + seconds : seconds);
}

function formatDurationPos(remaining){
    if (remaining >= 0){
        formatDuration(remaining);
    }
    document.getElementById('countdown').innerHTML = result;
}

// 250 means .25 second,
cinterval = setInterval('countdownTimer()', 1000);

