name             "couchbase"
maintainer       "getaroom"
maintainer_email "devteam@roomvaluesteam.com"
license          "MIT"
description      "Installs/Configures Couchbase"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "1.0.0"

depends "logrotate"

supports "debian"
supports "ubuntu"

recipe "couchbase::server", "Installs couchbase-server"
recipe "couchbase::logrotate", "Configure logrotation for couchbase-server"
