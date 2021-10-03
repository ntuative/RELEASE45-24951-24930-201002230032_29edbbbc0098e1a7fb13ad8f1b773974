package com.sulake.habbo.communication.messages.parser.users
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class ScrSendUserInfoMessageParser implements IMessageParser
   {
       
      
      private var var_2035:int;
      
      private var var_1206:String;
      
      private var var_2038:int;
      
      private var var_2036:int;
      
      private var var_2034:int;
      
      private var var_2037:Boolean;
      
      public function ScrSendUserInfoMessageParser()
      {
         super();
      }
      
      public function get productName() : String
      {
         return var_1206;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get hasEverBeenMember() : Boolean
      {
         return var_2037;
      }
      
      public function get responseType() : int
      {
         return var_2036;
      }
      
      public function get daysToPeriodEnd() : int
      {
         return var_2038;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1206 = param1.readString();
         var_2038 = param1.readInteger();
         var_2035 = param1.readInteger();
         var_2034 = param1.readInteger();
         var_2036 = param1.readInteger();
         var_2037 = param1.readBoolean();
         return true;
      }
      
      public function get memberPeriods() : int
      {
         return var_2035;
      }
      
      public function get periodsSubscribedAhead() : int
      {
         return var_2034;
      }
   }
}
