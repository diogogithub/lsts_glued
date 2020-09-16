version=\
(
    '2.35'
)

url=\
(
    "http://mirrors.kernel.org/gnu/binutils/binutils-$version.tar.xz"
)

md5=\
(
    'fc8d55e2f6096de8ff8171173b6f5087'
)

maintainer=\
(
    'Ricardo Martins <rasm@fe.up.pt>'
)

build_dir=$pkg_var

configure()
{
    "../binutils-$version/configure" \
        --prefix="$cfg_dir_toolchain" \
        --target="$cfg_target_canonical" \
        --host="$cfg_host_canonical" \
        --build="$cfg_host_canonical" \
        --with-sysroot="$cfg_dir_toolchain_sysroot" \
        --disable-multilib \
        --disable-nls
}

build()
{
    $cmd_make
}

host_install()
{
    $cmd_make install-strip
}
