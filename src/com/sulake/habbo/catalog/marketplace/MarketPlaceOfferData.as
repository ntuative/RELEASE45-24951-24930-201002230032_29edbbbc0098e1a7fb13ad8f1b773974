package com.sulake.habbo.catalog.marketplace
{
   import flash.display.BitmapData;
   
   public class MarketPlaceOfferData
   {
       
      
      private var var_1773:int;
      
      private var var_1126:int;
      
      private var var_1655:int;
      
      private var var_1772:int = -1;
      
      private var var_345:int;
      
      private var var_1690:int;
      
      private var _image:BitmapData;
      
      private var _offerId:int;
      
      private var var_1125:int;
      
      private var var_1689:int;
      
      public function MarketPlaceOfferData(param1:int, param2:int, param3:int, param4:int, param5:int, param6:int, param7:int = -1)
      {
         super();
         _offerId = param1;
         var_1689 = param2;
         var_1690 = param3;
         var_1126 = param4;
         var_345 = param5;
         var_1655 = param6;
         var_1125 = param7;
      }
      
      public function set imageCallback(param1:int) : void
      {
         var_1773 = param1;
      }
      
      public function get imageCallback() : int
      {
         return var_1773;
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
      
      public function set timeLeftMinutes(param1:int) : void
      {
         var_1772 = param1;
      }
      
      public function dispose() : void
      {
         if(_image)
         {
            _image.dispose();
            _image = null;
         }
      }
      
      public function set price(param1:int) : void
      {
         var_1126 = param1;
      }
      
      public function set offerCount(param1:int) : void
      {
         var_1125 = param1;
      }
      
      public function get image() : BitmapData
      {
         return _image;
      }
      
      public function get status() : int
      {
         return var_345;
      }
      
      public function get averagePrice() : int
      {
         return var_1655;
      }
      
      public function set offerId(param1:int) : void
      {
         _offerId = param1;
      }
      
      public function set image(param1:BitmapData) : void
      {
         _image = param1;
      }
      
      public function get furniId() : int
      {
         return var_1689;
      }
   }
}
