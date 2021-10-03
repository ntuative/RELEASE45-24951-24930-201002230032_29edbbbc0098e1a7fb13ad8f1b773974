package com.sulake.habbo.communication.messages.parser.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class NotEnoughBalanceMessageParser implements IMessageParser
   {
       
      
      private var var_1212:int = 0;
      
      private var _notEnoughCredits:int = 0;
      
      public function NotEnoughBalanceMessageParser()
      {
         super();
      }
      
      public function get notEnoughPixels() : int
      {
         return var_1212;
      }
      
      public function flush() : Boolean
      {
         _notEnoughCredits = 0;
         var_1212 = 0;
         return true;
      }
      
      public function get notEnoughCredits() : int
      {
         return _notEnoughCredits;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         _notEnoughCredits = param1.readInteger();
         var_1212 = param1.readInteger();
         return true;
      }
   }
}
