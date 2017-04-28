// luckeyTest.cpp : 定义控制台应用程序的入口点。
//

#include "stdafx.h"
#include "testcase.h"
#include "rawtouchdevice.h"

int main()
{

	testcase example;

	//数字按键
	example.generateTestcase(example.oneTouchLittleMovData(), "NumFunOneFingerLitterMov.txt");
	//example.generateTestcase(example.oneTouchData(), "NumFunOneFinger.txt");
	//example.generateTestcase(example.IntellengentModeTwoFingerOneAreaTest(), "NumFunTwoFingerOneArea.txt");
	//example.generateTestcase(example.IntellengentModeTwoFingerTwoAreaTest(10), "NumFunTwoFingerTwoArea.txt");
	
	//快捷启动
	//example.generateTestcase(example.GeneralModeLightStartTrigger(10), "GeneralModeLightStartTrigger.txt");
	//example.generateTestcase(example.GeneralModeLightStartCancle(10), "GeneralModeLightStartCancle.txt");
	//example.generateTestcase(example.GeneralModeLightStartTriggerFail(10), "GeneralModeLightStartTriggerFail.txt");
	//example.generateTestcase(example.GeneralModeLightStartTwoFingerSameTD(10), "GeneralModeLightStartTwoFingerSameTD.txt");
	
	//手势文件
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

    return 0;
}

