locals{
  mysql_app=[for f in fileset("${path.module}/config", "[^_]*.yaml") : yamldecode(file("${path.module}/config/${f}"))]
  mysql_app_list = flatten([
    for app in local.mysql_app : [
      for mysqlapps in try(app.listofmysqlapps, []) :{
        name=mysqlapps.name    
      }
    ]
])
}
