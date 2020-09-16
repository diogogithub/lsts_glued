version=\
(
    '1.20200212',
    '2019.07',
    '3.98ubuntu12'
)

url=\
(
    "http://archive.ubuntu.com/ubuntu/pool/multiverse/l/linux-firmware-raspi2/linux-firmware-raspi2_$version.orig.tar.gz",
    "http://archive.ubuntu.com/ubuntu/pool/main/u/u-boot/u-boot_$version+dfsg.orig.tar.xz",
    "http://archive.ubuntu.com/ubuntu/pool/main/f/flash-kernel/flash-kernel_$version.tar.xz"
)

maintainer=\
(
    'Ricardo Martins <rasm@fe.up.pt>'
    'Pedro Gonçalves <pedro@lsts.pt>'
)

md5=\
(
    '5b35887b1026fafe8174f473679d175a',
    '5b35887b1026fafe8174f473679d175a',
    '5b35887b1026fafe8174f473679d175a'
)

target_install()
{
    $cmd_mkdir "$cfg_dir_rootfs/boot"

    $cmd_cp "../$pkg-$version/"* "$cfg_dir_rootfs/boot/"

    tar -C "$pkg_dir/fs" -c -f - . | tar -C "$cfg_dir_rootfs" -x -v -f -
}
