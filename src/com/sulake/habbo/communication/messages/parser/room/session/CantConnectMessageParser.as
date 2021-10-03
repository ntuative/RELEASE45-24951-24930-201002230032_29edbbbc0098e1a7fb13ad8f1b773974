package com.sulake.habbo.communication.messages.parser.room.session
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class CantConnectMessageParser implements IMessageParser
   {
      
      public static const const_1535:int = 2;
      
      public static const const_314:int = 4;
      
      public static const const_1278:int = 1;
      
      public static const const_1244:int = 3;
       
      
      private var var_989:int = 0;
      
      private var var_812:String = "";
      
      public function CantConnectMessageParser()
      {
         super();
      }
      
      public function get reason() : int
      {
         return var_989;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_989 = param1.readInteger();
         if(var_989 == 3)
         {
            var_812 = param1.readString();
         }
         else
         {
            var_812 = "";
         }
         return true;
      }
      
      public function flush() : Boolean
      {
         var_989 = 0;
         var_812 = "";
         return true;
      }
      
      public function get parameter() : String
      {
         return var_812;
      }
   }
}
