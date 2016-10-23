PROG=	overdrive
NOMAN=
SRCS=	main.s sio.s pcm.s effect.s feature.s
COPTS+=	-Wall -Wstrict-prototypes -Wmissing-prototypes -Wpointer-arith -Wundef
LDADD+=	-lsndio -lpthread -lm
.include <bsd.prog.mk>
