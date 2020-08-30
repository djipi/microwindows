

	.globl OSJAG_Directory
	.globl OSJAG_SeekPosition
	.globl OSJAG_PtrBuffer


	.data
	.even

OSJAG_Directory:
OSJAG_Directory_Deb:
	dc.l	OSJAG_Directory_File1_Info
	dc.l	OSJAG_Directory_File2_Info
	dc.l	OSJAG_Directory_File6_Info
	dc.l	OSJAG_Directory_File7_Info
	dc.l	OSJAG_Directory_File5_Info
	dc.l	OSJAG_Directory_File3_Info
	dc.l	OSJAG_Directory_File4_Info
	dc.l	OSJAG_Directory_File8_Info
	dc.l	OSJAG_Directory_File9_Info
OSJAG_Directory_End:
	dc.l	0

	.even

OSJAG_Directory_File1_Info:
	dc.l	OSJAG_Directory_File1_File
	dc.l	OSJAG_Directory_File1_End-OSJAG_Directory_File1_Deb
	dc.b	"./baseq2/config.cfg",0
OSJAG_Directory_File1_File:
OSJAG_Directory_File1_Deb:
;	.incbin	"./Q2Demo/baseq2/config.cfg"
OSJAG_Directory_File1_End:

	.even

OSJAG_Directory_File2_Info:
	dc.l	OSJAG_Directory_File2_File
	dc.l	OSJAG_Directory_File2_End-OSJAG_Directory_File2_Deb
	dc.b	"./baseq2/default.cfg",0
OSJAG_Directory_File2_File:
OSJAG_Directory_File2_Deb:
;	.incbin	"./Q2Demo/baseq2/default.cfg"
OSJAG_Directory_File2_End:

	.even
	
OSJAG_Directory_File6_Info:
	dc.l	OSJAG_Directory_File6_File
	dc.l	OSJAG_Directory_File6_End-OSJAG_Directory_File6_Deb
	dc.b	"stats.log",0
OSJAG_Directory_File6_File:
OSJAG_Directory_File6_Deb:
;	.incbin	"./Q2Demo/stats.log"
OSJAG_Directory_File6_End:

	.even

OSJAG_Directory_File7_Info:
	dc.l	OSJAG_Directory_File7_File
	dc.l	OSJAG_Directory_File7_End-OSJAG_Directory_File7_Deb
	dc.b	"./baseq2/qconsole.log",0
OSJAG_Directory_File7_File:
OSJAG_Directory_File7_Deb:
;	.incbin	"./Q2Demo/baseq2/qconsole.log"
OSJAG_Directory_File7_End:

	.even

OSJAG_Directory_File5_Info:
	dc.l	OSJAG_Directory_File5_File
	dc.l	OSJAG_Directory_File5_End-OSJAG_Directory_File5_Deb
	dc.b	"./baseq2/autoexec.cfg",0
OSJAG_Directory_File5_File:
OSJAG_Directory_File5_Deb:
;	.incbin	"./Q2Demo/baseq2/autoexec.cfg"
OSJAG_Directory_File5_End:

	.even

OSJAG_Directory_File3_Info:
	dc.l	OSJAG_Directory_File3_File
	dc.l	OSJAG_Directory_File3_End-OSJAG_Directory_File3_Deb
	dc.b	"./baseq2/pics/conchars.pcx",0
OSJAG_Directory_File3_File:
OSJAG_Directory_File3_Deb:
;	.incbin	"./Q2Demo/baseq2/pics/conchars.pcx"
OSJAG_Directory_File3_End:

	.even

OSJAG_Directory_File4_Info:
	dc.l	OSJAG_Directory_File4_File
	dc.l	OSJAG_Directory_File4_End-OSJAG_Directory_File4_Deb
	dc.b	"./baseq2/pics/colormap.pcx",0
OSJAG_Directory_File4_File:
OSJAG_Directory_File4_Deb:
;	.incbin	"./Q2Demo/baseq2/pics/colormap.pcx"
OSJAG_Directory_File4_End:

	.even

OSJAG_Directory_File8_Info:
	dc.l	OSJAG_Directory_File8_File
	dc.l	OSJAG_Directory_File8_End-OSJAG_Directory_File8_Deb
	dc.b	"./baseq2/demos/q2demo1.dm2",0
OSJAG_Directory_File8_File:
OSJAG_Directory_File8_Deb:
;	.incbin	"./Q2Demo/baseq2/demos/q2demo1.dm2"
OSJAG_Directory_File8_End:

	.even

OSJAG_Directory_File9_Info:
	dc.l	OSJAG_Directory_File9_File
	dc.l	OSJAG_Directory_File9_End-OSJAG_Directory_File9_Deb
	dc.b	"./baseq2/maps/demo2.bsp",0
OSJAG_Directory_File9_File:
OSJAG_Directory_File9_Deb:
;	.incbin	"./Q2Demo/baseq2/maps/demo2.bsp"
OSJAG_Directory_File9_End:

	.bss
	.even

OSJAG_SeekPosition:
	ds.l	(OSJAG_Directory_End-OSJAG_Directory_Deb)/4
OSJAG_PtrBuffer:
	ds.l	(OSJAG_Directory_End-OSJAG_Directory_Deb)/4


	.end