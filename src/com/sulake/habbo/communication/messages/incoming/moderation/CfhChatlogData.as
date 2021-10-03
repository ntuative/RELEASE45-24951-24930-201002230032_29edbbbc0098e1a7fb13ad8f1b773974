package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class CfhChatlogData
   {
       
      
      private var var_1018:int;
      
      private var var_2204:int;
      
      private var var_1538:int;
      
      private var var_109:RoomChatlogData;
      
      public function CfhChatlogData(param1:IMessageDataWrapper)
      {
         super();
         var_1538 = param1.readInteger();
         var_2204 = param1.readInteger();
         var_1018 = param1.readInteger();
         var_109 = new RoomChatlogData(param1);
         Logger.log("READ CFHCHATLOGDATA: callId: " + var_1538);
      }
      
      public function get reportedUserId() : int
      {
         return var_1018;
      }
      
      public function get callerUserId() : int
      {
         return var_2204;
      }
      
      public function get callId() : int
      {
         return var_1538;
      }
      
      public function get room() : RoomChatlogData
      {
         return var_109;
      }
   }
}
