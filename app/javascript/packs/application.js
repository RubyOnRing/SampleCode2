import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

Rails.start()
Turbolinks.start()
ActiveStorage.start()

require ('jquery')
global.$ = require('jquery')
require('@coreui/coreui/dist/js/coreui.bundle.min')
require('./salesforce_account')
