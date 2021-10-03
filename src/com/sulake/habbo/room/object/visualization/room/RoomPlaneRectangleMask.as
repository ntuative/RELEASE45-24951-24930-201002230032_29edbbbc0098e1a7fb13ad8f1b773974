package com.sulake.habbo.room.object.visualization.room
{
   public class RoomPlaneRectangleMask
   {
       
      
      private var var_1787:Number = 0;
      
      private var var_1681:Number = 0;
      
      private var var_1680:Number = 0;
      
      private var var_1788:Number = 0;
      
      public function RoomPlaneRectangleMask(param1:Number, param2:Number, param3:Number, param4:Number)
      {
         super();
         var_1681 = param1;
         var_1680 = param2;
         var_1787 = param3;
         var_1788 = param4;
      }
      
      public function get leftSideLoc() : Number
      {
         return var_1681;
      }
      
      public function get leftSideLength() : Number
      {
         return var_1787;
      }
      
      public function get rightSideLoc() : Number
      {
         return var_1680;
      }
      
      public function get rightSideLength() : Number
      {
         return var_1788;
      }
   }
}
