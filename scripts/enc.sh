#!/bin/bash

FQDN=$1

[ -f "/etc/puppet/$PUPPET_ENVIRONMENT/enc/${FQDN}.yaml" ] && {
   ENC_LOCALFILE="/etc/puppet/$PUPPET_ENVIRONMENT/enc/${FQDN}.yaml"
   ANSWER=`cat $ENC_LOCALFILE | sed "s/parameters:/parameters:\n  enc_localfile: $ENC_LOCALFILE/"`
} || {
   ANSWER="`/usr/bin/env PUPPET_DASHBOARD_URL=http://localhost:3000 /usr/share/puppet-dashboard/bin/external_node $FQDN`"
}

echo "$ANSWER"