package com.sulake.habbo.communication.messages.incoming.marketplace
{
   import flash.display.BitmapData;
   
   public class MarketPlaceOwnOffer
   {
      
      public static const const_1500:int = 2;
      
      public static const const_1441:int = 1;
      
      public static const const_1493:int = 0;
       
      
      private var var_1126:int;
      
      private var var_345:int;
      
      private var var_2330:int;
      
      private var _offerId:int;
      
      private var var_1690:int;
      
      private var var_1689:int;
      
      private var _image:BitmapData;
      
      public function MarketPlaceOwnOffer(param1:int, param2:int, param3:int, param4:int)
      {
         super();
         _offerId = param1;
         var_1689 = param2;
         var_1690 = param3;
         var_1126 = param4;
      }
      
      public function get furniId() : int
      {
         return var_1689;
      }
      
      public function get furniType() : int
      {
         return var_1690;
      }
      
      public function get price() : int
      {
         return var_1126;
      }
      
      public function set image(param1:BitmapData) : void
      {
         _image = param1;
      }
      
      public function get offerId() : int
      {
         return _offerId;
      }
      
      public function get image() : BitmapData
      {
         return _image;
      }
   }
}
