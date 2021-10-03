package com.sulake.habbo.widget.messages
{
   public class RoomWidgetDimmerSavePresetMessage extends RoomWidgetMessage
   {
      
      public static const const_611:String = "RWSDPM_SAVE_PRESET";
       
      
      private var _color:uint;
      
      private var var_1711:int;
      
      private var var_1715:int;
      
      private var var_1764:Boolean;
      
      private var var_924:int;
      
      public function RoomWidgetDimmerSavePresetMessage(param1:int, param2:int, param3:uint, param4:int, param5:Boolean)
      {
         super(const_611);
         var_1715 = param1;
         var_1711 = param2;
         _color = param3;
         var_924 = param4;
         var_1764 = param5;
      }
      
      public function get color() : uint
      {
         return _color;
      }
      
      public function get effectTypeId() : int
      {
         return var_1711;
      }
      
      public function get presetNumber() : int
      {
         return var_1715;
      }
      
      public function get brightness() : int
      {
         return var_924;
      }
      
      public function get apply() : Boolean
      {
         return var_1764;
      }
   }
}
