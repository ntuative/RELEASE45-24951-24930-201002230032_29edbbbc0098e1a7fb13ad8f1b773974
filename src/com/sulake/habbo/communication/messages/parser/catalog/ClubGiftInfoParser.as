package com.sulake.habbo.communication.messages.parser.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.habbo.communication.messages.incoming.catalog.CatalogPageMessageOfferData;
   
   public class ClubGiftInfoParser implements IMessageParser
   {
       
      
      private var var_996:int;
      
      private var var_1599:int;
      
      private var var_517:Array;
      
      public function ClubGiftInfoParser()
      {
         super();
      }
      
      public function get giftsAvailable() : int
      {
         return var_996;
      }
      
      public function get daysUntilNextGift() : int
      {
         return var_1599;
      }
      
      public function flush() : Boolean
      {
         var_517 = [];
         return true;
      }
      
      public function get offers() : Array
      {
         return var_517;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1599 = param1.readInteger();
         var_996 = param1.readInteger();
         var_517 = new Array();
         var _loc2_:int = param1.readInteger();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            var_517.push(new CatalogPageMessageOfferData(param1));
            _loc3_++;
         }
         return true;
      }
   }
}
