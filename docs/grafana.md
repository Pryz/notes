## Scripted dashboards

Data in `/usr/share/grafana/public/dashboards`

```javascript
/* global _ */

/*
 * Scripted Grafana dashboard
 *
 * Read JSON source file source.json from "/public/dashboards/source.json" and alter the dashboard settings.
 */

'use strict';

// accessible variables in this scope
var window, document, ARGS, $, jQuery, moment, kbn;

return function(callback) {

  // Create callback scope variables
  var dashboard
  var datasource
  var zone_tpl

  // Default values
  var ds_prefix = "graphite"
  var vpc = null
  var zone = "us-east-1a"

  if(!_.isUndefined(ARGS.vpc)) {
    vpc = ARGS.vpc;
  }
  if(!_.isUndefined(ARGS.zone)) {
    zone = ARGS.zone;
  }

  if (vpc !== null) {
    datasource = [ds_prefix, vpc, zone].join("-")
    zone_tpl = [zone, vpc].join("-")
  } else {
    datasource = [ds_prefix, zone].join("-")
    zone_tpl = zone
  }

  $.getJSON("/public/dashboards/source.json", function() {
    console.log("success to get source.json");
  }).done(function (dashboard) {
    // Edit rows with new datasource
    for (var i = 0; i < dashboard.rows.length; i++) {
      for (var j = 0; j < dashboard.rows[i].panels.length; j++ ) {
        dashboard.rows[i].panels[j].datasource = datasource
      }
    }

    // Edit templating variables
    for (var i = 0; i < dashboard.templating.list.length; i++) {
      if (dashboard.templating.list[i].name == "zone") {
        dashboard.templating.list[i].current.text = zone_tpl
        dashboard.templating.list[i].current.value = zone_tpl
      }
    }

    callback(dashboard);
  });

}
```
