package com.sulake.room.renderer.cache
{
   import com.sulake.room.utils.IVector3d;
   import com.sulake.room.utils.Vector3d;
   
   public class RoomObjectLocationCacheItem
   {
       
      
      private var var_2005:int = -1;
      
      private var var_1163:int = -1;
      
      private var var_679:Vector3d = null;
      
      public function RoomObjectLocationCacheItem()
      {
         super();
         var_679 = new Vector3d();
      }
      
      public function get method_3() : int
      {
         return var_2005;
      }
      
      public function set method_3(param1:int) : void
      {
         var_2005 = param1;
      }
      
      public function set screenLoc(param1:IVector3d) : void
      {
         var_679.assign(param1);
         var_679.x = Math.round(var_679.x);
         var_679.y = Math.round(var_679.y);
      }
      
      public function set geometryUpdateId(param1:int) : void
      {
         var_1163 = param1;
      }
      
      public function get screenLoc() : IVector3d
      {
         return var_679;
      }
      
      public function get geometryUpdateId() : int
      {
         return var_1163;
      }
   }
}
