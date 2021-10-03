package com.sulake.habbo.widget.messages
{
   public class RoomWidgetChatSelectAvatarMessage extends RoomWidgetMessage
   {
      
      public static const const_637:String = "RWCSAM_MESSAGE_SELECT_AVATAR";
       
      
      private var _roomId:int;
      
      private var _roomCategory:int;
      
      private var var_138:int;
      
      public function RoomWidgetChatSelectAvatarMessage(param1:String, param2:int, param3:int, param4:int)
      {
         super(param1);
         var_138 = param2;
         _roomId = param3;
         _roomCategory = param4;
      }
      
      public function get objectId() : int
      {
         return var_138;
      }
      
      public function get roomId() : int
      {
         return _roomId;
      }
      
      public function get roomCategory() : int
      {
         return _roomCategory;
      }
   }
}
