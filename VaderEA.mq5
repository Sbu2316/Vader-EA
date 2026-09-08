   //+------------------------------------------------------------------+
//|                                                   VaderEA.mq5    |
//|                 VADER EA - Candle Range Theory                   |
//+------------------------------------------------------------------+
#property strict
#property version "1.10"

#include <Trade/Trade.mqh>

CTrade trade;

//--- General settings
input double LotSize = 0.01;
input int MagicNumber = 777001;

//--- CRT settings
input ENUM_TIMEFRAMES CRT_Timeframe = PERIOD_M15;
input ENUM_TIMEFRAMES Entry_Timeframe = PERIOD_M5;

//--- Signal settings
input bool RequireCloseInsideRange = true;

//--- CRT range
double CRT_High = 0.0;
double CRT_Low  = 0.0;

//--- Prevent repeated signals
datetime LastSignalTime = 0;

//+------------------------------------------------------------------+
//| Expert initialization                                            |
//+------------------------------------------------------------------+
int OnInit()
{
   trade.SetExpertMagicNumber(MagicNumber);

   Print("=================================");
   Print("VADER EA v1.10");
   Print("CRT SIGNAL ENGINE");
   Print("Trading is currently DISABLED");
   Print("=================================");

   return(INIT_SUCCEEDED);
}

//+------------------------------------------------------------------+
//| Expert tick                                                      |
//+------------------------------------------------------------------+
void OnTick()
{
   UpdateCRTRange();

   CheckBullishCRT();
   CheckBearishCRT();

   DrawCRTLevels();
}

//+------------------------------------------------------------------+
//| Get the latest completed M15 candle                               |
//+------------------------------------------------------------------+
void UpdateCRTRange()
{
   MqlRates rates[];

   ArraySetAsSeries(rates, true);

   if(CopyRates(_Symbol, CRT_Timeframe, 1, 1, rates) != 1)
      return;

   CRT_High = rates[0].high;
   CRT_Low  = rates[0].low;
}

//+------------------------------------------------------------------+
//| Bullish CRT                                                      |
//+------------------------------------------------------------------+
void CheckBullishCRT()
{
   MqlRates rates[];

   ArraySetAsSeries(rates, true);

   if(CopyRates(_Symbol, Entry_Timeframe, 1, 2, rates) != 2)
      return;

   double sweepLow = rates[1].low;
   double closePrice = rates[0].close;

   bool sweptLow = sweepLow < CRT_Low;
   bool reclaimed = closePrice > CRT_Low;

   if(sweptLow && reclaimed)
   {
      datetime signalTime = rates[0].time;

      if(signalTime != LastSignalTime)
      {
         LastSignalTime = signalTime;

         Print("=================================");
         Print("VADER EA - BULLISH CRT");
         Print("CRT High: ", DoubleToString(CRT_High, _Digits));
         Print("CRT Low : ", DoubleToString(CRT_Low, _Digits));
         Print("Sweep   : ", DoubleToString(sweepLow, _Digits));
         Print("Close   : ", DoubleToString(closePrice, _Digits));
         Print("ACTION  : BUY SIGNAL");
         Print("=================================");
      }
   }
}

//+------------------------------------------------------------------+
//| Bearish CRT                                                      |
//+------------------------------------------------------------------+
void CheckBearishCRT()
{
   MqlRates rates[];

   ArraySetAsSeries(rates, true);

   if(CopyRates(_Symbol, Entry_Timeframe, 1, 2, rates) != 2)
      return;

   double sweepHigh = rates[1].high;
   double closePrice = rates[0].close;

   bool sweptHigh = sweepHigh > CRT_High;
   bool rejected = closePrice < CRT_High;

   if(sweptHigh && rejected)
   {
      datetime signalTime = rates[0].time;

      if(signalTime != LastSignalTime)
      {
         LastSignalTime = signalTime;

         Print("=================================");
         Print("VADER EA - BEARISH CRT");
         Print("CRT High: ", DoubleToString(CRT_High, _Digits));
         Print("CRT Low : ", DoubleToString(CRT_Low, _Digits));
         Print("Sweep   : ", DoubleToString(sweepHigh, _Digits));
         Print("Close   : ", DoubleToString(closePrice, _Digits));
         Print("ACTION  : SELL SIGNAL");
         Print("=================================");
      }
   }
}

//+------------------------------------------------------------------+
//| Draw CRT high and low                                            |
//+------------------------------------------------------------------+
void DrawCRTLevels()
{
   string highName = "VADER_CRT_HIGH";
   string lowName  = "VADER_CRT_LOW";

   if(ObjectFind(0, highName) < 0)
   {
      ObjectCreate(0, highName, OBJ_HLINE, 0, 0, CRT_High);
   }
   else
   {
      ObjectSetDouble(0, highName, OBJPROP_PRICE, CRT_High);
   }

   if(ObjectFind(0, lowName) < 0)
   {
      ObjectCreate(0, lowName, OBJ_HLINE, 0, 0, CRT_Low);
   }
   else
   {
      ObjectSetDouble(0, lowName, OBJPROP_PRICE, CRT_Low);
   }
}

//+------------------------------------------------------------------+
