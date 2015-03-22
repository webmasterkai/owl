// This app info.
var appInfo = require('./package.json')
// Create global variable SITE_ID based on name property.
global.SITE_ID = appInfo.name
// Require coffeescript
require('coffee-script/register');
// Require cape-gulp that contains common tasks.
require('cape-gulp');
