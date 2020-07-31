version=\
(
    '3.1.1'
)

url=\
(
    "https://github.com/WayneD/rsync/archive/v$version.tar.gz"
)

md5=\
(
    'e559dd27216db757f4b34d64b8bf789e'
)

maintainer=\
(
    'Ricardo Martins <rasm@fe.up.pt>'
)

requires=\
(
    'zlib/default'
)

configure()
{
    ./configure \
        --target="$cfg_target_canonical" \
        --host="$cfg_target_canonical" \
        --build="$cfg_host_canonical" \
        --prefix="$cfg_dir_rootfs/usr" \
        --disable-ipv6 \
        --disable-locale \
        --disable-debug \
        --disable-iconv \
        --disable-acl-support \
        --disable-xattr-support \
        --with-included-popt
}

build()
{
    $cmd_make
}

target_install()
{
    $cmd_target_strip rsync -o "$cfg_dir_rootfs/usr/bin/rsync" &&
    tar -C "$pkg_dir/fs" --exclude .svn -c -f - . | tar -C "$cfg_dir_rootfs" -x -v -f -
}
