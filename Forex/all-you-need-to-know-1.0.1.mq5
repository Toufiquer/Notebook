/* ******************************************************  */
#include <Trade\Trade.mqh>
CTrade trade;
void OnTick()
  {
/*+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/
/*+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/
  //--Defining Variables for Information for Comment
   double myAccountBalance = AccountInfoDouble(ACCOUNT_BALANCE);
   double myAccountProfit = AccountInfoDouble(ACCOUNT_PROFIT);
   double myAccountEquity = AccountInfoDouble(ACCOUNT_EQUITY);
   
   //--Comment on and Retrieve Variables or Information
      Comment( "First Comment","\n",
               "Account Balance: ",myAccountBalance,"\n",
               "Account Profit: ", myAccountProfit,"\n",
               "Account Equity: ",myAccountEquity,"\n"
               );
               
/*+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/
/*+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/
   double Ask=NormalizeDouble(SymbolInfoDouble(_Symbol,SYMBOL_ASK),_Digits);
   double Bid=NormalizeDouble(SymbolInfoDouble(_Symbol,SYMBOL_BID),_Digits);
   double Balance=AccountInfoDouble(ACCOUNT_BALANCE);
   double Equity=AccountInfoDouble(ACCOUNT_EQUITY);
   if (Equity >= Balance){
      trade.Sell(0.1,NULL,Bid,0,(Bid-100 * _Point),NULL);
      trade.Buy(0.1,NULL,Ask,0,(Ask+100 * _Point),NULL);
   }
   
/*+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/
/*+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/
   
   // Create an Array
   MqlRates Pricelnformation[];
   // Sort it from current candle to oldes candle
   ArraySetAsSeries(Pricelnformation,true);
   // Copy price data into the array
   int Data=CopyRates(Symbol(), Period(),0,Bars(Symbol(),Period()), Pricelnformation);
   if (Pricelnformation[1].close > Pricelnformation[2].close) Comment ("It is going up");
   if (Pricelnformation[1].close < Pricelnformation[2].close) Comment ("It is going down");
   
   
/*+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/
/*+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/
   
      int PositionsForThisCurrencyPair=0; //local position-count variable
   for(int i=PositionsTotal()-1; i>=0; i--) // count all currency pair positions
   {
	   string symbol=PositionGetSymbol(i); // get position currency pair symbol
	   if (Symbol()==symbol) // if chart symbol equels position symbol 
      	{
      	   PositionsForThisCurrencyPair+=1 ; // add 1 to counter
      	}
    }// end of for loop
      Comment ("\n\n Positions For this currency pair: ", 
      PositionsForThisCurrencyPair); // chart text output
      
/*+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/
/*+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/
      
      
      
      
      double swapLongTrades = SymbolInfoDouble(Symbol(), SYMBOL_SWAP_LONG);
      double swapShortTrades = SymbolInfoDouble(Symbol(), SYMBOL_SWAP_SHORT);
      Comment (
            "Swap Long Trades: ",swapLongTrades,"\n",
            "Swap Short Trades: ",swapShortTrades,"\n"
      	);
      	
      	
/*+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/
/*+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/
      	
      	
      	
      		double HighestCandleM1;
         	double High[];
         	ArraySetAsSeries(High,true);
         	CopyHigh(_Symbol,PERIOD_M1,0,11,High);
         	HighestCandleM1= ArrayMaximum(High,0,11);

	Comment ("Highest candle within the last 10 candles: "+ HighestCandleM1);
}
/*+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/
/*+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/

void OnTick(){
datetime    tm=TimeCurrent();
MqlDateTime stm;
TimeToStruct(tm,stm);
int CURRENT_HOUR = (string)stm.hour;
//--- output date components
Comment(
   "Year: " +(string)stm.year
   +"\n Month: "+(string)stm.mon
   +"\n Day: "+(string)stm.day
   +"\n Hour: "+(string)stm.hour
   +"\n Minute: "+(string)stm.min
   +"\n Second: "+(string)stm.sec
   +"\n Day of the week: "+(string)stm.day_of_week
   +"\n Day of the year: "+(string)stm.day_of_year
   );
datetime DATE_AND_TIME=TimeLocal();
Comment(CURRENT_HOUR);
}
/*+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/
/*+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/
//+------------------------------------------------------------------+
//|                                                       tester.mq5 |
//|                                                  Copyright 2021, |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#include <Trade\Trade.mqh>
CTrade trade;
#property copyright "Copyright 2021,"
#property link      "https://www.mql5.com"
#property version   "1.00"

   double a = 1;
   double b = 1;
   
   double Ask=NormalizeDouble(SymbolInfoDouble(_Symbol,SYMBOL_ASK),_Digits);
   double Bid=NormalizeDouble(SymbolInfoDouble(_Symbol,SYMBOL_BID),_Digits);
   double Volume = 0.1;
   double TP = 100;
   double SL = 100;
//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
  {
//---
   return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
//---
   
  }
//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
void OnTick()
  {
//---
   
   if (a == b){
      //trade.Sell(0.1,NULL,Bid,0,(Bid-100 * _Point),NULL);
      //trade.Buy(0.1,NULL,Ask,0,(Ask+100 * _Point),NULL);
      trade.Buy(Volume,NULL,Ask,(Ask-SL * _Point),(Ask+TP * _Point),NULL);
      trade.Sell(Volume,NULL,Bid,(Bid+SL * _Point),(Bid-TP * _Point),NULL);
      a = 2;
   }
   
  }
/*+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/
/*+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/
//+------------------------------------------------------------------+
//|                                                    toufiquer.mq5 |
//|                                                  Copyright 2021, |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2021,"
#property link      "https://www.mql5.com"
#property version   "1.00"
//+------------------------------------------------------------------+
//---   Input Here
//+------------------------------------------------------------------+
#include<Trade\Trade.mqh>
CTrade trade;
input int                inpPeriod           = 14;          // Average period
input int                inpFastPeriod       =  2;          // Fast end period
input int                inpSlowPeriod       = 30;          // Slow end period
input ENUM_APPLIED_PRICE inpPrice            = PRICE_CLOSE; // Price
input int                inpCorrectionPeriod =  0;          // "Correction" period (<0 no correction,0 to 1 same as average)

const string TamplateName = "Corr AMA";
const int IndexAMA = 0;
const int IndexAMAM = 2;
double H1_AMA[];
double M15_AMA[];
double M5_AMA[];
double H1_AMAM[];
double M15_AMAM[];
double M5_AMAM[];
double Ask=NormalizeDouble(SymbolInfoDouble(_Symbol,SYMBOL_ASK),_Digits);
double Bid=NormalizeDouble(SymbolInfoDouble(_Symbol,SYMBOL_BID),_Digits);
//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
  {
//---
//---
   return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
//---
  }
//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
void OnTick()
  {
//---
   
   
     // create Corr-AMA For H1 IndexAMA
     string entry ="";
     int myH1_AMA = iCustom (_Symbol,PERIOD_H1,TamplateName,inpPeriod,inpFastPeriod,inpSlowPeriod,inpPrice,inpCorrectionPeriod);
     ArraySetAsSeries(H1_AMA,true);
     CopyBuffer(myH1_AMA,IndexAMA,0,3,H1_AMA);
     
     // create Corr-AMA For M15 IndexAMA
     int myM15_AMA = iCustom (_Symbol,PERIOD_M15,TamplateName,inpPeriod,inpFastPeriod,inpSlowPeriod,inpPrice,inpCorrectionPeriod);
     ArraySetAsSeries(M15_AMA,true);
     CopyBuffer(myM15_AMA,IndexAMA,0,3,M15_AMA);
     
     // create Corr-AMA For M5 IndexAMA
     int myM5_AMA = iCustom (_Symbol,PERIOD_M5,TamplateName,inpPeriod,inpFastPeriod,inpSlowPeriod,inpPrice,inpCorrectionPeriod);
     ArraySetAsSeries(M5_AMA,true);
     CopyBuffer(myM5_AMA,IndexAMA,0,3,M5_AMA);
     
     
     
     
     // create Corr-AMA For H1 IndexAMAM
     int myH1_AMAM = iCustom (_Symbol,PERIOD_H1,TamplateName,inpPeriod,inpFastPeriod,inpSlowPeriod,inpPrice,inpCorrectionPeriod);
     ArraySetAsSeries(H1_AMAM,true);
     CopyBuffer(myH1_AMAM,IndexAMAM,0,3,H1_AMAM);
     
     // create Corr-AMA For M15 IndexAMAM
     int myM15_AMAM = iCustom (_Symbol,PERIOD_M15,TamplateName,inpPeriod,inpFastPeriod,inpSlowPeriod,inpPrice,inpCorrectionPeriod);
     ArraySetAsSeries(M15_AMAM,true);
     CopyBuffer(myM15_AMAM,IndexAMAM,0,3,M15_AMAM);
     // create Corr-AMA For M5 IndexAMAM
     int myM5_AMAM = iCustom (_Symbol,PERIOD_M5,TamplateName,inpPeriod,inpFastPeriod,inpSlowPeriod,inpPrice,inpCorrectionPeriod);
     ArraySetAsSeries(M5_AMAM,true);
     CopyBuffer(myM5_AMAM,IndexAMAM,0,3,M5_AMAM);
     
     
     
     
     
   double Val_H1_AMA = NormalizeDouble(H1_AMA[0],6);
   double Val_M15_AMA = NormalizeDouble(M15_AMA[0],6);
   double Val_M5_AMA = NormalizeDouble(M5_AMA[0],6);
   
   double Val_H1_AMAM = NormalizeDouble(H1_AMAM[0],6);
   double Val_M15_AMAM = NormalizeDouble(M15_AMAM[0],6);
   double Val_M5_AMAM = NormalizeDouble(M5_AMAM[0],6);

   double H1_result = ( Val_H1_AMA - Val_H1_AMAM );
   double M15_result = ( Val_M15_AMA - Val_M15_AMAM );
   double M5_result = ( Val_M5_AMA - Val_M5_AMAM);
   
   double Print_H1_result = NormalizeDouble(H1_result,4);
   double Print_M15_result = NormalizeDouble(M15_result,4);
   double Print_M5_result = NormalizeDouble(M5_result,4);
   //-------------------------------------------------------------------------------------------
   int PositionsForThisCurrencyPair=0; //local position-count variable
   for(int i=PositionsTotal()-1; i>=0; i--) // count all currency pair positions
   {
	   string symbol=PositionGetSymbol(i); // get position currency pair symbol
	   if (Symbol()==symbol) // if chart symbol equels position symbol 
      	{
      	   PositionsForThisCurrencyPair+=1 ; // add 1 to counter
      	}
    }// end of for loop
      Comment ("\n\n Positions For this currency pair: ",
      PositionsForThisCurrencyPair); // chart text output
     
     
     
     if(PositionsForThisCurrencyPair <= 0){
        trade.Sell(0.10,NULL,Bid,(Bid+150 * _Point),(Bid-150 * _Point),NULL);
        trade.Buy(0.10,NULL,Ask,(Ask-150 * _Point),(Ask+150 * _Point),NULL);
     }
     
     
     
     
Print("H1 Result="+ Print_H1_result + "\n M15 Result=" + Print_M15_result + "\n M5 Result=" + Print_M5_result);
  }
//+------------------------------------------------------------------+

/*+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/
/*+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/
#include<Trade\Trade.mqh>
CTrade trade;
input int                inpPeriod  = 20;
input double             inpDivisor = 2.0;
input ENUM_APPLIED_PRICE inpPrice   = PRICE_CLOSE;
const int Index1 = 0;
const int Index2 = 1;
const int Index3 = 2;
double VOLUME = 0.1;
double TP = 66;
double SL = 66;
double sell_trade = 1;
double buy_trade = 1;


void OnTick()
{
      string entry ="";
      double Ask=NormalizeDouble(SymbolInfoDouble(_Symbol,SYMBOL_ASK),_Digits);
      double Bid=NormalizeDouble(SymbolInfoDouble(_Symbol,SYMBOL_BID),_Digits);
      
     double Hull_H4_Array[];
     int Hull_H4 = iCustom (_Symbol,PERIOD_H4,"Hull average 2",inpPeriod,inpDivisor,PRICE_CLOSE);
     ArraySetAsSeries(Hull_H4_Array,true);
     CopyBuffer(Hull_H4,Index2,0,5,Hull_H4_Array);
     
     
     double Hull_M15_Array[];
     int Hull_M15 = iCustom (_Symbol,PERIOD_M15,"Hull average 2",inpPeriod,inpDivisor,PRICE_CLOSE);
     ArraySetAsSeries(Hull_M15_Array,true);
     CopyBuffer(Hull_M15,Index2,0,5,Hull_M15_Array);
     
     // create  3
     double Hull_M5_Array[];
     int Hull_M5 = iCustom (_Symbol,_Period,"Hull average 2",inpPeriod,inpDivisor,PRICE_CLOSE);
     ArraySetAsSeries(Hull_M5_Array,true);
     CopyBuffer(Hull_M5,Index2,0,5,Hull_M5_Array);
      
     
   //-------------------------------------------------------------------------------------------
   int PositionsForThisCurrencyPair=0; //local position-count variable
   for(int i=PositionsTotal()-1; i>=0; i--) // count all currency pair positions
   {
	   string symbol=PositionGetSymbol(i); // get position currency pair symbol
	   if (Symbol()==symbol) // if chart symbol equels position symbol 
      	{
      	   PositionsForThisCurrencyPair+=1 ; // add 1 to counter
      	}
    }// end of for loop
     
 
   //-------------------------------------------------------------------------------------------    
   //-------------------------------------------------------------------------------------------
         datetime    tm=TimeCurrent();
      MqlDateTime stm;
      TimeToStruct(tm,stm);
      int CURRENT_HOUR = (string)stm.hour;
   //-------------------------------------------------------------------------------------------
   
   
      if(CURRENT_HOUR > 3){
      if(CURRENT_HOUR < 20){
      if(PositionsForThisCurrencyPair <= 0){
         //Buy
         if(Hull_H4_Array[1] == 1){
            if(Hull_M15_Array[1] == 1){
               if((Hull_M5_Array[1] == 1)&&(Hull_M5_Array[4] == 2)){
                  //
                  trade.Buy(VOLUME,_Symbol,Ask,(Bid+SL * _Point),(Ask+TP * _Point),"Buy Trade");
                  Print("\n Costom Write Buy Trade No: " + buy_trade);buy_trade++;
               }
            }
         }//Buy
         //Sell
         if(Hull_H4_Array[1] == 2){
            if(Hull_M15_Array[1] == 2){
               if((Hull_M5_Array[1] == 2)&&(Hull_M5_Array[4] == 1)){
                  //trade.Sell(VOLUME,NULL,Bid,(Ask+SL * _Point),(Bid+TP * _Point),"Sell Trade");
                  Print("\n Costom Write Sell Trade No: " + sell_trade);sell_trade++;
               }
            }
         }//Sell
         
      }}}

  }
  
/*+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/
/*+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/

/*+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/
/*+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/

/*+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/
/*+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/

/*+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/
/*+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/

/*+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/
/*+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/

/*+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/
/*+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/






 /* ******************************************************  */
//  https://mql5tutorial.com/mql5-tutorial-basics-47-simple-stochastic-ea/