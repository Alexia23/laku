// processinfo.cpp : 定义控制台应用程序的入口点。
//

#include "stdafx.h"



#include <Windows.h>
#include <TlHelp32.h>
#include <stdio.h>
#include <tchar.h>
#include <locale.h>
#include <sstream>

BOOL GetProcess()
{
	HANDLE hProcess = CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);    //建立进程快照

	if (INVALID_HANDLE_VALUE == hProcess)
	{
		printf("获取进程信息失败！！！\n");
		return FALSE;
	}

	//成功获取进程信息
	PROCESSENTRY32 pe32;
	pe32.dwSize = sizeof(PROCESSENTRY32);

	BOOL moreProc = Process32First(hProcess, &pe32);

	while (moreProc)   //枚举所有进程
	{
		
		std::wstringstream wss;
		char* temp = "LuckeyApp.exe";
		wss << temp;
		if (wcscmp(pe32.szExeFile, wss.str().c_str())==0)
		{
			_tprintf(_T("进程名称：%s\n"), pe32.szExeFile);
			_tprintf(_T("进程CPU：%s\n"), pe32.szExeFile);
			_tprintf(_T("进程内存：%s\n"), pe32.cntUsage);
			_tprintf(_T("进程硬盘：%s\n"), pe32.szExeFile);
			break;
		}


		moreProc = Process32Next(hProcess, &pe32);
	}

	CloseHandle(hProcess);        //释放进程快照

	return TRUE;
}


int main(int argc, char* argv[])
{
	setlocale(LC_ALL, "");
	GetProcess();
	system("pause");
	return 0;
}
