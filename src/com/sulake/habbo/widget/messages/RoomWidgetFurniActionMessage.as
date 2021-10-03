package com.sulake.habbo.widget.messages
{
   public class RoomWidgetFurniActionMessage extends RoomWidgetMessage
   {
      
      public static const const_239:String = "RWFAM_MOVE";
      
      public static const const_511:String = "RWFUAM_ROTATE";
      
      public static const const_703:String = "RWFAM_PICKUP";
       
      
      private var var_1689:int = 0;
      
      private var var_1887:int = 0;
      
      public function RoomWidgetFurniActionMessage(param1:String, param2:int, param3:int)
      {
         super(param1);
         var_1689 = param2;
         var_1887 = param3;
      }
      
      public function get furniId() : int
      {
         return var_1689;
      }
      
      public function get furniCategory() : int
      {
         return var_1887;
      }
   }
}
