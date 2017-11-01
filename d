[33mcommit 0907fa39e2bea309ca73cfb8aece6069c9e134e5[m
Author: Alfonso Contreras <pon.alfonsoirai@gmail.com>
Date:   Wed Nov 1 13:11:08 2017 -0600

    support for rename command

[1mdiff --git a/Makefile b/Makefile[m
[1mindex da2216d..4344fb7 100644[m
[1m--- a/Makefile[m
[1m+++ b/Makefile[m
[36m@@ -181,6 +181,7 @@[m [mUPROGS=\[m
 	_fibo\[m
 	_shmtest\[m
 	_test_signal\[m
[32m+[m	[32m_rename\[m
 [m
 fs.img: mkfs README $(UPROGS)[m
 	./mkfs fs.img README $(UPROGS)[m
[1mdiff --git a/rename.c b/rename.c[m
[1mnew file mode 100644[m
[1mindex 0000000..ff7c821[m
[1m--- /dev/null[m
[1m+++ b/rename.c[m
[36m@@ -0,0 +1,19 @@[m
[32m+[m[32m#include "types.h"[m
[32m+[m[32m#include "stat.h"[m
[32m+[m[32m#include "user.h"[m
[32m+[m
[32m+[m[32mint[m
[32m+[m[32mmain(int argc, char *argv[])[m
[32m+[m[32m{[m
[32m+[m[32m  if(argc != 3){[m
[32m+[m[32m    printf(2, "Usage: rename old new\n");[m
[32m+[m[32m    exit();[m
[32m+[m[32m  }[m
[32m+[m[32m  if(link(argv[1], argv[2]) < 0){[m
[32m+[m[32m    printf(2, "rename %s %s: failed\n", argv[1], argv[2]);[m
[32m+[m[32m  }[m
[32m+[m[32m  if(unlink(argv[1]) < 0){[m
[32m+[m[32m    printf(2, "rm: %s failed to delete\n", argv[1]);[m
[32m+[m[32m  }[m
[32m+[m[32m  exit();[m
[32m+[m[32m}[m
\ No newline at end of file[m
