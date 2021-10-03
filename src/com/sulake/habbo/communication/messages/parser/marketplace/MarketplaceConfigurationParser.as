package com.sulake.habbo.communication.messages.parser.marketplace
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class MarketplaceConfigurationParser implements IMessageParser
   {
       
      
      private var var_1573:int;
      
      private var var_1344:int;
      
      private var var_1575:int;
      
      private var var_1570:int;
      
      private var var_1569:int;
      
      private var var_1345:int;
      
      private var var_1571:int;
      
      private var var_1572:Boolean;
      
      public function MarketplaceConfigurationParser()
      {
         super();
      }
      
      public function get offerMaxPrice() : int
      {
         return var_1573;
      }
      
      public function get tokenBatchPrice() : int
      {
         return var_1344;
      }
      
      public function get averagePricePeriod() : int
      {
         return var_1571;
      }
      
      public function get offerMinPrice() : int
      {
         return var_1570;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get expirationHours() : int
      {
         return var_1569;
      }
      
      public function get tokenBatchSize() : int
      {
         return var_1345;
      }
      
      public function get commission() : int
      {
         return var_1575;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1572 = param1.readBoolean();
         var_1575 = param1.readInteger();
         var_1344 = param1.readInteger();
         var_1345 = param1.readInteger();
         var_1570 = param1.readInteger();
         var_1573 = param1.readInteger();
         var_1569 = param1.readInteger();
         var_1571 = param1.readInteger();
         return true;
      }
      
      public function get isEnabled() : Boolean
      {
         return var_1572;
      }
   }
}
