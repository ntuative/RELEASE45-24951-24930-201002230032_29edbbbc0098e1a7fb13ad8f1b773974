package com.sulake.habbo.toolbar
{
   public class ToolbarIconBouncer
   {
       
      
      private var var_1663:Number;
      
      private var var_516:Number = 0;
      
      private var var_1662:Number;
      
      private var var_515:Number;
      
      public function ToolbarIconBouncer(param1:Number, param2:Number)
      {
         super();
         var_1663 = param1;
         var_1662 = param2;
      }
      
      public function update() : void
      {
         var_515 += var_1662;
         var_516 += var_515;
         if(var_516 > 0)
         {
            var_516 = 0;
            var_515 = var_1663 * -1 * var_515;
         }
      }
      
      public function reset(param1:int) : void
      {
         var_515 = param1;
         var_516 = 0;
      }
      
      public function get location() : Number
      {
         return var_516;
      }
   }
}
