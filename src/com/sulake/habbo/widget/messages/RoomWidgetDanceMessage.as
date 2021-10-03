package com.sulake.habbo.widget.messages
{
   public class RoomWidgetDanceMessage extends RoomWidgetMessage
   {
      
      public static const const_516:String = "RWCM_MESSAGE_DANCE";
      
      public static const const_852:int = 0;
      
      public static const const_1168:Array = [2,3,4];
       
      
      private var var_73:int = 0;
      
      public function RoomWidgetDanceMessage(param1:int)
      {
         super(const_516);
         var_73 = param1;
      }
      
      public function get style() : int
      {
         return var_73;
      }
   }
}
