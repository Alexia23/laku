#pragma once
#include "rawtouchdevice.h"
#include <string>

typedef struct node
{
	int x;
	int y;
}pos;

class testcase
{
	std::string name;
	std::string desp;
	std::string mode;
	std::string type;   //num=0, lightstart=1, 
	std::vector<MC::RAWTOUCHDATA> RawTouchDatas;
	std::string res; //激活窗口0， 触发窗口1，窗口消失2，以空格隔开
public:
	testcase();
	~testcase();
	void changeMode();
	void posBorder(int* xMins, int *xMaxs, int* yMins, int* yMaxs);
	void lightingStartBorder(int* xMins, int *xMaxs, int* yMins, int* yMaxs);
	
	void generateTestcase(std::vector<testcase> cases, std::string casefilename);
	std::vector<testcase> oneTouchData();
	std::vector<testcase> oneTouchLittleMovData();
	std::vector<testcase> IntellengentModeTwoFingerOneAreaTest();
	std::vector<testcase> IntellengentModeTwoFingerTwoAreaTest(int num);
	std::vector<testcase> GeneralModeLightStartTrigger(int num);
	std::vector<testcase> GeneralModeLightStartCancle(int num);
	std::vector<testcase> GeneralModeLightStartTriggerFail(int num);
	std::vector<testcase> GeneralModeLightStartTwoFingerSameTD(int num);
	std::vector<testcase> GeneralModeLightStartTwoFingerSameTDiffD(int num);
	std::vector<testcase> GeneralModeLightStartTwoFingerDiffTSameD(int num);
	std::vector<testcase> GeneralModeLightStartoneMoveOneTouch(int num);
	std::vector<testcase> generalModeGestureA(char* filename, char* result);

	//单功能频繁操作
	void SingerFuncFrequentOptNum(int num, char* filename);
	void SingerFuncFrequentOptGesture(char* srcfilename, char* result, int num, char* dstfilename);
	void SingerFuncFrequentLightStartTrigger(int num, char* filename);
	void MultiFuncFrequentOptNumGestureLightStartTrigger(char * srcfilename, char* result, int num, char* filename);

	std::vector<MC::RAWTOUCHDATA> twoFingerPack(int x1, int y1, int x2, int y2, int XLen, int YLen);
	std::vector<MC::RAWTOUCHDATA> oneFingerPack(int x, int y, int XLen, int YLen); 
	std::vector<MC::RAWTOUCHDATA> oneFingerMovPack(int x1, int y1, int x2, int y2, int XLen, int YLen);
	std::vector<MC::RAWTOUCHDATA> twoFingerMovPack(pos pos1, pos pos2, pos pos3, pos pos4, int XLen, int YLen);
	std::vector<MC::RAWTOUCHDATA> oneFingerLightStartCancelPack(int x1, int y1, int x2, int y2, int x3, int y3, int XLen, int YLen);
	std::vector<MC::RAWTOUCHDATA> twoFingerDiffTMovPack(pos pos1, pos pos2, pos pos3, pos pos4, pos pos5, int XLen, int YLen);
	std::vector<MC::RAWTOUCHDATA> oneMoveoneTouch(pos pos1, pos pos2, pos pos3, int XLen, int YLen);
	std::vector<MC::RAWTOUCHDATA> twoFingerGesture(std::vector<pos> posValue, int XLen, int YLen);

	void onePos(int x, int y, int caseIndex, MC::RAWTOUCHDATA * m_RawTouchData);
	void twoFinger(int x1, int y1, int x2, int y2, int caseIndex, MC::RAWTOUCHDATA * m_RawTouchData);
	void numberKeyBoardTests(int caseIndex, MC::RAWTOUCHDATA * m_RawTouchData);
	bool checkResult(int caseIndex, int result);
	void remarkResult(int casseInddex, bool result);
};

