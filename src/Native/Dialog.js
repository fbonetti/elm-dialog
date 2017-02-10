//import Native.Scheduler //

var _fbonetti$elm_dialog$Native_Dialog = function() {

function alert(message)
{
  return _elm_lang$core$Native_Scheduler.nativeBinding(function(callback)
  {
    window.alert(message);
    callback(_elm_lang$core$Native_Scheduler.succeed(_elm_lang$core$Native_Utils.Tuple0));
  });
}

function confirm(message)
{
  return _elm_lang$core$Native_Scheduler.nativeBinding(function(callback)
  {
    callback(_elm_lang$core$Native_Scheduler.succeed(window.confirm(message)));
  });
}

function prompt(message, defaultInput)
{
  return _elm_lang$core$Native_Scheduler.nativeBinding(function(callback)
  {
    var value = window.prompt(message, defaultInput);
    var elmValue;

    if (value === null) {
      elmValue = _elm_lang$core$Maybe$Nothing;
    } else {
      elmValue = _elm_lang$core$Maybe$Just(value);
    }

    callback(_elm_lang$core$Native_Scheduler.succeed(elmValue));
  });
}

return {
  alert: alert,
  confirm: confirm,
  prompt: F2(prompt)
};

}();