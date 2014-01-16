#!/bin/sh
#
# Copyright (C) 2014  Internet Systems Consortium, Inc. ("ISC")
#
# Permission to use, copy, modify, and/or distribute this software for any
# purpose with or without fee is hereby granted, provided that the above
# copyright notice and this permission notice appear in all copies.
#
# THE SOFTWARE IS PROVIDED "AS IS" AND ISC DISCLAIMS ALL WARRANTIES WITH
# REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY
# AND FITNESS.  IN NO EVENT SHALL ISC BE LIABLE FOR ANY SPECIAL, DIRECT,
# INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM
# LOSS OF USE, DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE
# OR OTHER TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR
# PERFORMANCE OF THIS SOFTWARE.

# $Id: prereq.sh,v 1.3 2010/06/08 23:50:24 tbox Exp $

SYSTEMTESTTOP=..
. $SYSTEMTESTTOP/conf.sh
../../../tools/genrandom 400 random.data

echo rsaonly > supported
exit 0

rsafail=0 eccfail=0

$KEYGEN -q -r random.data foo > /dev/null 2>&1 || rsafail=1
rm -f Kfoo*

if [ $rsafail = 1 ]; then
	echo "I:This test requires OpenSSL built with PKCS#11 support." >&2
	exit 255
fi
