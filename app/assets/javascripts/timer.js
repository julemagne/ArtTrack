var Stopwatch = function(elem, options) {

  var timer       = createTimer(),
      offset,
      clock,
      interval;

  // default options
  options = options || {};
  options.delay = options.delay || 1;

  // append elements
  elem.appendChild(timer);


  // initialize
  reset();

  // private functions
  function createTimer() {
    return document.createElement("span");
  }


  function start() {
    if (!interval) {
      offset   = $("#timer").attr("start-time");
      interval = setInterval(update, options.delay);
    }
  }

  function reset() {
    clock = 0;
    render(0);
  }

  function update() {
    clock += delta();
    render();
  }

  function render() {
    var hours = Math.floor(clock/3600);
    hours = hours < 10 ? ("0" + hours) : (hours);
    var minutes = Math.floor(clock%3600/60);
    minutes = minutes < 10 ? ("0" + minutes) : (minutes);
    var seconds = Math.floor(clock%60);
    seconds = seconds < 10 ? ("0" + seconds) : (seconds);

    timer.innerHTML = hours + ":" + minutes + ":" + seconds;
  }

  function delta() {
    var now = Date.now(),
        d   = now/1000 - offset/1000;

    offset = now;
    return d;
  }

  this.start  = start;
};
$(function(){
  var work = document.getElementById("timer");
  if (work) {
    workTimer = new Stopwatch(work);
    workTimer.start();
  }
});
