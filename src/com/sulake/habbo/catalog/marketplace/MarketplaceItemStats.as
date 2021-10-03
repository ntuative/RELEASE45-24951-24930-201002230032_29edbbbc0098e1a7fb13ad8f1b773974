package com.sulake.habbo.catalog.marketplace
{
   public class MarketplaceItemStats
   {
       
      
      private var var_1366:Array;
      
      private var var_1655:int;
      
      private var var_1658:int;
      
      private var var_1656:int;
      
      private var var_1654:int;
      
      private var _dayOffsets:Array;
      
      private var var_1657:int;
      
      private var var_1365:Array;
      
      public function MarketplaceItemStats()
      {
         super();
      }
      
      public function get dayOffsets() : Array
      {
         return _dayOffsets;
      }
      
      public function get averagePrices() : Array
      {
         return var_1366;
      }
      
      public function set averagePrices(param1:Array) : void
      {
         var_1366 = param1.slice();
      }
      
      public function set dayOffsets(param1:Array) : void
      {
         _dayOffsets = param1.slice();
      }
      
      public function get furniTypeId() : int
      {
         return var_1658;
      }
      
      public function set soldAmounts(param1:Array) : void
      {
         var_1365 = param1.slice();
      }
      
      public function set averagePrice(param1:int) : void
      {
         var_1655 = param1;
      }
      
      public function get historyLength() : int
      {
         return var_1656;
      }
      
      public function get furniCategoryId() : int
      {
         return var_1654;
      }
      
      public function get offerCount() : int
      {
         return var_1657;
      }
      
      public function set offerCount(param1:int) : void
      {
         var_1657 = param1;
      }
      
      public function get soldAmounts() : Array
      {
         return var_1365;
      }
      
      public function get averagePrice() : int
      {
         return var_1655;
      }
      
      public function set furniCategoryId(param1:int) : void
      {
         var_1654 = param1;
      }
      
      public function set historyLength(param1:int) : void
      {
         var_1656 = param1;
      }
      
      public function set furniTypeId(param1:int) : void
      {
         var_1658 = param1;
      }
   }
}
