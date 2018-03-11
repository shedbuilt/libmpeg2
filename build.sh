#!/bin/bash
sed -i 's/static const/static/' libmpeg2/idct_mmx.c && \
autoreconf -fiv && \
./configure --prefix=/usr \
            --enable-shared \
            --disable-static && \
make -j $SHED_NUMJOBS && \
make DESTDIR="$SHED_FAKEROOT" install && \
install -v -d "${SHED_FAKEROOT}/usr/share/doc/mpeg2dec-0.5.1" && \
install -v -m644 README doc/libmpeg2.txt "${SHED_FAKEROOT}/usr/share/doc/mpeg2dec-0.5.1"
