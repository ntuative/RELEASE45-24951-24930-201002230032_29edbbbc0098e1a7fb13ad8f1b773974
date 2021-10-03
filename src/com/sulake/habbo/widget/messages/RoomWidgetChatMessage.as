package com.sulake.habbo.widget.messages
{
   public class RoomWidgetChatMessage extends RoomWidgetMessage
   {
      
      public static const const_100:int = 0;
      
      public static const const_99:int = 1;
      
      public static const const_84:int = 2;
      
      public static const const_573:String = "RWCM_MESSAGE_CHAT";
       
      
      private var var_1308:int = 0;
      
      private var var_1610:String = "";
      
      private var var_180:String = "";
      
      public function RoomWidgetChatMessage(param1:String, param2:String, param3:int = 0, param4:String = "")
      {
         super(param1);
         var_180 = param2;
         var_1308 = param3;
         var_1610 = param4;
      }
      
      public function get recipientName() : String
      {
         return var_1610;
      }
      
      public function get chatType() : int
      {
         return var_1308;
      }
      
      public function get text() : String
      {
         return var_180;
      }
   }
}
