#include "stdafx.h"
#include "testcase.h"
#include "rawtouchdevice.h"
#include "windows.h"
#include<fstream>
#include "json.h"    

using namespace std;
const UINT UWM_RAWINPUT_1 = RegisterWindowMessage(L"CC667201-7CE9-40c5-80A9-1DA48E4014C3");
testcase::testcase()
{
}


testcase::~testcase()
{
}


void testcase::onePos(int x, int y, int caseIndex, MC::RAWTOUCHDATA * m_RawTouchData)
{
	MC::RAWTOUCHDATA *testdata = new MC::RAWTOUCHDATA();
	testdata->ulContactId = 0;
	testdata->lX = x;
	testdata->lY = y;
	testdata->bTipOn = 1;
	testdata->bContactCount = 1;
	testdata->bButton = 0;
	testdata->wXMax = 1020;
	testdata->wXMin = 0;
	testdata->wYMax = 620;
	testdata->wYMin = 0;
	CopyMemory(&m_RawTouchData[testdata->ulContactId], testdata, sizeof(MC::RAWTOUCHDATA));
	PostMessage(HWND_BROADCAST, UWM_RAWINPUT_1, caseIndex, 0);
	Sleep(100);
	testdata->bTipOn = 0;
	CopyMemory(&m_RawTouchData[testdata->ulContactId], testdata, sizeof(MC::RAWTOUCHDATA));
	PostMessage(HWND_BROADCAST, UWM_RAWINPUT_1, caseIndex, 0);
}

std::vector<MC::RAWTOUCHDATA> testcase::oneFingerPack(int x, int y, int XLen, int YLen)
{
	vector<MC::RAWTOUCHDATA> datas;
	MC::RAWTOUCHDATA testdata1, testdata2;
	testdata1.ulContactId = 0;
	testdata1.lX = x;
	testdata1.lY = y;
	testdata1.bTipOn = 1;
	testdata1.bContactCount = 1;
	testdata1.bButton = 0;  //左键
	testdata1.wXMax = XLen;
	testdata1.wXMin = 0;
	testdata1.wYMax = YLen;
	testdata1.wYMin = 0;

	testdata2.ulContactId = 1;
	testdata2.lX = 0;
	testdata2.lY = 0;
	testdata2.bTipOn = 0;
	testdata2.bContactCount = 1;
	testdata2.bButton = 0;
	testdata2.wXMax = XLen;
	testdata2.wXMin = 0;
	testdata2.wYMax = YLen;
	testdata2.wYMin = 0;


	datas.push_back(testdata1);
	datas.push_back(testdata2);
	testdata2.ulContactId = 2;
	datas.push_back(testdata2);
	testdata2.ulContactId = 3;
	datas.push_back(testdata2);
	testdata2.ulContactId = 4;
	datas.push_back(testdata2);

	testdata1.bTipOn = 0;
	datas.push_back(testdata1);
	testdata2.ulContactId = 1;
	datas.push_back(testdata2);
	testdata2.ulContactId = 2;
	datas.push_back(testdata2);
	testdata2.ulContactId = 3;
	datas.push_back(testdata2);
	testdata2.ulContactId = 4;
	datas.push_back(testdata2);
	return datas;
}

void testcase::twoFinger(int x1, int y1, int x2, int y2, int caseIndex, MC::RAWTOUCHDATA * m_RawTouchData)
{
	MC::RAWTOUCHDATA *finger1 = new MC::RAWTOUCHDATA();
	finger1->ulContactId = 0;
	finger1->lX = x1;
	finger1->lY = y1;
	finger1->bTipOn = 1;
	finger1->bContactCount = 2;
	finger1->bButton = 0;
	finger1->wXMax = 1019;
	finger1->wXMin = 0;
	finger1->wYMax = 620;
	finger1->wYMin = 0;
	CopyMemory(&m_RawTouchData[finger1->ulContactId], finger1, sizeof(MC::RAWTOUCHDATA));
	MC::RAWTOUCHDATA *finger2 = new MC::RAWTOUCHDATA();
	finger2->ulContactId = 0;
	finger2->lX = x2;
	finger2->lY = y2;
	finger2->bTipOn = 1;
	finger2->bContactCount = 2;
	finger2->bButton = 0;
	finger2->wXMax = 1020;
	finger2->wXMin = 0;
	finger2->wYMax = 620;
	finger2->wYMin = 0;
	CopyMemory(&m_RawTouchData[finger2->ulContactId], finger2, sizeof(MC::RAWTOUCHDATA));
	PostMessage(HWND_BROADCAST, UWM_RAWINPUT_1, caseIndex, 0);
	Sleep(100);

	finger1->bTipOn = 0;
	finger2->bTipOn = 0;
	CopyMemory(&m_RawTouchData[finger1->ulContactId], finger1, sizeof(MC::RAWTOUCHDATA));
	CopyMemory(&m_RawTouchData[finger2->ulContactId], finger2, sizeof(MC::RAWTOUCHDATA));
	PostMessage(HWND_BROADCAST, UWM_RAWINPUT_1, caseIndex, 0);
}
enum caseName {
	//0-5, 6-21
	FUNC1, FUNC2, FUNC3, FUNC4, FUNC5, // 功能区域 
	DIV, NUM7, NUM8, NUM9,  // 数字区域
	MULT, NUM4, NUM5, NUM6,
	SUB, NUM1, NUM2, NUM3,
	PLUS, DOT, NUM0, ENTER,
	FUNC1_DIV, DIV_NUM7, NUM7_8, FUNC1_2, DIV_SUB, NUM7_4
};

//单指测试
void testcase::numberKeyBoardTests(int caseIndex, MC::RAWTOUCHDATA * m_RawTouchData)
{
	int x, y, x2, y2;
	switch (caseIndex)
	{
	case FUNC1:
		x = 50, y = 550;
		break;
	case FUNC2:
		x = 50, y = 400;
		break;
	case FUNC3:
		x = 50, y = 300;
		break;
	case FUNC4:
		x = 50, y = 200;
		break;
	case FUNC5:
		x = 50, y = 100;
		break;
	case DIV:
		changeMode();
		x = 150, y = 70;
		break;
	case NUM7:
		x = 400, y = 70;
		break;
	case NUM8:
		x = 600, y = 70;
		break;
	case NUM9:
		x = 800, y = 70;
		break;

	case MULT:
		x = 150, y = 200;
		break;
	case NUM4:
		x = 400, y = 200;
		break;
	case NUM5:
		x = 600, y = 200;
		break;
	case NUM6:
		x = 800, y = 200;
		break;

	case SUB:
		x = 150, y = 400;
		break;
	case NUM1:
		x = 400, y = 400;
		break;
	case NUM2:
		x = 600, y = 400;
		break;
	case NUM3:
		x = 800, y = 400;
		break;

	case PLUS:
		x = 150, y = 600;
		break;
	case DOT:
		x = 400, y = 600;
		break;
	case NUM0:
		x = 600, y = 600;
		break;
	case ENTER:
		x = 800, y = 600;
		break;
	case FUNC1_DIV:
		x = 50, y = 550;
		x2 = 150, y2 = 70;
		break;
	case DIV_NUM7:
		x = 150, y = 70;
		x2 = 400, y2 = 70;
		break;
	case NUM7_8:
		x = 400, y = 70;
		x2 = 600, y2 = 70;
		break;
	case FUNC1_2:
		x = 50, y = 550;
		x2 = 50, y2 = 400;
		break;
	case DIV_SUB:
		x = 150, y = 70;
		x2 = 150, y2 = 400;
		break;
	case NUM7_4:
		x = 400, y = 70;
		x2 = 400, y2 = 200;
		break;
	default:
		break;
	}
	if (caseIndex < 21)
		onePos(x, y, caseIndex, m_RawTouchData);
	else
		twoFinger(x, y, x2, y2, caseIndex, m_RawTouchData);
}
void testcase::changeMode()
{
	keybd_event(VK_MENU, 0, 0, 0);
	keybd_event('X', 0, 0, 0);
	keybd_event(VK_MENU, 0, KEYEVENTF_KEYUP, 0);
	keybd_event('X', 0, KEYEVENTF_KEYUP, 0);
}

void testcase::posBorder(int* xMins, int *xMaxs, int* yMins, int* yMaxs)
{
	int XLen = 1019, YLen = 620;
	for (int i = 0; i < 4; i++)
	{
		for (int j = 0; j < 4; j++)
		{
			xMins[i * 4 + j] = XLen*0.1 + j*(XLen*0.9*0.25);
			xMaxs[i * 4 + j] = XLen*0.1 + (j + 1)*(XLen*0.9*0.25);;
			yMaxs[i * 4 + j] = YLen - i*(YLen*0.25);
			yMins[i * 4 + j] = YLen - (i + 1)*(YLen*0.25);
		}
	}
	for (int i = 0; i < 5; i++)
	{
		xMins[20 - i] = 0;
		xMaxs[20 - i] = XLen*0.1;
		yMins[20 - i] = i*(YLen*0.2);
		yMaxs[20 - i] = (i + 1)*(YLen*0.2);
	}
}

void testcase::lightingStartBorder(int * xMins, int * xMaxs, int * yMins, int * yMaxs)
{
	int XLen = 1019, YLen = 620;

	float motivate = 0.05, middle = 0.03, invalidArea = 0.92, verticalBorder = 0.08;
	xMins[0] = 0;
	xMaxs[0] = XLen*motivate;
	yMins[0] = YLen*verticalBorder;
	yMaxs[0] = YLen - YLen*verticalBorder;

	xMins[1] = XLen*motivate;
	xMaxs[1] = XLen*(motivate + middle);
	yMins[1] = YLen*verticalBorder;
	yMaxs[1] = YLen - YLen*verticalBorder;

	xMins[2] = XLen*(motivate + middle);
	xMaxs[2] = XLen;
	yMins[2] = YLen*verticalBorder;
	yMaxs[2] = YLen - YLen*verticalBorder;

	xMins[3] = 0;
	xMaxs[3] = XLen;
	yMins[3] = 0;
	yMaxs[3] = YLen*verticalBorder;

	xMins[4] = 0;
	xMaxs[4] = XLen;
	yMins[4] = YLen - YLen*verticalBorder;
	yMaxs[4] = YLen;
}

/*
PLUS , DOT	, NUM0 , ENTER , 0-3
SUB , NUM1 , NUM2 , NUM3 ,   4-7
MULT , NUM4 , NUM5 , NUM6 ,  8-11
DIV ,NUM7 , NUM8 , NUM9 ,  // 数字区域 12-15
FUNC1 , FUNC2 , FUNC3 , FUNC4 , FUNC5 , FUNC6 , FUNC7 , FUNC8 , FUNC9 , FUNC10 , // 功能区域 16-25
NUMBER_MODE , CUSTOMIZE_MODE , BACKSPACE ,  // 切换区域
EMPTY , // 无效区域
SWITCH_KEY , // 循环切换按键
HANDWRITING_KEY , // 手写虚拟按键,用于和其它按键区分
TAP_KEY , // 单击虚拟按键
MOVE_KEY , // 鼠标移动虚拟按键
*/
bool testcase::checkResult(int caseIndex, int testOutput)
{
	bool res = false;
	switch (caseIndex)
	{
	case FUNC1:
		if (testOutput == 16)
			res = true;
		break;
	case FUNC2:
		if (testOutput == 17)
			res = true;
		break;
	case FUNC3:
		if (testOutput == 18)
			res = true;
		break;
	case FUNC4:
		if (testOutput == 19)
			res = true;
		break;
	case FUNC5:
		if (testOutput == 20)
			res = true;
		break;
	case DIV:
		if (testOutput == 12)
			res = true;
		break;
	case NUM7:
		if (testOutput == 13)
			res = true;
		break;
	case NUM8:
		if (testOutput == 14)
			res = true;
		break;
	case NUM9:
		if (testOutput == 15)
			res = true;
		break;

	case MULT:
		if (testOutput == 8)
			res = true;
		break;
	case NUM4:
		if (testOutput == 9)
			res = true;
		break;
	case NUM5:
		if (testOutput == 10)
			res = true;
		break;
	case NUM6:
		if (testOutput == 11)
			res = true;
		break;

	case SUB:
		if (testOutput == 4)
			res = true;
		break;
	case NUM1:
		if (testOutput == 5)
			res = true;
		break;
	case NUM2:
		if (testOutput == 6)
			res = true;
		break;
	case NUM3:
		if (testOutput == 7)
			res = true;
		break;

	case PLUS:
		if (testOutput == 0)
			res = true;
		break;
	case DOT:
		if (testOutput == 1)
			res = true;
		break;
	case NUM0:
		if (testOutput == 2)
			res = true;
		break;
	case ENTER:
		if (testOutput == 3)
			res = true;
		break;
	default:
		break;
	}
	return res;
}

void testcase::remarkResult(int caseIndex, bool result)
{
	std::ofstream res;
	res.open("testresult.txt", std::ios::app);
	if (res.is_open())
	{
		res << "testcase" << caseIndex << ": " << result << std::endl;
		res.close();
	}
	else
	{
		OutputDebugStringA("can not open the testresult.txt.");
	}
}



void testcase::generateTestcase(std::vector<testcase> cases, std::string casefilename)
{
	Json::Value  datas;
	Json::Value  onecase, onetouchdata;
	std::vector<std::string> keys;
	keys.resize(16);
	keys[0] = "Name";
	keys[1] = "Description";
	keys[2] = "TouchData";
	keys[3] = "ulContactId";
	keys[4] = "lX";
	keys[5] = "lY";
	keys[6] = "bTipOn";
	keys[7] = "bContactCount";
	keys[8] = "bButton";
	keys[9] = "wXMax";
	keys[10] = "wXMin";
	keys[11] = "wYMax";
	keys[12] = "wYMin";
	keys[13] = "Result";
	keys[14] = "Mode";
	keys[15] = "Type";
	for (int i = 0; i < cases.size(); i++)
	{
		onecase.clear();
		onecase[keys[0]] = cases[i].name;
		onecase[keys[1]] = cases[i].desp;
		onecase[keys[14]] = cases[i].mode;
		onecase[keys[15]] = cases[i].type;
		for (int j = 0; j < cases[i].RawTouchDatas.size(); j++)
		{
			onetouchdata.clear();
			onetouchdata[keys[3]] = (int)cases[i].RawTouchDatas[j].ulContactId;
			onetouchdata[keys[4]] = (int)cases[i].RawTouchDatas[j].lX;
			onetouchdata[keys[5]] = (int)cases[i].RawTouchDatas[j].lY;
			onetouchdata[keys[6]] = (int)cases[i].RawTouchDatas[j].bTipOn;
			onetouchdata[keys[7]] = (int)cases[i].RawTouchDatas[j].bContactCount;
			onetouchdata[keys[8]] = (int)cases[i].RawTouchDatas[j].bButton;
			onetouchdata[keys[9]] = (int)cases[i].RawTouchDatas[j].wXMax;
			onetouchdata[keys[10]] = (int)cases[i].RawTouchDatas[j].wXMin;
			onetouchdata[keys[11]] = (int)cases[i].RawTouchDatas[j].wYMax;
			onetouchdata[keys[12]] = (int)cases[i].RawTouchDatas[j].wYMin;
			onecase[keys[2]].append(onetouchdata);
		}
		onecase[keys[13]] = cases[i].res;
		datas.append(onecase);
	}
	std::string out = datas.toStyledString();
	std::ofstream fout(casefilename.data(), ios::app);
	fout << out;
	fout.close();
}


void randomPos(int xMin, int xMax, int yMin, int yMax, int* x, int* y)
{
	*x = xMin + 1 + rand() % (xMax - xMin - 1);
	*y = yMin + 1 + rand() % (yMax - yMin - 1);
}

std::vector<testcase> testcase::oneTouchData()
{
	vector<testcase> cases;
	int XLen = 1019, YLen = 620;
	int xMins[21], xMaxs[21], yMins[21], yMaxs[21], x, y;
	MC::RAWTOUCHDATA testdata;
	testcase onecase;
	posBorder(xMins, xMaxs, yMins, yMaxs);
	for (int i = 0; i < 21; i++)
	{
		randomPos(xMins[i], xMaxs[i], yMins[i], yMaxs[i], &x, &y);
		onecase.RawTouchDatas = oneFingerPack(x, y, XLen, YLen);
		onecase.name = "OneFingerNum";
		onecase.desp = "intelligent mode num test when one finger in test area";
		onecase.mode = "Numpad";
		onecase.res = to_string(i);
		onecase.type = "0";
		cases.push_back(onecase);
	}

	return cases;
}

void testcase::SingerFuncFrequentOptNum(int num, char* filename)
{
	vector<testcase> cases;
	for (int i = 0; i < num; i++)
	{
		cases = oneTouchData();
		generateTestcase(cases, filename);
	}
}

void testcase::SingerFuncFrequentOptGesture(char * filename, char* result, int num, char* dstfilename)
{
	vector<testcase> cases;
	cases = generalModeGestureA(filename, result);
	for (int i = 0; i < num; i++)
	{
		generateTestcase(cases, dstfilename);
	}
}

void testcase::SingerFuncFrequentLightStartTrigger(int num, char * filename)
{

	vector<testcase> cases;
	int XLen = 1019, YLen = 620;
	int xMins[21], xMaxs[21], yMins[21], yMaxs[21];
	int x1, y1, x2, y2, m, n, p;
	MC::RAWTOUCHDATA testdata;
	testcase onecase;
	lightingStartBorder(xMins, xMaxs, yMins, yMaxs);

	for (int i = 0; i < num; i++)
	{
		m = 0; n = 2;
		randomPos(xMins[m], xMaxs[m], yMins[m], yMaxs[m], &x1, &y1);
		randomPos(xMins[n], xMaxs[n], yMins[n], yMaxs[n], &x2, &y2);
		onecase.RawTouchDatas = oneFingerMovPack(x1, y1, x2, y2, XLen, YLen);
		onecase.name = "GeneralModeLightStartTrigger";
		onecase.desp = "Touchpad mode num test when one finger from motivation to invalid area";
		onecase.res = "0 1";
		onecase.mode = "Touchpad";
		onecase.type = "1";
		cases.push_back(onecase);
		generateTestcase(cases, filename);
		cases.clear();
	}
}

void testcase::MultiFuncFrequentOptNumGestureLightStartTrigger(char * srcfilename, char* result, int num, char * filename)
{
	vector<testcase> cases;
	int XLen = 1019, YLen = 620;
	int xMins[21], xMaxs[21], yMins[21], yMaxs[21], x, y;
	MC::RAWTOUCHDATA testdata;
	testcase onecase;
	posBorder(xMins, xMaxs, yMins, yMaxs);
	int x1, y1, x2, y2, m, n;

	for (int i = 0; i < num; i++)
	{
		int testcase = rand() % 3;
		if (testcase == 0)
		{

			int pos = rand() % 21;
			randomPos(xMins[pos], xMaxs[pos], yMins[pos], yMaxs[pos], &x, &y);
			onecase.RawTouchDatas = oneFingerPack(x, y, XLen, YLen);
			onecase.name = "OneFingerNum";
			onecase.desp = "intelligent mode num test when one finger in test area";
			onecase.mode = "Numpad";
			onecase.res = to_string(pos);
			onecase.type = "0";
			cases.push_back(onecase);
			generateTestcase(cases, filename);
			cases.clear();
		}
		else if (testcase == 1)
		{
			m = 0; n = 2;
			randomPos(xMins[m], xMaxs[m], yMins[m], yMaxs[m], &x1, &y1);
			randomPos(xMins[n], xMaxs[n], yMins[n], yMaxs[n], &x2, &y2);
			onecase.RawTouchDatas = oneFingerMovPack(x1, y1, x2, y2, XLen, YLen);
			onecase.name = "GeneralModeLightStartTrigger";
			onecase.desp = "Touchpad mode num test when one finger from motivation to invalid area";
			onecase.res = "0 1";
			onecase.mode = "Touchpad";
			onecase.type = "1";
			cases.push_back(onecase);
			generateTestcase(cases, filename);
			cases.clear();
		}
		else
		{
			cases = generalModeGestureA(srcfilename, result);
			generateTestcase(cases, filename);
			cases.clear();
		}
	}
}

std::vector<testcase> testcase::oneTouchLittleMovData()
{
	vector<testcase> cases;
	int XLen = 1019, YLen = 620;
	int xMins[21], xMaxs[21], yMins[21], yMaxs[21], x1, y1, x2, y2;
	int xNewMin, xNewMax, yNewMin, yNewMax;
	MC::RAWTOUCHDATA testdata;
	testcase onecase;
	posBorder(xMins, xMaxs, yMins, yMaxs);
	for (int i = 0; i < 21; i++)
	{
		randomPos(xMins[i], xMaxs[i], yMins[i], yMaxs[i], &x1, &y1);

		xNewMin = (x1 - XLen*0.05) < xMins[i] ? xMins[i] : (x1 - XLen*0.05);
		xNewMax = (x1 + XLen*0.05) > xMaxs[i] ? xMaxs[i] : (x1 + XLen*0.05);
		yNewMin = (y1 - YLen*0.05) < yMins[i] ? yMins[i] : (y1 - YLen*0.05);
		yNewMax = (y1 + YLen*0.05) > yMaxs[i] ? yMaxs[i] : (y1 + YLen*0.05);

		randomPos(xNewMin, xNewMax, yNewMin, yNewMax, &x2, &y2);

		onecase.RawTouchDatas = oneFingerMovPack(x1, y1, x2, y2, XLen, YLen);
		onecase.name = "OneFingerLittleMovNum";
		onecase.desp = "intelligent mode num test when one finger has little movement in test area";
		onecase.res = to_string(i);
		onecase.mode = "Numpad";
		onecase.type = "0";
		cases.push_back(onecase);
	}

	return cases;
}

std::vector<MC::RAWTOUCHDATA> testcase::twoFingerMovPack(pos pos1, pos pos2, pos pos3, pos pos4, int XLen, int YLen)
{
	vector<MC::RAWTOUCHDATA> datas;
	MC::RAWTOUCHDATA testdata1, testdata2, testdata3, testdata4, testdata5;
	testdata1.ulContactId = 0;
	testdata1.lX = pos1.x;
	testdata1.lY = pos1.y;
	testdata1.bTipOn = 1;
	testdata1.bContactCount = 2;
	testdata1.bButton = 0;  //左键
	testdata1.wXMax = XLen;
	testdata1.wXMin = 0;
	testdata1.wYMax = YLen;
	testdata1.wYMin = 0;

	testdata2.ulContactId = 1;
	testdata2.lX = pos3.x;
	testdata2.lY = pos3.y;
	testdata2.bTipOn = 1;
	testdata2.bContactCount = 2;
	testdata2.bButton = 0;
	testdata2.wXMax = XLen;
	testdata2.wXMin = 0;
	testdata2.wYMax = YLen;
	testdata2.wYMin = 0;

	testdata3.ulContactId = 2;
	testdata3.lX = 0;
	testdata3.lY = 0;
	testdata3.bTipOn = 0;
	testdata3.bContactCount = 2;
	testdata3.bButton = 0;
	testdata3.wXMax = XLen;
	testdata3.wXMin = 0;
	testdata3.wYMax = YLen;
	testdata3.wYMin = 0;

	testdata4.ulContactId = 3;
	testdata4.lX = 0;
	testdata4.lY = 0;
	testdata4.bTipOn = 0;
	testdata4.bContactCount = 2;
	testdata4.bButton = 0;
	testdata4.wXMax = XLen;
	testdata4.wXMin = 0;
	testdata4.wYMax = YLen;
	testdata4.wYMin = 0;

	testdata5.ulContactId = 4;
	testdata5.lX = 0;
	testdata5.lY = 0;
	testdata5.bTipOn = 0;
	testdata5.bContactCount = 2;
	testdata5.bButton = 0;
	testdata5.wXMax = XLen;
	testdata5.wXMin = 0;
	testdata5.wYMax = YLen;
	testdata5.wYMin = 0;

	datas.push_back(testdata1);
	datas.push_back(testdata2);
	datas.push_back(testdata3);
	datas.push_back(testdata4);
	datas.push_back(testdata5);

	testdata1.lX = pos2.x;
	testdata1.lY = pos2.y;
	testdata2.lX = pos4.x;
	testdata2.lY = pos4.y;
	datas.push_back(testdata1);
	datas.push_back(testdata2);
	datas.push_back(testdata3);
	datas.push_back(testdata4);
	datas.push_back(testdata5);

	testdata1.bTipOn = 0;
	testdata2.bTipOn = 0;
	datas.push_back(testdata1);
	datas.push_back(testdata2);
	datas.push_back(testdata3);
	datas.push_back(testdata4);
	datas.push_back(testdata5);
	return datas;
}



std::vector<MC::RAWTOUCHDATA> testcase::twoFingerPack(int x1, int y1, int x2, int y2, int XLen, int YLen)
{
	vector<MC::RAWTOUCHDATA> datas;
	MC::RAWTOUCHDATA testdata1, testdata2, testdata3, testdata4, testdata5;
	testdata1.ulContactId = 0;
	testdata1.lX = x1;
	testdata1.lY = y1;
	testdata1.bTipOn = 1;
	testdata1.bContactCount = 2;
	testdata1.bButton = 0;
	testdata1.wXMax = XLen;
	testdata1.wXMin = 0;
	testdata1.wYMax = YLen;
	testdata1.wYMin = 0;

	testdata2.ulContactId = 1;
	testdata2.lX = x2;
	testdata2.lY = y2;
	testdata2.bTipOn = 1;
	testdata2.bContactCount = 2;
	testdata2.bButton = 0;
	testdata2.wXMax = XLen;
	testdata2.wXMin = 0;
	testdata2.wYMax = YLen;
	testdata2.wYMin = 0;

	testdata3.ulContactId = 2;
	testdata3.lX = 0;
	testdata3.lY = 0;
	testdata3.bTipOn = 0;
	testdata3.bContactCount = 2;
	testdata3.bButton = 0;
	testdata3.wXMax = XLen;
	testdata3.wXMin = 0;
	testdata3.wYMax = YLen;
	testdata3.wYMin = 0;

	testdata4.ulContactId = 3;
	testdata4.lX = 0;
	testdata4.lY = 0;
	testdata4.bTipOn = 0;
	testdata4.bContactCount = 2;
	testdata4.bButton = 0;
	testdata4.wXMax = XLen;
	testdata4.wXMin = 0;
	testdata4.wYMax = YLen;
	testdata4.wYMin = 0;

	testdata5.ulContactId = 4;
	testdata5.lX = 0;
	testdata5.lY = 0;
	testdata5.bTipOn = 0;
	testdata5.bContactCount = 2;
	testdata5.bButton = 0;
	testdata5.wXMax = XLen;
	testdata5.wXMin = 0;
	testdata5.wYMax = YLen;
	testdata5.wYMin = 0;

	datas.push_back(testdata1);
	datas.push_back(testdata2);
	datas.push_back(testdata3);
	datas.push_back(testdata4);
	datas.push_back(testdata5);

	testdata1.bTipOn = 0;
	testdata2.bTipOn = 0;
	datas.push_back(testdata1);
	datas.push_back(testdata2);
	datas.push_back(testdata3);
	datas.push_back(testdata4);
	datas.push_back(testdata5);
	return datas;
}

std::vector<MC::RAWTOUCHDATA> testcase::oneFingerMovPack(int x1, int y1, int x2, int y2, int XLen, int YLen)
{
	vector<MC::RAWTOUCHDATA> datas;
	MC::RAWTOUCHDATA testdata1, testdata2, testdata3, testdata4, testdata5;
	testdata1.ulContactId = 0;
	testdata1.lX = x1;
	testdata1.lY = y1;
	testdata1.bTipOn = 1;
	testdata1.bContactCount = 1;
	testdata1.bButton = 0;  //左键
	testdata1.wXMax = XLen;
	testdata1.wXMin = 0;
	testdata1.wYMax = YLen;
	testdata1.wYMin = 0;

	testdata2.ulContactId = 1;
	testdata2.lX = 0;
	testdata2.lY = 0;
	testdata2.bTipOn = 0;
	testdata2.bContactCount = 1;
	testdata2.bButton = 0;
	testdata2.wXMax = XLen;
	testdata2.wXMin = 0;
	testdata2.wYMax = YLen;
	testdata2.wYMin = 0;

	testdata3.ulContactId = 2;
	testdata3.lX = 0;
	testdata3.lY = 0;
	testdata3.bTipOn = 0;
	testdata3.bContactCount = 1;
	testdata3.bButton = 0;
	testdata3.wXMax = XLen;
	testdata3.wXMin = 0;
	testdata3.wYMax = YLen;
	testdata3.wYMin = 0;

	testdata4.ulContactId = 3;
	testdata4.lX = 0;
	testdata4.lY = 0;
	testdata4.bTipOn = 0;
	testdata4.bContactCount = 1;
	testdata4.bButton = 0;
	testdata4.wXMax = XLen;
	testdata4.wXMin = 0;
	testdata4.wYMax = YLen;
	testdata4.wYMin = 0;

	testdata5.ulContactId = 4;
	testdata5.lX = 0;
	testdata5.lY = 0;
	testdata5.bTipOn = 0;
	testdata5.bContactCount = 1;
	testdata5.bButton = 0;
	testdata5.wXMax = XLen;
	testdata5.wXMin = 0;
	testdata5.wYMax = YLen;
	testdata5.wYMin = 0;

	datas.push_back(testdata1);
	datas.push_back(testdata2);
	datas.push_back(testdata3);
	datas.push_back(testdata4);
	datas.push_back(testdata5);

	testdata1.lX = x2;
	testdata1.lY = y2;
	datas.push_back(testdata1);
	datas.push_back(testdata2);
	datas.push_back(testdata3);
	datas.push_back(testdata4);
	datas.push_back(testdata5);

	testdata1.bTipOn = 0;
	datas.push_back(testdata1);
	datas.push_back(testdata2);
	datas.push_back(testdata3);
	datas.push_back(testdata4);
	datas.push_back(testdata5);
	return datas;
}


std::vector<MC::RAWTOUCHDATA> testcase::oneFingerLightStartCancelPack(int x1, int y1,
	int x2, int y2, int x3, int y3, int XLen, int YLen)
{
	vector<MC::RAWTOUCHDATA> datas;
	MC::RAWTOUCHDATA testdata1, testdata2, testdata3, testdata4, testdata5;
	testdata1.ulContactId = 0;
	testdata1.lX = x1;
	testdata1.lY = y1;
	testdata1.bTipOn = 1;
	testdata1.bContactCount = 1;
	testdata1.bButton = 0;  //左键
	testdata1.wXMax = XLen;
	testdata1.wXMin = 0;
	testdata1.wYMax = YLen;
	testdata1.wYMin = 0;

	testdata2.ulContactId = 1;
	testdata2.lX = 0;
	testdata2.lY = 0;
	testdata2.bTipOn = 0;
	testdata2.bContactCount = 1;
	testdata2.bButton = 0;
	testdata2.wXMax = XLen;
	testdata2.wXMin = 0;
	testdata2.wYMax = YLen;
	testdata2.wYMin = 0;

	testdata3.ulContactId = 2;
	testdata3.lX = 0;
	testdata3.lY = 0;
	testdata3.bTipOn = 0;
	testdata3.bContactCount = 1;
	testdata3.bButton = 0;
	testdata3.wXMax = XLen;
	testdata3.wXMin = 0;
	testdata3.wYMax = YLen;
	testdata3.wYMin = 0;

	testdata4.ulContactId = 3;
	testdata4.lX = 0;
	testdata4.lY = 0;
	testdata4.bTipOn = 0;
	testdata4.bContactCount = 1;
	testdata4.bButton = 0;
	testdata4.wXMax = XLen;
	testdata4.wXMin = 0;
	testdata4.wYMax = YLen;
	testdata4.wYMin = 0;

	testdata5.ulContactId = 4;
	testdata5.lX = 0;
	testdata5.lY = 0;
	testdata5.bTipOn = 0;
	testdata5.bContactCount = 1;
	testdata5.bButton = 0;
	testdata5.wXMax = XLen;
	testdata5.wXMin = 0;
	testdata5.wYMax = YLen;
	testdata5.wYMin = 0;

	datas.push_back(testdata1);
	datas.push_back(testdata2);
	datas.push_back(testdata3);
	datas.push_back(testdata4);
	datas.push_back(testdata5);

	testdata1.lX = x2;
	testdata1.lY = y2;
	datas.push_back(testdata1);
	datas.push_back(testdata2);
	datas.push_back(testdata3);
	datas.push_back(testdata4);
	datas.push_back(testdata5);

	testdata1.lX = x3;
	testdata1.lY = y3;
	datas.push_back(testdata1);
	datas.push_back(testdata2);
	datas.push_back(testdata3);
	datas.push_back(testdata4);
	datas.push_back(testdata5);

	testdata1.bTipOn = 0;
	datas.push_back(testdata1);
	datas.push_back(testdata2);
	datas.push_back(testdata3);
	datas.push_back(testdata4);
	datas.push_back(testdata5);
	return datas;
}
std::vector<MC::RAWTOUCHDATA> testcase::twoFingerDiffTMovPack(pos pos1, pos pos2, pos pos3, pos pos4, pos pos5, int XLen, int YLen)
{
	vector<MC::RAWTOUCHDATA> datas;
	MC::RAWTOUCHDATA testdata1, testdata2, testdata3, testdata4, testdata5;
	testdata1.ulContactId = 0;
	testdata1.lX = pos1.x;
	testdata1.lY = pos1.y;
	testdata1.bTipOn = 1;
	testdata1.bContactCount = 1;
	testdata1.bButton = 0;
	testdata1.wXMax = XLen;
	testdata1.wXMin = 0;
	testdata1.wYMax = YLen;
	testdata1.wYMin = 0;

	testdata2.ulContactId = 1;
	testdata2.lX = 0;
	testdata2.lY = 0;
	testdata2.bTipOn = 1;
	testdata2.bContactCount = 1;
	testdata2.bButton = 0;
	testdata2.wXMax = XLen;
	testdata2.wXMin = 0;
	testdata2.wYMax = YLen;
	testdata2.wYMin = 0;

	testdata3.ulContactId = 2;
	testdata3.lX = 0;
	testdata3.lY = 0;
	testdata3.bTipOn = 0;
	testdata3.bContactCount = 1;
	testdata3.bButton = 0;
	testdata3.wXMax = XLen;
	testdata3.wXMin = 0;
	testdata3.wYMax = YLen;
	testdata3.wYMin = 0;

	testdata4.ulContactId = 3;
	testdata4.lX = 0;
	testdata4.lY = 0;
	testdata4.bTipOn = 0;
	testdata4.bContactCount = 1;
	testdata4.bButton = 0;
	testdata4.wXMax = XLen;
	testdata4.wXMin = 0;
	testdata4.wYMax = YLen;
	testdata4.wYMin = 0;

	testdata5.ulContactId = 4;
	testdata5.lX = 0;
	testdata5.lY = 0;
	testdata5.bTipOn = 0;
	testdata5.bContactCount = 1;
	testdata5.bButton = 0;
	testdata5.wXMax = XLen;
	testdata5.wXMin = 0;
	testdata5.wYMax = YLen;
	testdata5.wYMin = 0;

	datas.push_back(testdata1);
	datas.push_back(testdata2);
	datas.push_back(testdata3);
	datas.push_back(testdata4);
	datas.push_back(testdata5);

	testdata1.ulContactId = 0;
	testdata1.lX = pos2.x;
	testdata1.lY = pos2.y;
	testdata1.bTipOn = 1;
	testdata1.bContactCount = 2;
	testdata1.bButton = 0;
	testdata1.wXMax = XLen;
	testdata1.wXMin = 0;
	testdata1.wYMax = YLen;
	testdata1.wYMin = 0;

	testdata2.ulContactId = 1;
	testdata2.lX = pos4.x;
	testdata2.lY = pos4.y;
	testdata2.bTipOn = 1;
	testdata2.bContactCount = 2;
	testdata2.bButton = 0;
	testdata2.wXMax = XLen;
	testdata2.wXMin = 0;
	testdata2.wYMax = YLen;
	testdata2.wYMin = 0;

	testdata3.ulContactId = 2;
	testdata3.lX = 0;
	testdata3.lY = 0;
	testdata3.bTipOn = 0;
	testdata3.bContactCount = 2;
	testdata3.bButton = 0;
	testdata3.wXMax = XLen;
	testdata3.wXMin = 0;
	testdata3.wYMax = YLen;
	testdata3.wYMin = 0;

	testdata4.ulContactId = 3;
	testdata4.lX = 0;
	testdata4.lY = 0;
	testdata4.bTipOn = 0;
	testdata4.bContactCount = 2;
	testdata4.bButton = 0;
	testdata4.wXMax = XLen;
	testdata4.wXMin = 0;
	testdata4.wYMax = YLen;
	testdata4.wYMin = 0;

	testdata5.ulContactId = 4;
	testdata5.lX = 0;
	testdata5.lY = 0;
	testdata5.bTipOn = 0;
	testdata5.bContactCount = 2;
	testdata5.bButton = 0;
	testdata5.wXMax = XLen;
	testdata5.wXMin = 0;
	testdata5.wYMax = YLen;
	testdata5.wYMin = 0;
	datas.push_back(testdata1);
	datas.push_back(testdata2);
	datas.push_back(testdata3);
	datas.push_back(testdata4);
	datas.push_back(testdata5);

	testdata1.ulContactId = 0;
	testdata1.lX = pos3.x;
	testdata1.lY = pos3.y;
	testdata1.bTipOn = 1;
	testdata1.bContactCount = 2;
	testdata1.bButton = 0;
	testdata1.wXMax = XLen;
	testdata1.wXMin = 0;
	testdata1.wYMax = YLen;
	testdata1.wYMin = 0;

	testdata2.ulContactId = 1;
	testdata2.lX = pos5.x;
	testdata2.lY = pos5.y;
	testdata2.bTipOn = 1;
	testdata2.bContactCount = 2;
	testdata2.bButton = 0;
	testdata2.wXMax = XLen;
	testdata2.wXMin = 0;
	testdata2.wYMax = YLen;
	testdata2.wYMin = 0;

	testdata3.ulContactId = 2;
	testdata3.lX = 0;
	testdata3.lY = 0;
	testdata3.bTipOn = 0;
	testdata3.bContactCount = 2;
	testdata3.bButton = 0;
	testdata3.wXMax = XLen;
	testdata3.wXMin = 0;
	testdata3.wYMax = YLen;
	testdata3.wYMin = 0;

	testdata4.ulContactId = 3;
	testdata4.lX = 0;
	testdata4.lY = 0;
	testdata4.bTipOn = 0;
	testdata4.bContactCount = 2;
	testdata4.bButton = 0;
	testdata4.wXMax = XLen;
	testdata4.wXMin = 0;
	testdata4.wYMax = YLen;
	testdata4.wYMin = 0;

	testdata5.ulContactId = 4;
	testdata5.lX = 0;
	testdata5.lY = 0;
	testdata5.bTipOn = 0;
	testdata5.bContactCount = 2;
	testdata5.bButton = 0;
	testdata5.wXMax = XLen;
	testdata5.wXMin = 0;
	testdata5.wYMax = YLen;
	testdata5.wYMin = 0;

	datas.push_back(testdata1);
	datas.push_back(testdata2);
	datas.push_back(testdata3);
	datas.push_back(testdata4);
	datas.push_back(testdata5);

	testdata1.bTipOn = 0;
	testdata2.bTipOn = 0;
	datas.push_back(testdata1);
	datas.push_back(testdata2);
	datas.push_back(testdata3);
	datas.push_back(testdata4);
	datas.push_back(testdata5);
	return datas;
}

std::vector<MC::RAWTOUCHDATA> testcase::oneMoveoneTouch(pos pos1, pos pos2, pos pos3, int XLen, int YLen)
{
	vector<MC::RAWTOUCHDATA> datas;
	MC::RAWTOUCHDATA testdata1, testdata2, testdata3, testdata4, testdata5;
	testdata1.ulContactId = 0;
	testdata1.lX = pos1.x;
	testdata1.lY = pos1.y;
	testdata1.bTipOn = 1;
	testdata1.bContactCount = 1;
	testdata1.bButton = 0;
	testdata1.wXMax = XLen;
	testdata1.wXMin = 0;
	testdata1.wYMax = YLen;
	testdata1.wYMin = 0;

	testdata2.ulContactId = 1;
	testdata2.lX = 0;
	testdata2.lY = 0;
	testdata2.bTipOn = 1;
	testdata2.bContactCount = 1;
	testdata2.bButton = 0;
	testdata2.wXMax = XLen;
	testdata2.wXMin = 0;
	testdata2.wYMax = YLen;
	testdata2.wYMin = 0;

	testdata3.ulContactId = 2;
	testdata3.lX = 0;
	testdata3.lY = 0;
	testdata3.bTipOn = 0;
	testdata3.bContactCount = 1;
	testdata3.bButton = 0;
	testdata3.wXMax = XLen;
	testdata3.wXMin = 0;
	testdata3.wYMax = YLen;
	testdata3.wYMin = 0;

	testdata4.ulContactId = 3;
	testdata4.lX = 0;
	testdata4.lY = 0;
	testdata4.bTipOn = 0;
	testdata4.bContactCount = 1;
	testdata4.bButton = 0;
	testdata4.wXMax = XLen;
	testdata4.wXMin = 0;
	testdata4.wYMax = YLen;
	testdata4.wYMin = 0;

	testdata5.ulContactId = 4;
	testdata5.lX = 0;
	testdata5.lY = 0;
	testdata5.bTipOn = 0;
	testdata5.bContactCount = 1;
	testdata5.bButton = 0;
	testdata5.wXMax = XLen;
	testdata5.wXMin = 0;
	testdata5.wYMax = YLen;
	testdata5.wYMin = 0;

	datas.push_back(testdata1);
	datas.push_back(testdata2);
	datas.push_back(testdata3);
	datas.push_back(testdata4);
	datas.push_back(testdata5);

	testdata1.ulContactId = 0;
	testdata1.lX = pos2.x;
	testdata1.lY = pos2.y;
	testdata1.bTipOn = 1;
	testdata1.bContactCount = 2;
	testdata1.bButton = 0;
	testdata1.wXMax = XLen;
	testdata1.wXMin = 0;
	testdata1.wYMax = YLen;
	testdata1.wYMin = 0;

	testdata2.ulContactId = 1;
	testdata2.lX = pos3.x;
	testdata2.lY = pos3.y;
	testdata2.bTipOn = 1;
	testdata2.bContactCount = 2;
	testdata2.bButton = 0;
	testdata2.wXMax = XLen;
	testdata2.wXMin = 0;
	testdata2.wYMax = YLen;
	testdata2.wYMin = 0;

	testdata3.ulContactId = 2;
	testdata3.lX = 0;
	testdata3.lY = 0;
	testdata3.bTipOn = 0;
	testdata3.bContactCount = 2;
	testdata3.bButton = 0;
	testdata3.wXMax = XLen;
	testdata3.wXMin = 0;
	testdata3.wYMax = YLen;
	testdata3.wYMin = 0;

	testdata4.ulContactId = 3;
	testdata4.lX = 0;
	testdata4.lY = 0;
	testdata4.bTipOn = 0;
	testdata4.bContactCount = 2;
	testdata4.bButton = 0;
	testdata4.wXMax = XLen;
	testdata4.wXMin = 0;
	testdata4.wYMax = YLen;
	testdata4.wYMin = 0;

	testdata5.ulContactId = 4;
	testdata5.lX = 0;
	testdata5.lY = 0;
	testdata5.bTipOn = 0;
	testdata5.bContactCount = 2;
	testdata5.bButton = 0;
	testdata5.wXMax = XLen;
	testdata5.wXMin = 0;
	testdata5.wYMax = YLen;
	testdata5.wYMin = 0;
	datas.push_back(testdata1);
	datas.push_back(testdata2);
	datas.push_back(testdata3);
	datas.push_back(testdata4);
	datas.push_back(testdata5);

	return datas;
}

std::vector<MC::RAWTOUCHDATA> testcase::twoFingerGesture(std::vector<pos> posValue, int XLen, int YLen)
{
	vector<MC::RAWTOUCHDATA> datas;
	MC::RAWTOUCHDATA testdata1, testdata2, testdata3, testdata4, testdata5;
	testdata1.ulContactId = 0;
	testdata1.lX = 0;
	testdata1.lY = 0;
	testdata1.bTipOn = 1;
	testdata1.bContactCount = 2;
	testdata1.bButton = 0;
	testdata1.wXMax = XLen;
	testdata1.wXMin = 0;
	testdata1.wYMax = YLen;
	testdata1.wYMin = 0;

	testdata2.ulContactId = 1;
	testdata2.lX = 0;
	testdata2.lY = 0;
	testdata2.bTipOn = 1;
	testdata2.bContactCount = 2;
	testdata2.bButton = 0;
	testdata2.wXMax = XLen;
	testdata2.wXMin = 0;
	testdata2.wYMax = YLen;
	testdata2.wYMin = 0;

	testdata3.ulContactId = 2;
	testdata3.lX = 0;
	testdata3.lY = 0;
	testdata3.bTipOn = 0;
	testdata3.bContactCount = 2;
	testdata3.bButton = 0;
	testdata3.wXMax = XLen;
	testdata3.wXMin = 0;
	testdata3.wYMax = YLen;
	testdata3.wYMin = 0;

	testdata4.ulContactId = 3;
	testdata4.lX = 0;
	testdata4.lY = 0;
	testdata4.bTipOn = 0;
	testdata4.bContactCount = 2;
	testdata4.bButton = 0;
	testdata4.wXMax = XLen;
	testdata4.wXMin = 0;
	testdata4.wYMax = YLen;
	testdata4.wYMin = 0;

	testdata5.ulContactId = 4;
	testdata5.lX = 0;
	testdata5.lY = 0;
	testdata5.bTipOn = 0;
	testdata5.bContactCount = 2;
	testdata5.bButton = 0;
	testdata5.wXMax = XLen;
	testdata5.wXMin = 0;
	testdata5.wYMax = YLen;
	testdata5.wYMin = 0;


	for (int i = 0; i < posValue.size(); i++)
	{
		testdata1.lX = posValue[i].x;
		testdata1.lY = posValue[i].y;
		testdata2.lX = posValue[i].x + 300;
		testdata2.lY = posValue[i].y + 100;
		datas.push_back(testdata1);
		datas.push_back(testdata2);
		datas.push_back(testdata3);
		datas.push_back(testdata4);
		datas.push_back(testdata5);
	}
	testdata1.bTipOn = 0;
	testdata2.bTipOn = 0;
	datas.push_back(testdata1);
	datas.push_back(testdata2);
	datas.push_back(testdata3);
	datas.push_back(testdata4);
	datas.push_back(testdata5);
	return datas;
}

std::vector<testcase> testcase::IntellengentModeTwoFingerOneAreaTest()
{
	vector<testcase> cases;
	int XLen = 1019, YLen = 620;
	int xMins[21], xMaxs[21], yMins[21], yMaxs[21];
	int x1, y1, x2, y2;
	MC::RAWTOUCHDATA testdata;
	testcase onecase;
	posBorder(xMins, xMaxs, yMins, yMaxs);
	for (int i = 0; i < 21; i++)
	{
		randomPos(xMins[i], xMaxs[i], yMins[i], yMaxs[i], &x1, &y1);
		randomPos(xMins[i], xMaxs[i], yMins[i], yMaxs[i], &x2, &y2);
		onecase.RawTouchDatas = twoFingerPack(x1, y1, x2, y2, XLen, YLen);
		onecase.name = "TwoFingerNum";
		onecase.desp = "intelligent mode num test when two finger in same area";
		onecase.res = to_string(i) + " " + to_string(i);
		onecase.mode = "Numpad";
		onecase.type = "0";
		cases.push_back(onecase);
	}

	return cases;
}

std::vector<testcase> testcase::IntellengentModeTwoFingerTwoAreaTest(int num)
{
	vector<testcase> cases;
	int XLen = 1019, YLen = 620;
	int xMins[21], xMaxs[21], yMins[21], yMaxs[21];
	int x1, y1, x2, y2;
	MC::RAWTOUCHDATA testdata;
	testcase onecase;
	int posIndex1, posIndex2;
	posBorder(xMins, xMaxs, yMins, yMaxs);
	for (int i = 0; i < num; i++)
	{
		posIndex1 = rand() % 21;
		posIndex2 = rand() % 21;
		while (posIndex2 == posIndex1)
			posIndex2 = rand() % 21;
		randomPos(xMins[posIndex1], xMaxs[posIndex1], yMins[posIndex1], yMaxs[posIndex1], &x1, &y1);
		randomPos(xMins[posIndex2], xMaxs[posIndex2], yMins[posIndex2], yMaxs[posIndex2], &x2, &y2);
		onecase.RawTouchDatas = twoFingerPack(x1, y1, x2, y2, XLen, YLen);
		onecase.name = "TwoFingerNum";
		onecase.desp = "intelligent mode num test when two finger in different area";
		onecase.res = to_string(posIndex1) + ' ' + to_string(posIndex2);
		onecase.mode = "Numpad";
		onecase.type = "0";
		cases.push_back(onecase);
	}
	return cases;
}

std::vector<testcase> testcase::GeneralModeLightStartTrigger(int num)
{
	vector<testcase> cases;
	int XLen = 1019, YLen = 620;
	int xMins[21], xMaxs[21], yMins[21], yMaxs[21];
	int x1, y1, x2, y2, m, n, p;
	MC::RAWTOUCHDATA testdata;
	testcase onecase;
	lightingStartBorder(xMins, xMaxs, yMins, yMaxs);

	for (int i = 0; i < num; i++)
	{
		m = 0; n = 2;
		randomPos(xMins[m], xMaxs[m], yMins[m], yMaxs[m], &x1, &y1);
		randomPos(xMins[n], xMaxs[n], yMins[n], yMaxs[n], &x2, &y2);
		onecase.RawTouchDatas = oneFingerMovPack(x1, y1, x2, y2, XLen, YLen);
		onecase.name = "GeneralModeLightStartTrigger";
		onecase.desp = "Touchpad mode num test when one finger from motivation to invalid area";
		onecase.res = "0 1";
		onecase.mode = "Touchpad";
		onecase.type = "1";
		cases.push_back(onecase);
	}
	return cases;
}

std::vector<testcase> testcase::GeneralModeLightStartCancle(int num)
{
	vector<testcase> cases;
	int XLen = 1019, YLen = 620;
	int xMins[5], xMaxs[5], yMins[5], yMaxs[5];
	int x1, y1, x2, y2, x3, y3, m, n, p;
	MC::RAWTOUCHDATA testdata;
	testcase onecase;
	lightingStartBorder(xMins, xMaxs, yMins, yMaxs);

	for (int i = 0; i < num; i++)
	{
		m = 0; n = 2;
		randomPos(xMins[m], xMaxs[m], yMins[m], yMaxs[m], &x1, &y1);
		randomPos(xMins[n], xMaxs[n], yMins[n], yMaxs[n], &x2, &y2);
		p = 0;
		randomPos(xMins[p], xMaxs[p], yMins[p], yMaxs[p], &x3, &y3);
		onecase.RawTouchDatas = oneFingerLightStartCancelPack(x1, y1, x2, y2, x3, y3, XLen, YLen);
		onecase.name = "GeneralModeLightStartCancel";
		onecase.desp = "Touchpad mode num test when one finger from motivation to invalid area to other area";
		onecase.res = "0 2";
		onecase.mode = "Touchpad";
		onecase.type = "1";
		cases.push_back(onecase);
		p = 1;
		randomPos(xMins[p], xMaxs[p], yMins[p], yMaxs[p], &x3, &x3);
		onecase.RawTouchDatas = oneFingerLightStartCancelPack(x1, y1, x2, y2, x3, y3, XLen, YLen);
		onecase.name = "GeneralModeLightStartCancel";
		onecase.desp = "Touchpad mode num test when one finger from motivation to invalid area to other area";
		onecase.res = "0 2";
		onecase.mode = "Touchpad";
		onecase.type = "1";
		cases.push_back(onecase);
		p = 3;
		randomPos(xMins[p], xMaxs[p], yMins[p], yMaxs[p], &x3, &x3);
		onecase.RawTouchDatas = oneFingerLightStartCancelPack(x1, y1, x2, y2, x3, y3, XLen, YLen);
		onecase.name = "GeneralModeLightStartCancel";
		onecase.desp = "Touchpad mode num test when one finger from motivation to invalid area to other area";
		onecase.res = "0 2";
		onecase.mode = "Touchpad";
		onecase.type = "1";
		cases.push_back(onecase);
		p = 4;
		randomPos(xMins[p], xMaxs[p], yMins[p], yMaxs[p], &x3, &x3);
		onecase.RawTouchDatas = oneFingerLightStartCancelPack(x1, y1, x2, y2, x3, y3, XLen, YLen);
		onecase.name = "GeneralModeLightStartCancel";
		onecase.desp = "Touchpad mode num test when one finger from motivation to invalid area to other area";
		onecase.res = "0 2";
		onecase.mode = "Touchpad";
		onecase.type = "1";
		cases.push_back(onecase);
	}
	return cases;
}

std::vector<testcase> testcase::GeneralModeLightStartTriggerFail(int num)
{
	vector<testcase> cases;
	int XLen = 1019, YLen = 620;
	int xMins[5], xMaxs[5], yMins[5], yMaxs[5];
	int x1, y1, x2, y2, m, n, p;
	MC::RAWTOUCHDATA testdata;
	testcase onecase;
	lightingStartBorder(xMins, xMaxs, yMins, yMaxs);

	for (int i = 0; i < num; i++)
	{
		m = 1; n = 2;
		randomPos(xMins[m], xMaxs[m], yMins[m], yMaxs[m], &x1, &y1);
		randomPos(xMins[n], xMaxs[n], yMins[n], yMaxs[n], &x2, &y2);
		onecase.RawTouchDatas = oneFingerMovPack(x1, y1, x2, y2, XLen, YLen);
		onecase.name = "GeneralModeLightStartTriggerFail";
		onecase.desp = "Touchpad mode num test when one finger from left border area to invalid area";
		onecase.res = "3";
		onecase.mode = "Touchpad";
		onecase.type = "1";
		cases.push_back(onecase);
		m = 3; n = 2;
		randomPos(xMins[m], xMaxs[m], yMins[m], yMaxs[m], &x1, &y1);
		randomPos(xMins[n], xMaxs[n], yMins[n], yMaxs[n], &x2, &y2);
		onecase.RawTouchDatas = oneFingerMovPack(x1, y1, x2, y2, XLen, YLen);
		onecase.name = "GeneralModeLightStartTriggerFail";
		onecase.desp = "Touchpad mode num test when one finger from high border to invalid area";
		onecase.res = "3";
		onecase.mode = "Touchpad";
		onecase.type = "1";
		cases.push_back(onecase);
		m = 4; n = 2;
		randomPos(xMins[m], xMaxs[m], yMins[m], yMaxs[m], &x1, &y1);
		randomPos(xMins[n], xMaxs[n], yMins[n], yMaxs[n], &x2, &y2);
		onecase.RawTouchDatas = oneFingerMovPack(x1, y1, x2, y2, XLen, YLen);
		onecase.name = "GeneralModeLightStartTriggerFail";
		onecase.desp = "Touchpad mode num test when one finger from low border to invalid area";
		onecase.res = "3";
		onecase.mode = "Touchpad";
		onecase.type = "1";
		cases.push_back(onecase);
	}
	return cases;
}


void swap(pos* pos1, pos* pos2)
{
	int x, y;
	x = pos1->x;
	y = pos1->y;
	pos1->x = pos2->x;
	pos1->y = pos2->y;
	pos2->x = x;
	pos2->y = y;
}
std::vector<testcase> testcase::GeneralModeLightStartTwoFingerSameTD(int num)
{
	vector<testcase> cases;
	int XLen = 1019, YLen = 620;
	int xMins[5], xMaxs[5], yMins[5], yMaxs[5];
	int x1, y1, x2, y2, x3, y3, x4, y4, m, n, p, q;
	pos pos1, pos2, pos3, pos4;
	MC::RAWTOUCHDATA testdata;
	testcase onecase;
	lightingStartBorder(xMins, xMaxs, yMins, yMaxs);

	for (int i = 0; i < num; i++)
	{
		m = 0; n = 2;
		randomPos(xMins[m], xMaxs[m], yMins[m], yMaxs[m], &pos1.x, &pos1.y);
		randomPos(xMins[n], xMaxs[n], yMins[n], yMaxs[n], &pos2.x, &pos2.y);
		randomPos(xMins[m], xMaxs[m], yMins[m], yMaxs[m], &pos3.x, &pos3.y);
		randomPos(xMins[n], xMaxs[n], yMins[n], yMaxs[n], &pos4.x, &pos4.y);
		if (pos1.y > pos3.y)
		{
			swap(pos1, pos3);
		}
		if (pos2.y > pos4.y)
		{
			swap(pos2, pos4);
		}

		onecase.RawTouchDatas = twoFingerMovPack(pos1, pos2, pos3, pos4, XLen, YLen);
		onecase.name = "GeneralModeLightStartTwoFingerSameTD";
		onecase.desp = "Touchpad mode num test when two finger from motivation area to invalid area at the same time";
		onecase.res = "3";
		onecase.mode = "Touchpad";
		onecase.type = "1";
		cases.push_back(onecase);
	}
	return cases;
}

std::vector<testcase> testcase::GeneralModeLightStartTwoFingerSameTDiffD(int num)
{
	vector<testcase> cases;
	int XLen = 1019, YLen = 620;
	int xMins[5], xMaxs[5], yMins[5], yMaxs[5];
	int x1, y1, x2, y2, x3, y3, x4, y4, m, n, p, q;
	pos pos1, pos2, pos3, pos4;
	MC::RAWTOUCHDATA testdata;
	testcase onecase;
	lightingStartBorder(xMins, xMaxs, yMins, yMaxs);

	for (int i = 0; i < num; i++)
	{
		m = 0; n = 2;
		randomPos(xMins[m], xMaxs[m], yMins[m], yMaxs[m], &pos1.x, &pos1.y);
		randomPos(xMins[n], xMaxs[n], yMins[n], yMaxs[n], &pos2.x, &pos2.y);
		randomPos(xMins[m], xMaxs[m], yMins[m], yMaxs[m], &pos3.x, &pos3.y);
		randomPos(xMins[n], xMaxs[n], yMins[n], yMaxs[n], &pos4.x, &pos4.y);
		if (pos1.y > pos3.y)
		{
			swap(pos1, pos3);
		}
		if (pos2.y > pos4.y)
		{
			swap(pos2, pos4);
		}

		onecase.RawTouchDatas = twoFingerMovPack(pos1, pos2, pos4, pos3, XLen, YLen);
		onecase.name = "GeneralModeLightStartTwoFingerSameTDiffD";
		onecase.desp = "Touchpad mode num test when one finger from motivation area to invalid area, other diff direction at the same time";
		onecase.res = "3";
		onecase.mode = "Touchpad";
		onecase.type = "1";
		cases.push_back(onecase);
	}
	return cases;
}

std::vector<testcase> testcase::GeneralModeLightStartTwoFingerDiffTSameD(int num)
{
	vector<testcase> cases;
	int XLen = 1019, YLen = 620;
	int xMins[5], xMaxs[5], yMins[5], yMaxs[5];
	int x1, y1, x2, y2, x3, y3, x4, y4, m, n, p;
	pos pos1, pos2, pos3, pos4, pos5;
	MC::RAWTOUCHDATA testdata;
	testcase onecase;
	lightingStartBorder(xMins, xMaxs, yMins, yMaxs);

	for (int i = 0; i < num; i++)
	{
		m = 0; n = 1; p = 2;
		randomPos(xMins[m], xMaxs[m], yMins[m], yMaxs[m], &pos1.x, &pos1.y);
		randomPos(xMins[n], xMaxs[n], yMins[n], yMaxs[n], &pos2.x, &pos2.y);
		randomPos(xMins[p], xMaxs[p], yMins[p], yMaxs[p], &pos3.x, &pos3.y);
		randomPos(xMins[m], xMaxs[m], yMins[m], yMaxs[m], &pos4.x, &pos4.y);
		randomPos(xMins[n], xMaxs[n], yMins[n], yMaxs[n], &pos5.x, &pos5.y);

		if (pos1.y > pos4.y)
		{
			swap(pos1, pos4);
		}
		if (pos2.y > pos5.y)
		{
			swap(pos2, pos5);
		}

		onecase.RawTouchDatas = twoFingerDiffTMovPack(pos1, pos2, pos4, pos3, pos5, XLen, YLen);
		onecase.name = "GeneralModeLightStartTwoFingerDiffTSameD";
		onecase.desp = "Touchpad mode num test when one finger from motivation area to invalid area, other comes when one at the left border";
		onecase.res = "3";
		onecase.mode = "Touchpad";
		onecase.type = "1";
		cases.push_back(onecase);

		m = 0; n = 1; p = 2;
		randomPos(xMins[m], xMaxs[m], yMins[m], yMaxs[m], &pos1.x, &pos1.y);
		randomPos(xMins[p], xMaxs[p], yMins[p], yMaxs[p], &pos2.x, &pos2.y);
		randomPos(xMins[p], xMaxs[p], yMins[p], yMaxs[p], &pos3.x, &pos3.y);
		randomPos(xMins[m], xMaxs[m], yMins[m], yMaxs[m], &pos4.x, &pos4.y);
		randomPos(xMins[n], xMaxs[n], yMins[n], yMaxs[n], &pos5.x, &pos5.y);

		if (pos1.y > pos4.y)
		{
			swap(pos1, pos4);
		}

		onecase.RawTouchDatas = twoFingerDiffTMovPack(pos1, pos2, pos4, pos3, pos5, XLen, YLen);
		onecase.name = "GeneralModeLightStartTwoFingerDiffTSameD";
		onecase.desp = "Touchpad mode num test when one finger from motivation area to invalid area, other comes when one at the left border";
		onecase.res = "0 2";
		onecase.mode = "Touchpad";
		onecase.type = "1";
		cases.push_back(onecase);

	}
	return cases;
}

std::vector<testcase> testcase::GeneralModeLightStartoneMoveOneTouch(int num)
{
	vector<testcase> cases;
	int XLen = 1019, YLen = 620;
	int xMins[5], xMaxs[5], yMins[5], yMaxs[5];
	int  m, n;
	pos pos1, pos2, pos3;
	testcase onecase;
	lightingStartBorder(xMins, xMaxs, yMins, yMaxs);

	for (int i = 0; i < num; i++)
	{
		m = 0; n = 1;
		randomPos(xMins[m], xMaxs[m], yMins[m], yMaxs[m], &pos1.x, &pos1.y);
		randomPos(xMins[n], xMaxs[n], yMins[n], yMaxs[n], &pos2.x, &pos2.y);
		randomPos(0, XLen, 0, YLen, &pos3.x, &pos3.y);

		onecase.RawTouchDatas = oneMoveoneTouch(pos1, pos2, pos3, XLen, YLen);
		onecase.name = "GeneralModeLightStartoneMoveOneTouch";
		onecase.desp = "Touchpad mode num test when one finger from motivation area to left border area, other comes";
		onecase.res = "3";
		onecase.mode = "Touchpad";
		onecase.type = "1";
		cases.push_back(onecase);

		m = 0; n = 2;
		randomPos(xMins[m], xMaxs[m], yMins[m], yMaxs[m], &pos1.x, &pos1.y);
		randomPos(xMins[n], xMaxs[n], yMins[n], yMaxs[n], &pos2.x, &pos2.y);
		randomPos(0, XLen, 0, YLen, &pos3.x, &pos3.y);

		onecase.RawTouchDatas = oneMoveoneTouch(pos1, pos2, pos3, XLen, YLen);
		onecase.name = "GeneralModeLightStartoneMoveOneTouch";
		onecase.desp = "Touchpad mode num test when one finger from motivation area to left border area, other comes";
		onecase.res = "0 2";
		onecase.mode = "Touchpad";
		onecase.type = "1";
		cases.push_back(onecase);

	}
	return cases;
}

std::vector<testcase> testcase::generalModeGestureA(char * filename, char* result)
{
	ifstream file;
	file.open(filename, ios::in);
	if (!file.is_open())
		return std::vector<testcase>();
	std::string strline;
	pos temp;
	char buff[1024] = { 0 };
	std::vector<pos> posValue;
	vector<testcase> cases;
	testcase onecase;
	int XLen = 1019, YLen = 620;
	while (getline(file, strline))
	{
		if (strline.empty())
			continue;
		temp.x = std::atoi(strline.c_str());
		while (getline(file, strline))
		{
			if (strline.empty())
				continue;
			else
			{
				temp.y = std::atoi(strline.c_str());
				posValue.push_back(temp);
				break;
			}
		}
	}
	onecase.RawTouchDatas = twoFingerGesture(posValue, XLen, YLen);
	onecase.name = "generalModeGesture";
	onecase.desp = "gesture test";
	onecase.res = result;
	onecase.mode = "Touchpad";
	onecase.type = "2";
	cases.push_back(onecase);
	return cases;
}

