package com.sulake.habbo.communication.messages.parser.availability
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class AvailabilityStatusMessageParser implements IMessageParser
   {
       
      
      private var var_902:Boolean;
      
      private var var_1088:Boolean;
      
      public function AvailabilityStatusMessageParser()
      {
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_902 = param1.readInteger() > 0;
         var_1088 = param1.readInteger() > 0;
         return true;
      }
      
      public function get isOpen() : Boolean
      {
         return var_902;
      }
      
      public function get onShutDown() : Boolean
      {
         return var_1088;
      }
      
      public function flush() : Boolean
      {
         var_902 = false;
         var_1088 = false;
         return true;
      }
   }
}
