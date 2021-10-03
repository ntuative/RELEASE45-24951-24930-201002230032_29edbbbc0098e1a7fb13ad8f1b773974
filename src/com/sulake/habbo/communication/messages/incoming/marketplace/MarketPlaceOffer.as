package com.sulake.habbo.communication.messages.incoming.marketplace
{
   public class MarketPlaceOffer
   {
       
      
      private var var_1126:int;
      
      private var var_1772:int = -1;
      
      private var var_345:int;
      
      private var var_1655:int;
      
      private var var_1690:int;
      
      private var _offerId:int;
      
      private var var_1125:int;
      
      private var var_1689:int;
      
      public function MarketPlaceOffer(param1:int, param2:int, param3:int, param4:int, param5:int, param6:int, param7:int, param8:int = -1)
      {
         super();
         _offerId = param1;
         var_1689 = param2;
         var_1690 = param3;
         var_1126 = param4;
         var_345 = param5;
         var_1772 = param6;
         var_1655 = param7;
         var_1125 = param8;
      }
      
      public function get status() : int
      {
         return var_345;
      }
      
      public function get price() : int
      {
         return var_1126;
      }
      
      public function get timeLeftMinutes() : int
      {
         return var_1772;
      }
      
      public function get offerCount() : int
      {
         return var_1125;
      }
      
      public function get offerId() : int
      {
         return _offerId;
      }
      
      public function get furniType() : int
      {
         return var_1690;
      }
      
      public function get averagePrice() : int
      {
         return var_1655;
      }
      
      public function get furniId() : int
      {
         return var_1689;
      }
   }
}
