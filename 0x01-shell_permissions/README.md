 su -l betty
whoami
group
chown betty hello
touch
chmod u+x hello
chmod u=rwx,g=r+x,o=r-- hello
chmod a+x hello
chmod 007 hello
chmod 753 hello
chmod --reference=olleh hello
find ./ -type d -exec chmod 755 {} +
mkdir -m 751 my_dir
chgrp school hello
chown vincent:staff *
chown --from=guillaume betty hello
telnet towel.blinkenlights.nl
