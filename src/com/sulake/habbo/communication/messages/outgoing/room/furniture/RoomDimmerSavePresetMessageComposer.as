package com.sulake.habbo.communication.messages.outgoing.room.furniture
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class RoomDimmerSavePresetMessageComposer implements IMessageComposer
   {
       
      
      private var var_1711:int;
      
      private var var_1715:int;
      
      private var var_1713:Boolean;
      
      private var var_1714:String;
      
      private var _roomId:int = 0;
      
      private var _roomCategory:int = 0;
      
      private var var_1712:int;
      
      public function RoomDimmerSavePresetMessageComposer(param1:int, param2:int, param3:String, param4:int, param5:Boolean, param6:int = 0, param7:int = 0)
      {
         super();
         _roomId = param6;
         _roomCategory = param7;
         var_1715 = param1;
         var_1711 = param2;
         var_1714 = param3;
         var_1712 = param4;
         var_1713 = param5;
      }
      
      public function getMessageArray() : Array
      {
         return [var_1715,var_1711,var_1714,var_1712,int(var_1713)];
      }
      
      public function dispose() : void
      {
      }
   }
}
