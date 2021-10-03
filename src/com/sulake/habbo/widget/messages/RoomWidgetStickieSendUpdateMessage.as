package com.sulake.habbo.widget.messages
{
   public class RoomWidgetStickieSendUpdateMessage extends RoomWidgetMessage
   {
      
      public static const const_343:String = "RWSUM_STICKIE_SEND_UPDATE";
      
      public static const const_656:String = "RWSUM_STICKIE_SEND_DELETE";
       
      
      private var var_632:String;
      
      private var var_138:int;
      
      private var var_180:String;
      
      public function RoomWidgetStickieSendUpdateMessage(param1:String, param2:int, param3:String = "", param4:String = "")
      {
         super(param1);
         var_138 = param2;
         var_180 = param3;
         var_632 = param4;
      }
      
      public function get objectId() : int
      {
         return var_138;
      }
      
      public function get text() : String
      {
         return var_180;
      }
      
      public function get colorHex() : String
      {
         return var_632;
      }
   }
}
