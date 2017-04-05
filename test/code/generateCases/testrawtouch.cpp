// testtouch.cpp : Defines the entry point for the application.
//
#include "stdafx.h"
#include <sstream>
#include <string>
#include "testrawtouch.h"
#include "rawtouch.h"
#include "display.h"
#include "testcase.h"
#include "processinfo.h"


using namespace MC;

#define MAX_LOADSTRING 100

// Global Variables:
HINSTANCE hInst;                                // current instance
WCHAR szTitle[MAX_LOADSTRING];                  // The title bar text
WCHAR szWindowClass[MAX_LOADSTRING];            // the main window class name
CDisplay display;

const UINT UWM_RAWINPUT = RegisterWindowMessage(L"CC667201-7CE9-40c5-80A9-1DA48E4014C3");
const UINT UWM_RAWINPUT_1BACK = RegisterWindowMessage(L"CC667201-7CE9-40c5-80A9-1DA48E4014C4");

const LPWSTR sMemoryFileName = _T("D9287E91-6F9E-45FA-89C7-D392F73A0F2F");
HANDLE hFileMapping = NULL;
void * pViewOfFile = NULL;
HWND g_hWnd = NULL;

// Forward declarations of functions included in this code module:
ATOM                MyRegisterClass(HINSTANCE hInstance);
BOOL                InitInstance(HINSTANCE, int);
LRESULT CALLBACK    WndProc(HWND, UINT, WPARAM, LPARAM);
INT_PTR CALLBACK    About(HWND, UINT, WPARAM, LPARAM);

int APIENTRY wWinMain(_In_ HINSTANCE hInstance,
                     _In_opt_ HINSTANCE hPrevInstance,
                     _In_ LPWSTR    lpCmdLine,
                     _In_ int       nCmdShow)
{
    UNREFERENCED_PARAMETER(hPrevInstance);
    UNREFERENCED_PARAMETER(lpCmdLine);

    // TODO: Place code here.

    // Initialize global strings
    LoadStringW(hInstance, IDS_APP_TITLE, szTitle, MAX_LOADSTRING);
    LoadStringW(hInstance, IDC_TESTTOUCH, szWindowClass, MAX_LOADSTRING);
    MyRegisterClass(hInstance);

    // Perform application initialization:
    if (!InitInstance (hInstance, nCmdShow))
    {
        return FALSE;
    }

    HACCEL hAccelTable = LoadAccelerators(hInstance, MAKEINTRESOURCE(IDC_TESTTOUCH));

	if (wcscmp(lpCmdLine , L"hide") == 0)
	{
		// hide window
		// MessageBox(g_hWnd, L"hide window", L"", 0);
	}
	else
	{
		ShowWindow(g_hWnd, SW_SHOW);
	}
    MSG msg;

	
    // Main message loop:
    while (GetMessage(&msg, NULL, 0, 0))
    {
        if (!TranslateAccelerator(msg.hwnd, hAccelTable, &msg))
        {
            TranslateMessage(&msg);
            DispatchMessage(&msg);
        }
    }

    return (int) msg.wParam;
}

//
//  FUNCTION: MyRegisterClass()
//
//  PURPOSE: Registers the window class.
//
ATOM MyRegisterClass(HINSTANCE hInstance)
{
    WNDCLASSEXW wcex;

    wcex.cbSize = sizeof(WNDCLASSEX);

    wcex.style          = CS_HREDRAW | CS_VREDRAW;
    wcex.lpfnWndProc    = WndProc;
    wcex.cbClsExtra     = 0;
    wcex.cbWndExtra     = 0;
    wcex.hInstance      = hInstance;
    wcex.hIcon          = LoadIcon(hInstance, MAKEINTRESOURCE(IDI_TESTTOUCH));
    wcex.hCursor        = LoadCursor(NULL, IDC_ARROW);
    wcex.hbrBackground  = (HBRUSH)(COLOR_WINDOW+1);
    wcex.lpszMenuName   = MAKEINTRESOURCEW(IDC_TESTTOUCH);
    wcex.lpszClassName  = szWindowClass;
    wcex.hIconSm        = LoadIcon(wcex.hInstance, MAKEINTRESOURCE(IDI_SMALL));

    return RegisterClassExW(&wcex);
}

void Initialize()
{
	hFileMapping = CreateFileMapping(
		INVALID_HANDLE_VALUE,
		NULL,
		PAGE_READWRITE,
		0,
		sizeof(RAWTOUCHDATA) * MC::CDisplay::MAX_CONTACT_NUMBER,
		sMemoryFileName);
	DWORD dwError = GetLastError();
	if (!hFileMapping)
	{
		// error create file mapping
		PostQuitMessage(0);
	}
	else
	{
		pViewOfFile = MapViewOfFile(
			hFileMapping,
			FILE_MAP_ALL_ACCESS,
			0,
			0,
			0);
		if (!pViewOfFile)
		{
			// error mapviewoffile
			PostQuitMessage(0);
		}
	}
	if (dwError == ERROR_ALREADY_EXISTS)
	{

	}

	CRawTouch* pRawTouch = new CRawTouch(g_hWnd);
	if (pRawTouch->Initialize(CRawTouch::MODE::MODE_MESSAGE) != ERROR_SUCCESS)
		//if (pRawTouch->Initialize(CRawTouch::MODE::MODE_BUFFER) != ERROR_SUCCESS)
	{
		MessageBox(g_hWnd, L"No Windows Precision Touchpad is attached", L"Error", MB_OK);
	}
}

//
//   FUNCTION: InitInstance(HINSTANCE, int)
//
//   PURPOSE: Saves instance handle and creates main window
//
//   COMMENTS:
//
//        In this function, we save the instance handle in a global variable and
//        create and display the main program window.
//
BOOL InitInstance(HINSTANCE hInstance, int nCmdShow)
{
   hInst = hInstance; // Store instance handle in our global variable

   HWND hWnd = CreateWindowW(szWindowClass, szTitle, WS_OVERLAPPEDWINDOW,
      CW_USEDEFAULT, 0, CW_USEDEFAULT, 0, NULL, NULL, hInstance, NULL);

   if (!hWnd)
   {
      return FALSE;
   }
   g_hWnd = hWnd;

   Initialize();

   

   // ShowWindow(hWnd, nCmdShow);
   UpdateWindow(hWnd);
   
   return TRUE;
}

//
//  FUNCTION: WndProc(HWND, UINT, WPARAM, LPARAM)
//
//  PURPOSE:  Processes messages for the main window.
//
//  WM_COMMAND  - process the application menu
//  WM_PAINT    - Paint the main window
//  WM_DESTROY  - post a quit message and return
//
//
LRESULT CALLBACK WndProc(HWND hWnd, UINT message, WPARAM wParam, LPARAM lParam)
{
    switch (message)
    {
	case WM_CREATE:
		{
				
		}
		break;

    case WM_COMMAND:
        {
            int wmId = LOWORD(wParam);
            // Parse the menu selections:
            switch (wmId)
            {
            case IDM_ONEFINGER:
			{
				// DialogBox(hInst, MAKEINTRESOURCE(IDD_ABOUTBOX), hWnd, About);
				testcase example;
				RAWTOUCHDATA * m_RawTouchData = (RAWTOUCHDATA *)pViewOfFile;
				example.numberKeyBoardTests(4, m_RawTouchData);
				break;
			}
			case IDM_TWOFINGER:
			{
				testcase example;
				RAWTOUCHDATA * m_RawTouchData = (RAWTOUCHDATA *)pViewOfFile;
				example.numberKeyBoardTests(21, m_RawTouchData);
				break;
			}
			case ID_HELP_TEST:
			{
				testcase example;
				//example.generateTestcase(example.oneTouchLittleMovData(), "NumFunOneFingerLitterMov.txt");
				//example.generateTestcase(example.oneTouchData(), "NumFunOneFinger.txt");
				//example.generateTestcase(example.IntellengentModeTwoFingerOneAreaTest(), "NumFunTwoFingerOneArea.txt");
				//example.generateTestcase(example.IntellengentModeTwoFingerTwoAreaTest(10), "NumFunTwoFingerTwoArea.txt");
				//example.generateTestcase(example.GeneralModeLightStartTrigger(10), "GeneralModeLightStartTrigger.txt");
				//example.generateTestcase(example.GeneralModeLightStartCancle(10), "GeneralModeLightStartCancle.txt");
				//example.generateTestcase(example.GeneralModeLightStartTriggerFail(10), "GeneralModeLightStartTriggerFail.txt");
				//example.generateTestcase(example.GeneralModeLightStartTwoFingerSameTD(10), "GeneralModeLightStartTwoFingerSameTD.txt");
				//example.generateTestcase(example.GeneralModeLightStartTwoFingerSameTDiffD(10), "GeneralModeLightStartTwoFingerSameTDiffD.txt");
				//example.generateTestcase(example.GeneralModeLightStartTwoFingerDiffTSameD(10), "GeneralModeLightStartTwoFingerDiffTSameD.txt");
				//example.generateTestcase(example.GeneralModeLightStartoneMoveOneTouch(10), "GeneralModeLightStartoneMoveOneTouch.txt");
				//example.generateTestcase(example.generalModeGestureA("aFinal.txt", "a"), "generalModeGestureA.txt");
				//example.generateTestcase(example.generalModeGestureA("cFinal.txt", "c"), "generalModeGestureC.txt");
				//example.generateTestcase(example.generalModeGestureA("dFinal.txt", "d"), "generalModeGestureD.txt");
				//example.generateTestcase(example.generalModeGestureA("vFinal.txt", "v"), "generalModeGestureV.txt");
				//example.generateTestcase(example.generalModeGestureA("oFinal.txt", "o"), "generalModeGestureO.txt");
				//example.generateTestcase(example.generalModeGestureA("wFinal.txt", "w"), "generalModeGestureW.txt");
				//example.generateTestcase(example.generalModeGestureA("fFinal.txt", "f"), "generalModeGestureF.txt");
				//example.generateTestcase(example.generalModeGestureA("jFinal.txt", "j"), "generalModeGestureJ.txt");

				//example.generateTestcase(example.generalModeGestureA("lFinal.txt", "l"), "generalModeGestureL.txt");
				//example.generateTestcase(example.generalModeGestureA("tFinal.txt", "t"), "generalModeGestureT.txt");
				//example.generateTestcase(example.generalModeGestureA("zFinal.txt", "z"), "generalModeGestureZ.txt");
				//example.generateTestcase(example.generalModeGestureA("mFinal.txt", "m"), "generalModeGestureM.txt");
				//examplep.generateTestcase(example.generalModeGestureA("nFinal.txt", "n"), "generalModeGestureN.txt");
				//example.generateTestcase(example.generalModeGestureA("sFinal.txt", "s"), "generalModeGestureS.txt");
				//example.generateTestcase(example.generalModeGestureA("eFinal.txt", "e"), "generalModeGestureE.txt");
				//单次频繁操作
				//example.SingerFuncFrequentOptNum(100, "SingerFuncFrequentOptNum100.txt");
				//example.SingerFuncFrequentLightStartTrigger(100, "SingerFuncFrequentLightStartTrigger100.txt");
				//example.SingerFuncFrequentOptGesture("aFinal.txt", "a", 100, "SigFuncFrequentOptGestureA100.txt");
				//多次交叉操作
				//example.MultiFuncFrequentOptNumGestureLightStartTrigger("aFinal.txt", "a", 20, "MultiFuncFrequentOptNumGestureLightStartTrigger20.txt");

				//pid info
				processinfo testpid = processinfo();
				testpid.GetProcess();

			}
            case IDM_EXIT:
                DestroyWindow(hWnd);
                break;
            default:
                return DefWindowProc(hWnd, message, wParam, lParam);
            }
        }
        break;

    case WM_PAINT:
        {
            PAINTSTRUCT ps;
            HDC hdc = BeginPaint(hWnd, &ps);
            
			display.Update(hdc);

            EndPaint(hWnd, &ps);
        }
        break;

	case WM_RAWTOUCH:
		{
			auto_ptr<CRawTouchDataVector> pRawTouchDataVector(reinterpret_cast<CRawTouchDataVector*>(wParam));
			
			for (size_t nIndex = 0; nIndex < pRawTouchDataVector->size(); nIndex++)
			{
				auto_ptr<RAWTOUCHDATA> pRawTouchData(pRawTouchDataVector->at(nIndex));
				
				if (pRawTouchData.get() != NULL)
				{
					if (pRawTouchData->ulContactId == 0 && pRawTouchData->lX == 0 && pRawTouchData->lY == 0 && pRawTouchData->bTipOn == 0)
					{
						// 过滤掉全部为零的数据，这样的数据肯定是无效的，因为手指在离开之后会发送tip为0但是x，y不为零的数据
					}
					else
					{
						// 如果ContactID不为零，必然是正常数据||如果有接触标志位也说明是正常的数据||
						display.UpdateRawTouchData(pRawTouchData.get());
						//////////////////////////////////////////////////////////////////////////
						// HANPEICONG
						if (pRawTouchData.get()->ulContactId >= 0 &&
							pRawTouchData.get()->ulContactId < MC::CDisplay::MAX_CONTACT_NUMBER)
						{
							RAWTOUCHDATA * m_RawTouchData = (RAWTOUCHDATA *)pViewOfFile;
							CopyMemory(&m_RawTouchData[pRawTouchData.get()->ulContactId], pRawTouchData.get(), sizeof(RAWTOUCHDATA));
							
						}
					}
				}
			}
			InvalidateRect(hWnd, NULL, TRUE);
			UpdateWindow(hWnd);

			PostMessage(HWND_BROADCAST, UWM_RAWINPUT, -1, 0);
		}
		break;	
    case WM_DESTROY:
        PostQuitMessage(0);
        break;

    default:
		//wParam lParam
		if (message == UWM_RAWINPUT_1BACK && wParam < 20)
		{
			testcase example;
			RAWTOUCHDATA * m_RawTouchData = (RAWTOUCHDATA *)pViewOfFile;
			bool res = example.checkResult(wParam, lParam);
			example.remarkResult(wParam, res);
			Sleep(100);
			example.numberKeyBoardTests(wParam+1, m_RawTouchData);
		}
		if (message == UWM_RAWINPUT_1BACK && wParam == 20)
		{
			testcase example;
			bool res = example.checkResult(wParam, lParam);
			example.remarkResult(wParam, res);
		}
		if (message == UWM_RAWINPUT_1BACK && wParam == 21)
		{
			std::stringstream ss;
			ss << wParam;
			std::string temp;
			ss >> temp;
			OutputDebugStringA(temp.c_str());
			OutputDebugStringA(" ********************21******************** ");
			ss.clear();
			ss.str("");
			ss << lParam;
			ss >> temp;
			OutputDebugStringA(temp.c_str());
			OutputDebugStringA("\n");
		}/*if (message == UWM_RAWINPUT_1BACK && wParam > 20 && wParam < 26)
		{
			testcase example;
			bool res = example.checkResult(wParam, lParam);
			example.remarkResult(wParam, res);
			Sleep(100);
			RAWTOUCHDATA * m_RawTouchData = (RAWTOUCHDATA *)pViewOfFile;
			example.numberKeyBoardTests(wParam + 1, m_RawTouchData);
		}*/
        return DefWindowProc(hWnd, message, wParam, lParam);
    }
    return 0;
}

// Message handler for about box.
INT_PTR CALLBACK About(HWND hDlg, UINT message, WPARAM wParam, LPARAM lParam)
{
    UNREFERENCED_PARAMETER(lParam);
    switch (message)
    {
    case WM_INITDIALOG:
        return (INT_PTR)TRUE;

    case WM_COMMAND:
        if (LOWORD(wParam) == IDOK || LOWORD(wParam) == IDCANCEL)
        {
            EndDialog(hDlg, LOWORD(wParam));
            return (INT_PTR)TRUE;
        }
        break;
    }
    return (INT_PTR)FALSE;
}
