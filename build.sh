#!/bin/bash
sed -i 's/static const/static/' libmpeg2/idct_mmx.c && \
autoreconf -fiv && \
./configure --prefix=/usr \
            --enable-shared \
            --disable-static && \
make -j $SHED_NUM_JOBS && \
make DESTDIR="$SHED_FAKE_ROOT" install && \
install -v -d "${SHED_FAKE_ROOT}/usr/share/doc/mpeg2dec-0.5.1" && \
install -v -m644 README doc/libmpeg2.txt "${SHED_FAKE_ROOT}/usr/share/doc/mpeg2dec-0.5.1"
