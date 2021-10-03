package com.sulake.habbo.widget.messages
{
   public class RoomWidgetSelectOutfitMessage extends RoomWidgetMessage
   {
      
      public static const const_982:String = "select_outfit";
       
      
      private var var_2125:int;
      
      public function RoomWidgetSelectOutfitMessage(param1:int)
      {
         super(const_982);
         var_2125 = param1;
      }
      
      public function get outfitId() : int
      {
         return var_2125;
      }
   }
}
