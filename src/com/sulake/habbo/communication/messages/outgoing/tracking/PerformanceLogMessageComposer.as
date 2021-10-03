package com.sulake.habbo.communication.messages.outgoing.tracking
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class PerformanceLogMessageComposer implements IMessageComposer
   {
       
      
      private var var_1048:int = 0;
      
      private var var_1303:int = 0;
      
      private var var_2191:String = "";
      
      private var var_1047:int = 0;
      
      private var var_2189:String = "";
      
      private var var_2188:int = 0;
      
      private var var_1552:String = "";
      
      private var var_2192:int = 0;
      
      private var var_2190:int = 0;
      
      private var var_2193:String = "";
      
      private var var_2187:int = 0;
      
      public function PerformanceLogMessageComposer(param1:int, param2:String, param3:String, param4:String, param5:String, param6:Boolean, param7:int, param8:int, param9:int, param10:int, param11:int)
      {
         super();
         var_2192 = param1;
         var_2193 = param2;
         var_1552 = param3;
         var_2191 = param4;
         var_2189 = param5;
         if(param6)
         {
            var_1303 = 1;
         }
         else
         {
            var_1303 = 0;
         }
         var_2188 = param7;
         var_2190 = param8;
         var_1047 = param9;
         var_2187 = param10;
         var_1048 = param11;
      }
      
      public function getMessageArray() : Array
      {
         return [var_2192,var_2193,var_1552,var_2191,var_2189,var_1303,var_2188,var_2190,var_1047,var_2187,var_1048];
      }
      
      public function dispose() : void
      {
      }
   }
}
