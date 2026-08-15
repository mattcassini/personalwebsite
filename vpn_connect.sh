#!/bin/bash
VPN_SERVER_ADDRESS="vpn.njit.edu"   # example server address to connect to

VPN_USER="my_username"      # example username
# or perhaps just this for the username:

# Custom configuration to solve some problems while using `openconnect-sso` in Ubuntu 22.04.
# See: https://github.com/vlaci/openconnect-sso/issues/81#issuecomment-1363355533
export QTWEBENGINE_DISABLE_SANDBOX=1
export OPENSSL_CONF=~/.my_ssl.conf

# connect via `openconnect-sso`
# The first time ever, you must specify everything
openconnect-sso --server "${VPN_SERVER_ADDRESS}/${VPN_SAML_GROUP}" --user "${VPN_USER}"
# Subsequent connection attempts can be done with just this, since apparently
# the server address, SAML group, and username are cached after the first usage
openconnect-sso
