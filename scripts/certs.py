#!/bin/env/ /bin/python

# If lost track of source of this script. Will credit source when I find it.
from OpenSSL import SSL
from pathlib import Path
from cryptography import x509
from cryptography.x509.oid import NameOID
from datetime import datetime
import idna

from socket import socket
from collections import namedtuple

HostInfo = namedtuple(field_names='cert hostname peername', typename='HostInfo')


def verify_cert(cert, hostname):
    # verify notAfter/notBefore, CA trusted, servername/sni/hostname
    cert.has_expired()
    # service_identity.pyopenssl.verify_hostname(client_ssl, hostname)
    # issuer

def get_certificate(hostname, port):
    hostname_idna = idna.encode(hostname)
    sock = socket()

    sock.connect((hostname, port))
    peername = sock.getpeername()
    ctx = SSL.Context(SSL.SSLv23_METHOD) # most compatible
    ctx.check_hostname = False
    ctx.verify_mode = SSL.VERIFY_NONE

    sock_ssl = SSL.Connection(ctx, sock)
    sock_ssl.set_connect_state()
    sock_ssl.set_tlsext_host_name(hostname_idna)
    sock_ssl.do_handshake()
    cert = sock_ssl.get_peer_certificate()
    crypto_cert = cert.to_cryptography()
    sock_ssl.close()
    sock.close()

    return HostInfo(cert=crypto_cert, peername=peername, hostname=hostname)

def get_alt_names(cert):
    try:
        ext = cert.extensions.get_extension_for_class(x509.SubjectAlternativeName)
        return ext.value.get_values_for_type(x509.DNSName)
    except x509.ExtensionNotFound:
        return None

def get_common_name(cert):
    try:
        names = cert.subject.get_attributes_for_oid(NameOID.COMMON_NAME)
        return names[0].value
    except x509.ExtensionNotFound:
        return None

def get_issuer(cert):
    try:
        names = cert.issuer.get_attributes_for_oid(NameOID.COMMON_NAME)
        return names[0].value
    except x509.ExtensionNotFound:
        return None


#def print_basic_info(hostinfo):
#    s = '''» {hostname} « … {peername}
#    \tcommonName: {commonname}
#    \tSAN: {SAN}
#    \tissuer: {issuer}
#    \tnotBefore: {notbefore}
#    \tnotAfter:  {notafter}
#    '''.format(
#            hostname=hostinfo.hostname,
#            peername=hostinfo.peername,
#            commonname=get_common_name(hostinfo.cert),
#            SAN=get_alt_names(hostinfo.cert),
#            issuer=get_issuer(hostinfo.cert),
#            notbefore=hostinfo.cert.not_valid_before,
#            notafter=hostinfo.cert.not_valid_after
#    )
#    print(s)


def print_basic_info(hostinfo):
    print(f"[{hostinfo.hostname}]: {hostinfo.cert.not_valid_after}")

def check_it_out(hostname, port):
    hostinfo = get_certificate(hostname, port)
    print_basic_info(hostinfo)

now = datetime.now()
def warning(hostinfo):
    #expiry = datetime.strptime(hostinfo.cert.not_valid_after, '%Y-%m-%d %I:%M:%S')
    expiry = hostinfo.cert.not_valid_after
    if now > expiry:
        print(f"[ERROR] {hostinfo.hostname} has expiried on {str(expiry)}")
        return
    if now.month == expiry.month:
        print(f"[WARNING] {hostinfo.hostname} is expiring on {str(expiry)}")


import concurrent.futures
if __name__ == '__main__':
    with concurrent.futures.ThreadPoolExecutor(max_workers=12) as e:

        path = Path(__file__).parent / "./.domains"
        hosts = []
        with path.open() as file:
            for host in file.readlines():
                hosts.append(host.strip())

        for hostinfo in e.map(lambda x: get_certificate(x, 443), hosts):
#            print_basic_info(hostinfo)
            warning(hostinfo)
