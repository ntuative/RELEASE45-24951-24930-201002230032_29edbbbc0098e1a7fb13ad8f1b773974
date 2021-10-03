package com.sulake.habbo.help.cfh.data
{
   import com.sulake.core.utils.Map;
   
   public class UserRegistry
   {
      
      private static const const_1067:int = 80;
       
      
      private var var_467:Map;
      
      private var var_654:String = "";
      
      private var var_1172:Array;
      
      public function UserRegistry()
      {
         var_467 = new Map();
         var_1172 = new Array();
         super();
      }
      
      private function addRoomNameForMissing() : void
      {
         var _loc1_:* = null;
         while(false)
         {
            _loc1_ = var_467.getValue(var_1172.shift());
            if(_loc1_ != null)
            {
               _loc1_.roomName = var_654;
            }
         }
      }
      
      public function registerUser(param1:int, param2:String, param3:Boolean = true) : void
      {
         var _loc4_:* = null;
         if(var_467.getValue(param1) != null)
         {
            var_467.remove(param1);
         }
         if(param3)
         {
            _loc4_ = new UserRegistryItem(param1,param2,var_654);
         }
         else
         {
            _loc4_ = new UserRegistryItem(param1,param2);
         }
         if(param3 && var_654 == "")
         {
            var_1172.push(param1);
         }
         var_467.add(param1,_loc4_);
         purgeUserIndex();
      }
      
      public function getRegistry() : Map
      {
         return var_467;
      }
      
      public function unregisterRoom() : void
      {
         var_654 = "";
      }
      
      private function purgeUserIndex() : void
      {
         var _loc1_:int = 0;
         while(var_467.length > const_1067)
         {
            _loc1_ = var_467.getKey(0);
            var_467.remove(_loc1_);
         }
      }
      
      public function registerRoom(param1:String) : void
      {
         var_654 = param1;
         if(var_654 != "")
         {
            addRoomNameForMissing();
         }
      }
   }
}
