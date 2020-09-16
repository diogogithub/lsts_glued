version=\
(
    '1.1.1f'
)

url=\
(
    "http://www.openssl.org/source/openssl-$version.tar.gz"
)

md5=\
(
    '3f486f2f4435ef14b81814dbbc7b48bb'
)

requires=\
(
    'zlib/default'
)

configure()
{
    ./Configure linux-generic32 --cross-compile-prefix="$cfg_target_canonical-" \
                --prefix="$cfg_dir_toolchain_sysroot/usr" \
                --openssldir="$cfg_dir_toolchain_sysroot/usr" \
		--libdir=lib \
                shared
}

build()
{
    $cmd_make depend &&
    $cmd_make all
}

host_install()
{
    $cmd_make -j1 install
}

target_install()
{
    for f in $cfg_dir_toolchain_sysroot/usr/lib/{libcrypto.so*,libssl.so*}; do
        name="$cfg_dir_rootfs/lib/$(basename $f)"
        if [ -f "$f" ]; then
            $cmd_target_strip "$f" -o "$name"
        else
            $cmd_cp "$f" "$name"
        fi
    done
}
