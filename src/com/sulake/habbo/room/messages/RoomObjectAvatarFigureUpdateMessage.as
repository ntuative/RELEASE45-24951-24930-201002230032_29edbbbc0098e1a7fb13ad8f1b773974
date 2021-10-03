package com.sulake.habbo.room.messages
{
   public class RoomObjectAvatarFigureUpdateMessage extends RoomObjectUpdateStateMessage
   {
       
      
      private var var_1905:String;
      
      private var var_545:String;
      
      public function RoomObjectAvatarFigureUpdateMessage(param1:String, param2:String = "")
      {
         super();
         var_545 = param1;
         var_1905 = param2;
      }
      
      public function get race() : String
      {
         return var_1905;
      }
      
      public function get figure() : String
      {
         return var_545;
      }
   }
}
