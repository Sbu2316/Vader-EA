//+------------------------------------------------------------------+
//|                                                   VaderEA.mq5    |
//|                     Vader EA - CRT Trading System                |
//+------------------------------------------------------------------+
#property strict
#property version   "1.00"
#property description "Vader EA - CRT Trading System"

#include <Trade/Trade.mqh>

CTrade trade;

//--- Trading settings
input double LotSize = 0.01;
input int MagicNumber = 777001;

//--- CRT settings
input ENUM_TIMEFRAMES CRT_Timeframe = PERIOD_M15;
input ENUM_TIMEFRAMES Entry_Timeframe = PERIOD_M5;

//--- Trading symbols
input string Symbol1 = "XAUUSD";
input string Symbol2 = "NAS100";
input string Symbol3 = "US30";
input string Symbol4 = "BTCUSD";

//--- CRT variables
double CRT_High = 0.0;
double CRT_Low  = 0.0;

bool BullishSetup = false;
bool BearishSetup = false;

//+------------------------------------------------------------------+
//| Expert initialization                                            |
//+------------------------------------------------------------------+
int OnInit()
{
   trade.SetExpertMagicNumber(MagicNumber);

   Print("================================");
   Print("VADER EA INITIALIZED");
   Print("CRT Trading System");
   Print("Lot Size: ", LotSize);
   Print("================================");

   return(INIT_SUCCEEDED);
}

//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
void OnTick()
{
   UpdateCRT();

   CheckBullishCRT();
   CheckBearishCRT();
}

//+------------------------------------------------------------------+
//| Update CRT range                                                 |
//+------------------------------------------------------------------+
void UpdateCRT()
{
   MqlRates rates[];

   ArraySetAsSeries(rates, true);

   if(CopyRates(_Symbol, CRT_Timeframe, 1, 1, rates) != 1)
      return;

   CRT_High = rates[0].high;
   CRT_Low  = rates[0].low;
}

//+------------------------------------------------------------------+
//| Check bullish CRT                                                |
//+------------------------------------------------------------------+
void CheckBullishCRT()
{
   MqlRates rates[];

   ArraySetAsSeries(rates, true);

   if(CopyRates(_Symbol, Entry_Timeframe, 1, 2, rates) != 2)
      return;

   double previousLow = rates[1].low;
   double closedPrice = rates[0].close;

   // Price sweeps CRT low and closes back inside the range
   if(previousLow < CRT_Low && closedPrice > CRT_Low)
   {
      BullishSetup = true;
      BearishSetup = false;

      Print("VADER EA: BULLISH CRT SIGNAL");
   }
}

//+------------------------------------------------------------------+
//| Check bearish CRT                                                |
//+------------------------------------------------------------------+
void CheckBearishCRT()
{
   MqlRates rates[];

   ArraySetAsSeries(rates, true);

   if(CopyRates(_Symbol, Entry_Timeframe, 1, 2, rates) != 2)
      return;

   double previousHigh = rates[1].high;
   double closedPrice  = rates[0].close;

   // Price sweeps CRT high and closes back inside the range
   if(previousHigh > CRT_High && closedPrice < CRT_High)
   {
      BearishSetup = true;
      BullishSetup = false;

      Print("VADER EA: BEARISH CRT SIGNAL");
   }
}

//+------------------------------------------------------------------+
