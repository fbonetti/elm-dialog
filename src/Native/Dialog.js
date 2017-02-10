//import Native.Scheduler //

var _fbonetti$elm_dialog$Native_Dialog = function() {

function alert(messages)
{
  return _elm_lang$core$Native_Scheduler.nativeBinding(function(callback)
  {
    window.alert(message);
    callback(_elm_lang$core$Native_Scheduler.succeed(_elm_lang$core$Native_Utils.Tuple0);
  });
}

function confirm(message)
{
  return _elm_lang$core$Native_Scheduler.nativeBinding(function(callback)
  {
    callback(_elm_lang$core$Native_Scheduler.succeed(window.confirm(message));
  });
}

function prompt(message, default)
{
  return _elm_lang$core$Native_Scheduler.nativeBinding(function(callback)
  {
    callback(_elm_lang$core$Native_Scheduler.succeed(window.prompt(message, default));
  });
}

return {
  alert: F1(alert),
  confirm: F1(confirm),
  prompt: F2(prompt)
};

}();