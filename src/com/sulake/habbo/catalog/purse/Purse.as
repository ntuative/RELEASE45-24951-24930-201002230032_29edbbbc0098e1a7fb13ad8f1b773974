package com.sulake.habbo.catalog.purse
{
   public class Purse implements IPurse
   {
       
      
      private var var_1719:int = 0;
      
      private var var_1717:int = 0;
      
      private var var_1716:int = 0;
      
      private var var_1718:int = 0;
      
      public function Purse()
      {
         super();
      }
      
      public function get pixels() : int
      {
         return var_1717;
      }
      
      public function set pixels(param1:int) : void
      {
         var_1717 = param1;
      }
      
      public function set clubDays(param1:int) : void
      {
         var_1719 = param1;
      }
      
      public function get credits() : int
      {
         return var_1716;
      }
      
      public function get clubDays() : int
      {
         return var_1719;
      }
      
      public function set clubPeriods(param1:int) : void
      {
         var_1718 = param1;
      }
      
      public function set credits(param1:int) : void
      {
         var_1716 = param1;
      }
      
      public function get clubPeriods() : int
      {
         return var_1718;
      }
   }
}
