package com.sulake.habbo.room.utils
{
   public class RoomInstanceData
   {
       
      
      private var var_857:LegacyWallGeometry = null;
      
      private var var_574:SelectedRoomObjectData = null;
      
      private var _roomCategory:int = 0;
      
      private var var_573:TileHeightMap = null;
      
      private var var_2123:String = null;
      
      private var _roomId:int = 0;
      
      private var var_858:RoomCamera = null;
      
      public function RoomInstanceData(param1:int, param2:int)
      {
         super();
         _roomId = param1;
         _roomCategory = param2;
         var_857 = new LegacyWallGeometry();
         var_858 = new RoomCamera();
      }
      
      public function set tileHeightMap(param1:TileHeightMap) : void
      {
         if(var_573 != null)
         {
            var_573.dispose();
         }
         var_573 = param1;
      }
      
      public function get roomId() : int
      {
         return _roomId;
      }
      
      public function set worldType(param1:String) : void
      {
         var_2123 = param1;
      }
      
      public function get legacyGeometry() : LegacyWallGeometry
      {
         return var_857;
      }
      
      public function get roomCamera() : RoomCamera
      {
         return var_858;
      }
      
      public function dispose() : void
      {
         if(var_573 != null)
         {
            var_573.dispose();
            var_573 = null;
         }
         if(var_857 != null)
         {
            var_857.dispose();
            var_857 = null;
         }
         if(var_858 != null)
         {
            var_858.dispose();
            var_858 = null;
         }
         if(var_574 != null)
         {
            var_574.dispose();
            var_574 = null;
         }
      }
      
      public function get tileHeightMap() : TileHeightMap
      {
         return var_573;
      }
      
      public function get worldType() : String
      {
         return var_2123;
      }
      
      public function set selectedObject(param1:SelectedRoomObjectData) : void
      {
         if(var_574 != null)
         {
            var_574.dispose();
         }
         var_574 = param1;
      }
      
      public function get roomCategory() : int
      {
         return _roomCategory;
      }
      
      public function get selectedObject() : SelectedRoomObjectData
      {
         return var_574;
      }
   }
}
