package com.sulake.habbo.room.messages
{
   public class RoomObjectAvatarCarryObjectUpdateMessage extends RoomObjectUpdateStateMessage
   {
       
      
      private var var_970:int;
      
      private var var_1176:String;
      
      public function RoomObjectAvatarCarryObjectUpdateMessage(param1:int, param2:String)
      {
         super();
         var_970 = param1;
         var_1176 = param2;
      }
      
      public function get itemType() : int
      {
         return var_970;
      }
      
      public function get itemName() : String
      {
         return var_1176;
      }
   }
}
