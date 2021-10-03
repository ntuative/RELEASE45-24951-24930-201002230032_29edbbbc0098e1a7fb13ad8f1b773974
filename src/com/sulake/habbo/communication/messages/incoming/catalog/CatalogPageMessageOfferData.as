package com.sulake.habbo.communication.messages.incoming.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class CatalogPageMessageOfferData
   {
       
      
      private var var_781:Array;
      
      private var var_755:int;
      
      private var var_1121:String;
      
      private var _offerId:int;
      
      private var var_756:int;
      
      public function CatalogPageMessageOfferData(param1:IMessageDataWrapper)
      {
         super();
         _offerId = param1.readInteger();
         var_1121 = param1.readString();
         var_755 = param1.readInteger();
         var_756 = param1.readInteger();
         var _loc2_:int = param1.readInteger();
         var_781 = new Array();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            var_781.push(new CatalogPageMessageProductData(param1));
            _loc3_++;
         }
      }
      
      public function get products() : Array
      {
         return var_781;
      }
      
      public function get priceInCredits() : int
      {
         return var_755;
      }
      
      public function get localizationId() : String
      {
         return var_1121;
      }
      
      public function get offerId() : int
      {
         return _offerId;
      }
      
      public function get priceInPixels() : int
      {
         return var_756;
      }
   }
}
