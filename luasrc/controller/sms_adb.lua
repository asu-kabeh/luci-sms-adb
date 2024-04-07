module("luci.controller.sms_adb", package.seeall)
function index()
entry({"admin","services","sms_adb"}, template("sms_adb"), _("Sms Adb"), 3).leaf=true
end