package com.sulake.habbo.communication.messages.incoming.navigator
{
   public class RoomThumbnailObjectData
   {
       
      
      private var var_1418:int;
      
      private var var_1419:int;
      
      public function RoomThumbnailObjectData()
      {
         super();
      }
      
      public function get pos() : int
      {
         return var_1418;
      }
      
      public function set pos(param1:int) : void
      {
         this.var_1418 = param1;
      }
      
      public function getCopy() : RoomThumbnailObjectData
      {
         var _loc1_:RoomThumbnailObjectData = new RoomThumbnailObjectData();
         _loc1_.var_1418 = this.var_1418;
         _loc1_.var_1419 = this.var_1419;
         return _loc1_;
      }
      
      public function set imgId(param1:int) : void
      {
         this.var_1419 = param1;
      }
      
      public function get imgId() : int
      {
         return var_1419;
      }
   }
}
