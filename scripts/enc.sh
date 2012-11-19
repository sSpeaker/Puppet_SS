#!/bin/bash

FQDN=$1

[ -f "/etc/puppet/$ENVIRONMENT/enc/${FQDN}.yaml" ] && {
   ANSWER=`cat "/etc/puppet/$ENVIRONMENT/enc/${FQDN}.yaml"`
} || {
   ANSWER="`/usr/bin/env PUPPET_DASHBOARD_URL=http://localhost:3000 /usr/share/puppet-dashboard/bin/external_node $FQDN`"
}

echo "$ANSWER"