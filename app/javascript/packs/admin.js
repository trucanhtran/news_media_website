// Only for admin page

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
//add fontawesome
import "@fortawesome/fontawesome-free/css/all.css"


Rails.start()
Turbolinks.start()
ActiveStorage.start()

require("trix")
require("@rails/actiontext")
require("packs/admin/jquery.min")
require("packs/admin/bootstrap.bundle.min")
require("packs/admin/jquery.easing.min")
require("jquery")
require("packs/admin/user_search")
