# Copyright (c) 2018 David Dahlberg <dyn+code@dahlberg.cologne>
#
# Permission to use, copy, modify, and distribute this software for any
# purpose with or without fee is hereby granted, provided that the above
# copyright notice and this permission notice appear in all copies.
#
# THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
# WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
# MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
# ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
# WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
# ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
# OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.

PREFIX   = /usr/local
ETC      = /etc
BINDIR   = $(PREFIX)/bin
SBINDIR  = $(PREFIX)/sbin

all:

install:
	apt-get -qq update
	dpkg-query -s netcat-openbsd >/dev/null || apt-get -q install netcat-openbsd
	dpkg-query -s nvi >/dev/null || apt-get -q install nvi
	dpkg-query -s signify-openbsd >/dev/null || apt-get -q install signify-openbsd
	update-alternatives --set vi /usr/bin/nvi
	update-alternatives --set nc /bin/nc.openbsd
	ln -sf /etc/init.d $(ETC)/rc.d
	ln -sf /usr/bin/sudo $(BINDIR)/doas
	install -D -m 755 rcctl $(SBINDIR)/rcctl
	install -D -m 755 pkg_add $(SBINDIR)/pkg_add
	install -D -m 755 pkg_delete $(SBINDIR)/pkg_delete
	install -D -m 755 pkg_info $(SBINDIR)/pkg_info
	install -D -m 755 syspatch $(SBINDIR)/syspatch
	install -D -m 755 sysupgrade $(SBINDIR)/sysupgrade

uninstall:
	rm -rf /etc/rc.d $(BINDIR)/doas \
		$(SBINDIR)/rcctl \
		$(SBINDIR)/pkg_add \
		$(SBINDIR)/pkg_delete \
		$(SBINDIR)/pkg_info \
		$(SBINDIR)/syspatch \
		$(SBINDIR)/sysupgrade
