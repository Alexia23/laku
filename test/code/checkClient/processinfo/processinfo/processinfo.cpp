// processinfo.cpp : �������̨Ӧ�ó������ڵ㡣
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
	HANDLE hProcess = CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);    //�������̿���

	if (INVALID_HANDLE_VALUE == hProcess)
	{
		printf("��ȡ������Ϣʧ�ܣ�����\n");
		return FALSE;
	}

	//�ɹ���ȡ������Ϣ
	PROCESSENTRY32 pe32;
	pe32.dwSize = sizeof(PROCESSENTRY32);

	BOOL moreProc = Process32First(hProcess, &pe32);

	while (moreProc)   //ö�����н���
	{
		
		std::wstringstream wss;
		char* temp = "LuckeyApp.exe";
		wss << temp;
		if (wcscmp(pe32.szExeFile, wss.str().c_str())==0)
		{
			_tprintf(_T("�������ƣ�%s\n"), pe32.szExeFile);
			_tprintf(_T("����CPU��%s\n"), pe32.szExeFile);
			_tprintf(_T("�����ڴ棺%s\n"), pe32.cntUsage);
			_tprintf(_T("����Ӳ�̣�%s\n"), pe32.szExeFile);
			break;
		}


		moreProc = Process32Next(hProcess, &pe32);
	}

	CloseHandle(hProcess);        //�ͷŽ��̿���

	return TRUE;
}


int main(int argc, char* argv[])
{
	setlocale(LC_ALL, "");
	GetProcess();
	system("pause");
	return 0;
}
