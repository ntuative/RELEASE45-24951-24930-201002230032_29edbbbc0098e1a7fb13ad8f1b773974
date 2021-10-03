package com.sulake.habbo.inventory.purse
{
   public class Purse
   {
       
      
      private var var_1727:Boolean = false;
      
      private var var_1725:int = 0;
      
      private var var_1719:int = 0;
      
      private var var_1726:int = 0;
      
      private var var_1545:int = 0;
      
      private var var_1718:int = 0;
      
      public function Purse()
      {
         super();
      }
      
      public function set creditBalance(param1:int) : void
      {
         var_1545 = Math.max(0,param1);
      }
      
      public function get clubPastPeriods() : int
      {
         return var_1725;
      }
      
      public function get clubHasEverBeenMember() : Boolean
      {
         return var_1727;
      }
      
      public function set clubHasEverBeenMember(param1:Boolean) : void
      {
         var_1727 = param1;
      }
      
      public function set clubPastPeriods(param1:int) : void
      {
         var_1725 = Math.max(0,param1);
      }
      
      public function set clubDays(param1:int) : void
      {
         var_1719 = Math.max(0,param1);
      }
      
      public function get creditBalance() : int
      {
         return var_1545;
      }
      
      public function set pixelBalance(param1:int) : void
      {
         var_1726 = Math.max(0,param1);
      }
      
      public function get clubDays() : int
      {
         return var_1719;
      }
      
      public function get pixelBalance() : int
      {
         return var_1726;
      }
      
      public function set clubPeriods(param1:int) : void
      {
         var_1718 = Math.max(0,param1);
      }
      
      public function get clubPeriods() : int
      {
         return var_1718;
      }
   }
}
