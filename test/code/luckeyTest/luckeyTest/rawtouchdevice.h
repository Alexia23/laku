#pragma once
#include "windows.h"

namespace MC
{
	typedef struct _RAWTOUCHDATA
	{
		ULONG	ulContactId;
		LONG	lX;
		LONG	lY;
		BYTE	bTipOn; // 1: On; 0: Off
		BYTE	bContactCount; // Total number of contacts to be reported in a given report
		BYTE    bButton;
		WORD	wXMax;
		WORD	wXMin;
		WORD	wYMax;
		WORD	wYMin;
	} RAWTOUCHDATA, *LPRAWTOUCHDATA;
}