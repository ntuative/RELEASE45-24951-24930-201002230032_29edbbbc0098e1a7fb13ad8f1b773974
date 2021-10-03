package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class ChatlineData
   {
       
      
      private var var_1340:String;
      
      private var var_2147:int;
      
      private var var_2150:int;
      
      private var var_2149:int;
      
      private var var_2148:String;
      
      public function ChatlineData(param1:IMessageDataWrapper)
      {
         super();
         var_2147 = param1.readInteger();
         var_2149 = param1.readInteger();
         var_2150 = param1.readInteger();
         var_2148 = param1.readString();
         var_1340 = param1.readString();
      }
      
      public function get msg() : String
      {
         return var_1340;
      }
      
      public function get hour() : int
      {
         return var_2147;
      }
      
      public function get minute() : int
      {
         return var_2149;
      }
      
      public function get chatterName() : String
      {
         return var_2148;
      }
      
      public function get chatterId() : int
      {
         return var_2150;
      }
   }
}
